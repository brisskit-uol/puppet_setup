#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at running the  maven back up.
#Olly Butters

#This needs to be run as master_backup user as keys have been shared around.

#22/2/13

#####################################################################
#Our local directories.
#####################################################################
LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/ga/
LOCAL_LOG_DIR=${LOCAL_ROOT_DIR}backup/log/

#The directories on the remote machines.
REMOTE_ROOT_DIR="/var/local/brisskit/"
REMOTE_FILE_DIR=${REMOTE_ROOT_DIR}sonatype-work/
#REMOTE_SOURCE_DIR=${REMOTE_ROOT_DIR}backup/source/
#REMOTE_WEB_FILES=${REMOTE_ROOT_DIR}ga

#How long to keep backups for on the ga-backup VM (DAYS)
#MAX_BACKUP_FILE_AGE=7
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
echo "Starting maven master at: ${datetime}"

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
	echo "Starting maven backup at ${datetime}" > "${LOCAL_LOG_FILE}"

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
#echo "Deleting files over ${MAX_BACKUP_FILE_AGE} days old." >> ${LOCAL_LOG_FILE}
#find ${LOCAL_FILE_DIR}*/*/*.tar.gz -mtime +${MAX_BACKUP_FILE_AGE} -type f -exec rm {} \; 2>/dev/null


#####################################################################
#maven
#####################################################################
echo -e "\n----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------MAVEN--------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "Starting maven backup at: "`date` >> ${LOCAL_LOG_FILE}

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}maven/files" ]
then
	mkdir -p "${LOCAL_FILE_DIR}maven/files"
fi

#Now copy the file tree across
rsync -a --omit-dir-times --no-perms --delete ga_backup@maven2:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}maven/files/ >> ${LOCAL_LOG_FILE}


echo "Finished maven backup at: "`date` >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo -e "----------------------------------------------\n" >> ${LOCAL_LOG_FILE}
#####################################################################




echo "Finished maven master at: "`date` >> ${LOCAL_LOG_FILE}


