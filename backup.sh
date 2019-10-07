#!/bin/bash
aws s3 ls sql.pozitiff.ua-bak/ | while read -r line;
       do
        createDate=`echo $line|awk {'print $1" "$2'}`
        createDate=`date -d"$createDate" +%s`
        olderThan=`date --date "2 days ago" +%s`
        if [[ $createDate -lt $olderThan ]]
           then
            fileName=`echo $line|awk {'print $4'}`

            if [[ $fileName != "" ]]
            then
                    aws s3 rm sql.pozitiff.ua-bak/$fileName
            fi
       fi

       done;

rm -rf /home/ubuntu/percona-full-backup-*

/usr/bin/mysqldump --defaults-extra-file=/home/ubuntu/.my.cnf -h0.0.0.0 -P3306 --single-transaction --quick --lock-tables=false --all-databases > /home/ubuntu/percona-full-backup-$(date +\%F).sql

aws s3 cp percona-full-backup-* s3://sql.pozitiff.ua-bak
