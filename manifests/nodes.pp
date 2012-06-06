#The base bru packages that should go in each bru VM
class bru_base {
	include base
	include ntp
	include puppet
	include users::ob30
}


#################################################
#BRU1 nodes
#################################################
node 'bru1-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::integration
}

#catissue
node 'bru1-catissue.brisskit.le.ac.uk' {
	include bru_base
	include postfix
}

#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::si84, users::ss727
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
}

#catissue
node 'bru3-catissue.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::si84, users::ss727
}

#civicrm
node 'bru3-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::rcf8, users::si84, users::ss727, users::tb143
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
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
#################################################
class ga_base {
	include ntp
	include puppet
	include ga_hosts
	include users::ob30
}


#puppet master. Be careful not to become self aware :)
node ga-puppet {
	include ga_base
}

#mail server
node 'ga-mail.brisskit.le.ac.uk' {
	include ga_base
}

#backup vm
node ga-backup {
	include ga_base
}

node ga-pound {
	include ga_base
	include postfix
}

node 'ga-gimp.brisskit.le.ac.uk' {
	include ga_base
}
