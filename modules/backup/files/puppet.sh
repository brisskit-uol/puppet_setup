#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at backing puppet up.
#Olly Butters

#30/6/12

LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/ga/

#How long to keep backups for (DAYS)
MAX_BACKUP_FILE_AGE=1
#####################################################################
#Nothing to see/edit below here!


echo "  Starting backup on puppet VM"

#####################################################################
#Delete some old files
#####################################################################
echo "  Deleting files over ${MAX_BACKUP_FILE_AGE} days old."
find ${LOCAL_FILE_DIR}*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm -v {} \; 2>/dev/null


cd ${LOCAL_FILE_DIR}

#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo "  Datetime stamp: "$datetime

#Make the directory to put this in
dir_name="${datetime}_puppet"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Copy the files across
rsync -a /var/lib/puppet .


cd ../

echo "  Dumpfile: "${dir_name}".tar.gz"

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

echo "  Finished backing up puppet VM"
