#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at backing civicrm up.
#Olly Butters

#9/6/12

#To work I am assuming mysqldump is installed which is actually
#in mysql-client


#The only things I need are:
#-civicrm mysql DB
# other stuff???


#Start with the DB. 
#I assume I am running on the civi box, so have access...

LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/customer/

#How long to keep backups for (DAYS)
MAX_BACKUP_FILE_AGE=1
#####################################################################
#Nothing to see/edit below here!

#####################################################################
#Delete some old files
#####################################################################
echo "  Deleting files over ${MAX_BACKUP_FILE_AGE} days old."
find ${LOCAL_FILE_DIR}*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm {} \; 2>/dev/null




echo "  Starting dump on civicrm VM"

cd ${LOCAL_FILE_DIR}

dbhost="$(brisskit_db_param civicrm host)"
dbname="$(brisskit_db_param civicrm name)"
dbuser="$(brisskit_db_param civicrm user)"
dbpass="$(brisskit_db_param civicrm pass)"

dump="mysqldump --host=$dbhost --user=$dbuser --password=$dbpass $dbname"

#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo "  Datetime stamp: "$datetime

#Make the directory to put this in
dir_name="${datetime}_civicrm"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Do the mysqldump
${dump} > civicrm.sql

cd ../

echo "  Dumpfile: "${dir_name}".tar.gz"

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

echo "  Finished dump on civicrm VM"
