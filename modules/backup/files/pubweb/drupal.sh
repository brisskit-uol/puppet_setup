#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at backing the admin DB up. 
#Olly Butters

#25/7/12

#To work I am assuming mysqldump is installed which is actually
#in mysql-client


#The only things I need are:
#-admin mysql DB


#Start with the DB. 
#I assume I am running on the camp box, so have access...

LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/customer/

#How long to keep backups for (DAYS)
MAX_BACKUP_FILE_AGE=1
#####################################################################
#Nothing to see/edit below here!

echo "  Starting dump on admin VM"


#####################################################################
#Delete some old files
#####################################################################
echo "  Deleting files over ${MAX_BACKUP_FILE_AGE} days old."
find ${LOCAL_FILE_DIR}*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm -v {} \; 2>/dev/null



cd ${LOCAL_FILE_DIR}

dbhost="$(brisskit_db_param admin host)"
dbname="$(brisskit_db_param admin name)"
dbuser="$(brisskit_db_param admin user)"
dbpass="$(brisskit_db_param admin pass)"

dump="mysqldump --host=$dbhost --user=$dbuser --password=$dbpass $dbname"

#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo "  Datetime stamp: "$datetime

#Make the directory to put this in
dir_name="${datetime}_admin"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Do the mysqldump
${dump} > admin.sql

cd ../

echo "  Dumpfile: "${dir_name}".tar.gz"

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

echo "  Finished dump on admin VM"
