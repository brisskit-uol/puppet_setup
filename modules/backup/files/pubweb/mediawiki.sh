#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at backing the mediawiki DB up. 
#Olly Butters

#20/11/12

#To work I am assuming mysqldump is installed which is actually
#in mysql-client

LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/pubweb/

#How long to keep backups for (DAYS)
MAX_BACKUP_FILE_AGE=7
#####################################################################
#Nothing to see/edit below here!

echo "  Starting dump on mediawiki VM"


#####################################################################
#Delete some old files
#####################################################################
echo "  Deleting files over ${MAX_BACKUP_FILE_AGE} days old."
find ${LOCAL_FILE_DIR}*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm -v {} \; 2>/dev/null

cd ${LOCAL_FILE_DIR}

#
dbhost="$(brisskit_db_param wiki host)"
dbname="$(brisskit_db_param wiki name)"
dbuser="$(brisskit_db_param wiki user)"
dbpass="$(brisskit_db_param wiki pass)"

dump="mysqldump --host=$dbhost --user=$dbuser --password=$dbpass $dbname"

#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo "  Datetime stamp: "$datetime

#Make the directory to put this in
dir_name="${datetime}_wiki"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Do the mysqldump
${dump} > wiki.sql

#Lets do a dump with the mediawiki script too. This will give us an xml file that 
#we can restore CONTENT with, but not users, stats, images etc. Current will give
#us the current state of the wiki, i.e. no history. Full gives us all edits ever.
php /var/local/brisskit/mediawiki/w/maintenance/dumpBackup.php --current > current.xml
php /var/local/brisskit/mediawiki/w/maintenance/dumpBackup.php --full > full.xml

cd ../

echo "  Dumpfile: "${dir_name}".tar.gz"

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

echo "  Finished dump on wiki VM"
