#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at running the puppet back up.
#Olly Butters

#This needs to be run as master_backup user as keys have been shared around.

#16/11/12

#####################################################################
#Our local directories.
#####################################################################
LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/pubweb/
LOCAL_LOG_DIR=${LOCAL_ROOT_DIR}backup/log/

#The directories on the remote machines.
REMOTE_ROOT_DIR="/var/local/brisskit/"
REMOTE_FILE_DIR=${REMOTE_ROOT_DIR}backup/files/pubweb/
REMOTE_SOURCE_DIR=${REMOTE_ROOT_DIR}backup/source/
REMOTE_WEB_FILES=${REMOTE_ROOT_DIR}mediawiki

#How long to keep backups for on the ga-backup VM (DAYS)
MAX_BACKUP_FILE_AGE=7
#####################################################################
#Nothing to see/edit below here!
#####################################################################



#####################################################################
#Check we have everything we need here to start
#####################################################################
#Check target file dir exists
if [ ! -d "${LOCAL_FILE_DIR}" ]
then
        mkdir "${LOCAL_FILE_DIR}"
fi

#Check target log dir exists
if [ ! -d "${LOCAL_LOG_DIR}" ]
then
        mkdir "${LOCAL_LOG_DIR}"
fi



#####################################################################
#Open some logs etc
#####################################################################

#Make a date-time stamp to label logs as.
datetime=$(date +"%Y-%m-%d-%H-%M-%S")
echo "Starting puppet master at: ${datetime}"

#Define the log file name
LOCAL_LOG_FILE=${LOCAL_LOG_DIR}${datetime}.log

echo "Going to log to ${LOCAL_LOG_FILE}"

#Make the log file
if [[ -a $LOCAL_LOG_FILE ]]
    then
	#This really shouldn't already exist!
	echo "ERROR! - ${LOCAL_LOG_FILE} already exists. Giving up!"
	exit
    else
	#Write to file
	echo "Starting mediawiki backup at ${datetime}" > "${LOCAL_LOG_FILE}"

	#Check that it was made ok
	if [[ ! -a $LOCAL_LOG_FILE ]]
    	then
		echo "ERROR! - Could not make ${LOCAL_LOG_FILE}. Giving up!"
		exit
	fi
fi

#####################################################################
#Delete some old files
#####################################################################
echo "Deleting files over ${MAX_BACKUP_FILE_AGE} days old." >> ${LOCAL_LOG_FILE}
find ${LOCAL_FILE_DIR}*/*/*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm {} \; 2>/dev/null


#####################################################################
#mediawiki
#####################################################################
echo -e "\n----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------MEDIAWIKI--------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "Starting mediawiki backup at: "`date` >> ${LOCAL_LOG_FILE}

#Do the database dump and copy first

#Where the remote backup script lives
BACKUP_SOURCE=${REMOTE_SOURCE_DIR}mediawiki.sh

#Run the backup script
ssh pubweb_backup@pub-wiki-2 ${BACKUP_SOURCE} >> ${LOCAL_LOG_FILE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}mediawiki" ]
then
	mkdir "${LOCAL_FILE_DIR}mediawiki"
fi

if [ ! -d "${LOCAL_FILE_DIR}mediawiki/database" ]
then
        mkdir "${LOCAL_FILE_DIR}mediawiki/database"
fi

if [ ! -d "${LOCAL_FILE_DIR}mediawiki/files" ]
then
        mkdir "${LOCAL_FILE_DIR}mediawiki/files"
fi


#Copy the DB dumps across
rsync -a --omit-dir-times --no-perms pubweb_backup@pub-wiki-2:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}mediawiki/database/ >> ${LOCAL_LOG_FILE}


#Now copy the file tree across
rsync -a --omit-dir-times --no-perms --delete pubweb_backup@pub-wiki-2:${REMOTE_WEB_FILES}* ${LOCAL_FILE_DIR}mediawiki/files/ >> ${LOCAL_LOG_FILE}


echo "Finished mediawiki backup at: "`date` >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo -e "----------------------------------------------\n" >> ${LOCAL_LOG_FILE}
#####################################################################




echo "Finished mediawiki master at: "`date` >> ${LOCAL_LOG_FILE}


