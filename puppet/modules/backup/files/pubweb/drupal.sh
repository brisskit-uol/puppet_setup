#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at backing the drupal and civcrm DBs up. 
#Olly Butters

#17/7/12

#To work I am assuming mysqldump is installed which is actually
#in mysql-client

LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/pubweb/

#How long to keep backups for (DAYS)
MAX_BACKUP_FILE_AGE=7
#####################################################################
#Nothing to see/edit below here!

echo "  Starting dump on drupal VM"


#####################################################################
#Delete some old files
#####################################################################
echo "  Deleting files over ${MAX_BACKUP_FILE_AGE} days old."
find ${LOCAL_FILE_DIR}*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm -v {} \; 2>/dev/null

cd ${LOCAL_FILE_DIR}

#Drupal first
dbhost="$(brisskit_db_param drupal host)"
dbname="$(brisskit_db_param drupal name)"
dbuser="$(brisskit_db_param drupal user)"
dbpass="$(brisskit_db_param drupal pass)"

dump="mysqldump --host=$dbhost --user=$dbuser --password=$dbpass $dbname"

#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo "  Datetime stamp: "$datetime

#Make the directory to put this in
dir_name="${datetime}_drupal"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Do the mysqldump
${dump} > drupal.sql

cd ../

echo "  Dumpfile: "${dir_name}".tar.gz"

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

#Now do civicrm 
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


echo "  Finished dump on drupal VM"
