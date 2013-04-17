#################################################
#uhl
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'uhl-camp.brisskit.le.ac.uk' {
	include roles::customer::camp

	#Lets make this the pound server too.
	#include pound
}

#catissue
node 'uhl-catissue.brisskit.le.ac.uk' {
	include roles::customer::catissue
}


#catissue2
node 'uhl-catissue3.brisskit.le.ac.uk' {
        include roles::customer::catissue
}


#civicrm
node 'uhl-civicrm.brisskit.le.ac.uk' {
	include roles::customer::civicrm
}

#i2b2
node 'uhl-i2b2.brisskit.le.ac.uk' {
        include roles::customer
}


#onyx
node 'uhl-onyx.brisskit.le.ac.uk' {
	include roles::customer::onyx
}

#opal
node 'uhl-opal.brisskit.le.ac.uk' {
	include roles::customer::opal
}

#openesb
node 'uhl-openesb.brisskit.le.ac.uk' {
        include roles::customer::openesb
}

#openesb
node 'uhl-openesbx.brisskit.le.ac.uk' {
        include roles::customer::openesb
}

#pound
node 'uhl-pound.brisskit.le.ac.uk' {
        include roles::customer::pound
}

#mysql
node 'uhl-mysql.brisskit.le.ac.uk' {
        include roles::customer::mysql
}

#any other ones that have been missed out
node /^uhl-.*$/ {
	include roles::customer::common
}

