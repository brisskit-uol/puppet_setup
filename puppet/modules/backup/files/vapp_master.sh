#!/bin/bash

#####################################################################
#This file is managed by puppet. Do not edit as changes will be lost!
#####################################################################

#Have a go at running the full back up.
#Olly Butters

#23/7/12

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

echo " Starting vapp_master at: "`date`

#####################################################################
#admin. Should just be the admin VM for now
#####################################################################
echo -e "\n ----------------------------------------------"
echo " Starting admin at: "`date`

#Where the remote backup script lives
ADMIN_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}admin.sh

#Run the backup script
${ADMIN_BACKUP_SOURCE}

#Check return value

#Check file exists

#Check target dir exists
if [ ! -d "${LOCAL_FILE_DIR}admin" ]
then
	mkdir "${LOCAL_FILE_DIR}admin"
fi

#Copy the files across
mv ${REMOTE_FILE_DIR}*.tar.gz ${LOCAL_FILE_DIR}admin/


echo " Finished admin at: "`date`
echo -e " ----------------------------------------------"
#####################################################################



#####################################################################
#Do civicrm
#####################################################################
echo -e "\n ----------------------------------------------"
echo " Starting civicrm at: "`date`

#Where the remote backup script lives
CIVICRM_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}civicrm.sh



#Check if VM is pingable. It might be down, or they might not
#have this service installed.

ping -c 1 -w 5 civicrm > /dev/null
if [ $? -eq 0 ]
then
  
  #Its up, so lets do the backup
  echo " civicrm is up!"

  #Run the backup script
  ssh vm_backup@civicrm $CIVICRM_BACKUP_SOURCE

  #Check return value

  #Check file exists

  #Check target dir exists
  if [ ! -d "${LOCAL_FILE_DIR}civicrm" ]
  then
          mkdir "${LOCAL_FILE_DIR}civicrm"
  fi

  #Copy the files across
  rsync vm_backup@civicrm:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}civicrm/

else
  
  #Its down, so lets not even bother.
  echo " civicrm is down!"

fi

echo " Finished civicrm at: "`date`
echo " ----------------------------------------------"
#####################################################################

#####################################################################
#catissue
#####################################################################



#####################################################################

#####################################################################
#onyx
#####################################################################
echo -e "\n ----------------------------------------------"
echo " Starting onyx at: "`date`

#Where the remote backup script lives
ONYX_BACKUP_SOURCE=${REMOTE_SOURCE_DIR}onyx.sh


#Check if VM is pingable. It might be down, or they might not
#have this service installed.
ping -c 1 -w 5 onyx &> /dev/null 
if [ $? -eq 0 ]
then

  #Its up, so lets do the backup
  echo " onyx is up!"

  #Run the backup script
  ssh vm_backup@onyx $ONYX_BACKUP_SOURCE

  #Check return value

  #Check file exists

  #Check target dir exists
  if [ ! -d "${LOCAL_FILE_DIR}onyx" ]
  then
          mkdir "${LOCAL_FILE_DIR}onyx"
  fi

  #Copy the files across
  rsync vm_backup@onyx:${REMOTE_FILE_DIR}* ${LOCAL_FILE_DIR}onyx/

else

  #Its down, so lets not even bother.
  echo " onyx is down!"

fi

echo " Finished onyx at: "`date`
echo " ----------------------------------------------"


#####################################################################
#i2b2


echo " Finished vapp_master at: "`date`


