#!/bin/bash

#Have a go at backing redcap up.
#Olly Butters

#4/4/12

#The only things I need are:
#-recap mysql DB
#-edocs directory -> where user desiged questionnaire images go.
#-Salt value????

#Where do the user answer images go?



#Start with the DB. 
#I assume I am running on the redcap box, so have access...

ROOT_DIR="/var/local/brisskit/"

getdbparam() {
        local field=$1
        local conf="/etc/brisskit/mysql/redcap.cfg"

        if [ -f "${conf}" ]
        then
            sed -n 's/^'"${field}"'=\(.\{1,\}\)$/\1/p' "${conf}"
        else
            echo ""
        fi
        }

dbname="$(getdbparam 'name')"
dbuser="$(getdbparam 'user')"
dbpass="$(getdbparam 'pass')"

#dbpass="redcap"

dump="mysqldump --host=bru1-mysql --user=$dbuser --password=$dbpass $dbname"
echo $dump


#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo $datetime

#Make the directory to put this in
dir_name="${datetime}_redcap"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Do the mysqldump
${dump} > redcap.sql

#Copy the edocs file
rsync -a ${ROOT_DIR}redcap/www/redcap/edocs . 

#Copy the database.php file - has the salt variable in it
cp ${ROOT_DIR}redcap/www/redcap/database.php .

#Copy the database settings
cp ${ROOT_DIR}redcap/www/redcap/mysql_settings.php .

cd ../

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

 

