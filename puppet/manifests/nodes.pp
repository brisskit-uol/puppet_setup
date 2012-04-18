#The base bru packages that should go in each bru VM
class bru_base {
	include base
	include ntp
	include puppet
	include users::olly
}


#################################################
#BRU1 nodes
#################################################

#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include users::saj, users::soma
}

#any other ones that have been missed out
node /^bru1-.*$/ {
	include bru_base
}


#################################################
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
#################################################
class ga_base {
	include ntp
	include puppet
	include users::olly
}


#puppet master. Be careful not to become self aware :)
node ga-puppet {
	include ga_base
}

#mail server
node ga-mail {
	include ga_base
}

#backup vm
node ga-backup {
	include ga_base
}

