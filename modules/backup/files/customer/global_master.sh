#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at running the full back up.
#Olly Butters

#This needs to be run as master_backup user as keys have been shared around.

#30/7/12

#####################################################################
#Our local directories.
#####################################################################
LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/customer/
LOCAL_LOG_DIR=${LOCAL_ROOT_DIR}backup/log/

#The directories on the remote machines.
REMOTE_ROOT_DIR="/var/local/brisskit/"
REMOTE_FILE_DIR=${REMOTE_ROOT_DIR}backup/files/customer/
REMOTE_SOURCE_DIR=${REMOTE_ROOT_DIR}backup/source/


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
echo "Starting global master at: ${datetime}"

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
	echo "Starting global backup at ${datetime}" > "${LOCAL_LOG_FILE}"

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
#bru1
#####################################################################
echo -e "\n----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------BRU1--------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "Starting bru1 at: "`date` >> ${LOCAL_LOG_FILE}

#Where the remote backup script lives
VAPP_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}vapp_master.sh

#Run the backup script
#ssh vapp_backup@bru1 ${VAPP_BACKUP_SOURCE} >> ${LOCAL_LOG_FILE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}bru1" ]
then
	mkdir "${LOCAL_FILE_DIR}bru1"
fi

#Copy the files across
#rsync -a --omit-dir-times vapp_backup@bru1:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}bru1/ >> ${LOCAL_LOG_FILE}


echo "Finished bru1 at: "`date` >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo -e "----------------------------------------------\n" >> ${LOCAL_LOG_FILE}
#####################################################################




#####################################################################
#bru3
#####################################################################
echo -e "\n----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------BRU3--------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "Starting bru3 at: "`date` >> ${LOCAL_LOG_FILE}

#Where the remote backup script lives
VAPP_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}vapp_master.sh

#Run the backup script
#ssh vapp_backup@bru3 ${VAPP_BACKUP_SOURCE} >> ${LOCAL_LOG_FILE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}bru3" ]
then
        mkdir "${LOCAL_FILE_DIR}bru3"
fi

#Copy the files across
#rsync -a --omit-dir-times vapp_backup@bru3:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}bru3/ >> ${LOCAL_LOG_FILE}


echo "Finished bru3 at: "`date` >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo -e "----------------------------------------------\n" >> ${LOCAL_LOG_FILE}
#####################################################################

####################
#Parameterized
THIS_VAPP="demo"

echo -e "\n----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------${THIS_VAPP}--------------------------------" >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo "Starting ${THIS_VAPP} at: "`date` >> ${LOCAL_LOG_FILE}

#Where the remote backup script lives
VAPP_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}vapp_master.sh

#Run the backup script
ssh vapp_backup@${THIS_VAPP} ${VAPP_BACKUP_SOURCE} >> ${LOCAL_LOG_FILE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}${THIS_VAPP}" ]
then
        mkdir "${LOCAL_FILE_DIR}${THIS_VAPP}"
fi

#Copy the files across
rsync -a --omit-dir-times vapp_backup@${THIS_VAPP}:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}${THIS_VAPP}/ >> ${LOCAL_LOG_FILE}


echo "Finished ${THIS_VAPP} at: "`date` >> ${LOCAL_LOG_FILE}
echo "----------------------------------------------" >> ${LOCAL_LOG_FILE}
echo -e "----------------------------------------------\n" >> ${LOCAL_LOG_FILE}
#####################################################################





echo "Finished global master at: "`date` >> ${LOCAL_LOG_FILE}


