#################################################
#BRU1
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'bru1-camp.brisskit.le.ac.uk' {
	include roles::customer::camp

	#Lets make this the pound server too.
	#include pound
}

#catissue
node 'bru1-catissue.brisskit.le.ac.uk' {
	include roles::customer::catissue
}


#catissue2
node 'bru1-catissue3.brisskit.le.ac.uk' {
        include roles::customer::catissue
}


#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include roles::customer::civicrm
}

#i2b2
node 'bru1-i2b2.brisskit.le.ac.uk' {
        include roles::customer::i2b2
}


#onyx
node 'bru1-onyx.brisskit.le.ac.uk' {
	include roles::customer::onyx
}

#opal
node 'bru1-opal.brisskit.le.ac.uk' {
	include roles::customer::opal

#	include mysql
}

#openesb
node 'bru1-openesb.brisskit.le.ac.uk' {
        include roles::customer::openesb
}

#openesb
node 'bru1-openesbx.brisskit.le.ac.uk' {
        include roles::customer::openesb
}

#pound
node 'bru1-pound.brisskit.le.ac.uk' {
#        include roles::customer::pound

include pound::hostnames

}

#mysql
node 'bru1-mysql.brisskit.le.ac.uk' {
        include roles::customer::mysql
}

#any other ones that have been missed out
node /^bru1-.*$/ {
	include roles::customer::common
}

