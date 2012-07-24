#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at running the full back up.
#Olly Butters

#This needs to be run as master_backup user as keys have been shared around.

#13/7/12

#####################################################################
#Our local directories.
LOCAL_ROOT_DIR="/var/local/brisskit/"
LOCAL_FILE_DIR=${LOCAL_ROOT_DIR}backup/files/


#The directories on the remote machines.
REMOTE_ROOT_DIR="/var/local/brisskit/"
REMOTE_FILE_DIR=${REMOTE_ROOT_DIR}backup/files/
REMOTE_SOURCE_DIR=${REMOTE_ROOT_DIR}backup/source/

#####################################################################
#Open some logs etc

echo "Starting global master at: "`date`

#####################################################################
#bru1
#####################################################################
echo -e "\n----------------------------------------------"
echo "----------------------------------------------"
echo "Starting bru1 at: "`date`

#Where the remote backup script lives
VAPP_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}vapp_master.sh

#Run the backup script
ssh vapp_backup@bru1 ${VAPP_BACKUP_SOURCE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}bru1" ]
then
	mkdir "${LOCAL_FILE_DIR}bru1"
fi

#Copy the files across
rsync -a --omit-dir-times vapp_backup@bru1:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}bru1/


echo "Finished bru1 at: "`date`
echo "----------------------------------------------"
echo -e "----------------------------------------------\n"
#####################################################################




#####################################################################
#bru3
#####################################################################
echo -e "\n----------------------------------------------"
echo "----------------------------------------------"
echo "Starting bru3 at: "`date`

#Where the remote backup script lives
VAPP_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}vapp_master.sh

#Run the backup script
ssh vapp_backup@bru3 ${VAPP_BACKUP_SOURCE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}bru3" ]
then
        mkdir "${LOCAL_FILE_DIR}bru3"
fi

#Copy the files across
rsync -a --omit-dir-times vapp_backup@bru3:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}bru3/


echo "Finished bru3 at: "`date`
echo "----------------------------------------------"
echo -e "----------------------------------------------\n"
#####################################################################







echo "Finished global master at: "`date`


