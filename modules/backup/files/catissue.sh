#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at backing catissue up.
#Olly Butters

#23/6/12

#To work I am assuming mysqldump is installed which is actually
#in mysql-client


#The only things I need are:
#-catissue mysql DB
# other stuff???


#Start with the DB. 
#I assume I am running on the onyx box, so have access...

ROOT_DIR="/var/local/brisskit/"
FILE_DIR=${ROOT_DIR}backup/files/


echo "Starting dump on catissue VM"

cd ${FILE_DIR}

dbhost="$(brisskit_db_param catissue host)"
dbname="$(brisskit_db_param catissue name)"
dbuser="$(brisskit_db_param catissue user)"
dbpass="$(brisskit_db_param catissue pass)"

dump="mysqldump --host=$dbhost --user=$dbuser --password=$dbpass $dbname"

#Make a date-time stamp to label this as.
datetime=$(date +"%Y-%m-%d-%H-%M")
echo "Datetime stamp: "$datetime

#Make the directory to put this in
dir_name="${datetime}_catissue"
mkdir $dir_name

#Move to the back up directory
cd $dir_name

#Do the mysqldump
${dump} > catissue.sql

cd ../

echo "Dumpfile: "${dir_name}".tar.gz"

#tar everything up
tar -czf ${dir_name}.tar.gz ${dir_name}

#delete the directory
rm -r ${dir_name}

echo "Finished dump on catissue VM"
