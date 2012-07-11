include ssh::auth

#####################################################################
#Define all the BACKUP users whos keys I want to pass around
#These are stored on the puppet master in /var/lib/keys
#These do not have to exist as users at this stage

#The main user on ga-backup that runs this show
ssh::auth::key { "master_backup": }

#The user on the camp VM that drives in the vApp
ssh::auth::key { "vapp_backup":}

#The users on the vapps
ssh::auth::key { "vm_backup": }
#####################################################################

#####################################################################
#Define all the INTEGRATION users whos keys I want to pass around
ssh::auth::key { "integration": }
#####################################################################



#####################################################################
#The base bru packages that should go in each bru VM
class bru_base {
	include base
	include ntp
	include puppet
	include users::ob30
}
#####################################################################


#####################################################################
#BRU1 nodes
#####################################################################
node 'bru1-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::integration

	#Backup stuff
	include backup::base                                         #Set up file tree
	include backup::users::vapp_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "vapp_backup" } #Copy master_backup pub key to vapp_backup authorized_keys
	ssh::auth::client { "vapp_backup": }                         #Get vapp_backup private key
}

#catissue
node 'bru1-lb.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::si84, users::ss727
}

#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::si84, users::ss727

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}


#any other ones that have been missed out
node /^bru1-.*$/ {
	include bru_base
	include users::integration
}


#################################################
#BRU3
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'bru3-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99, users::rcf8, users::si84, users::ss727, users::tb143

        #Backup stuff
        include backup::base                                         #Set up file tree
        include backup::users::vapp_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "vapp_backup" } #Copy master_backup pub key to vapp_backup authorized_keys
        ssh::auth::client { "vapp_backup": }                         #Get vapp_backup private key

}

#catissue
node 'bru3-catissue.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

#civicrm
node 'bru3-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::rcf8, users::si84, users::ss727, users::tb143

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}

#i2b2
node 'bru3-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'bru3-onyx.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99
}

#any other ones that have been missed out
node /^bru3-.*$/ {
	include bru_base
}


#################################################
#demo
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'demo-camp.brisskit.le.ac.uk' {
        include bru_base
        include users::jl99, users::rcf8, users::si84, users::ss727, users::tb143
}

#catissue
node 'demo-catissue.brisskit.le.ac.uk' {
        include bru_base
        include postfix
        include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
        ssh::auth::server { "integration": }
}

#civicrm
node 'demo-civicrm.brisskit.le.ac.uk' {
        include bru_base
        include postfix
        include users::rcf8, users::si84, users::ss727, users::tb143
}

#i2b2
node 'demo-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::si84, users::ss727
        ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'demo-onyx.brisskit.le.ac.uk' {
        include bru_base
        include users::jl99
}

#any other ones that have been missed out
node /^demo-.*$/ {
        include bru_base
}



#################################################
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
#################################################
class ga_base {
	include ga_base_file
	include ntp
	include puppet
	include ga_hosts
	include users::ob30
}


#puppet master. Be careful not to become self aware :)
node ga-puppet {
	include ga_base
	include ssh::auth::keymaster
}

#mail server
node 'ga-mail.brisskit.le.ac.uk' {
	include ga_base
}

#backup vm
node ga-backup {
	include ga_base
	include backup::base
	include backup::users::master_backup
	ssh::auth::client { "master_backup": }
}

#load balancer
node ga-pound {
	include ga_base
	include postfix
}

#global ssh gateway
node 'ga-gimp.brisskit.le.ac.uk' {
	include ga_base
}

#private web server
node 'ga-private.brisskit.le.ac.uk' {
	include ga_base
	include users::jl99, users::si84, users::ss727
}
