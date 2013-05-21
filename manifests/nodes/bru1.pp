#################################################
#BRU1
#################################################
#vApp specific
class vapp::bru1 {

	include clamav::dailyscan
}


#camp - everyone needs to be on this to get
#to the other VMs
node 'bru1-camp.brisskit.le.ac.uk' {
	include roles::customer::camp
	include vapp::bru1

	#Lets make this the pound server too.
	#include pound
}

#catissue
node 'bru1-catissue.brisskit.le.ac.uk' {
	include roles::customer::catissue
	include vapp::bru1
}


#catissue2
node 'bru1-catissue3.brisskit.le.ac.uk' {
        include roles::customer::catissue
}


#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include roles::customer::civicrm
	include vapp::bru1
}

#i2b2
node 'bru1-i2b2.brisskit.le.ac.uk' {
        include roles::customer::i2b2
	include vapp::bru1
}


#onyx
node 'bru1-onyx.brisskit.le.ac.uk' {
	include roles::customer::onyx
	include vapp::bru1
}

#opal
node 'bru1-opal.brisskit.le.ac.uk' {
	include roles::customer::opal
	include vapp::bru1
#	include mysql
}

#openesb
node 'bru1-openesb.brisskit.le.ac.uk' {
        include roles::customer::openesb
	include vapp::bru1
}

#openesb
node 'bru1-openesbx.brisskit.le.ac.uk' {
        include roles::customer::openesb
	include vapp::bru1
}

#pound
node 'bru1-pound.brisskit.le.ac.uk' {
#        include roles::customer::pound
	include vapp::bru1

include roles::customer::common
include pound::hostnames

}

#mysql
node 'bru1-mysql.brisskit.le.ac.uk' {
        include roles::customer::mysql
	include vapp::bru1
}

node 'bru1-dev.brisskit.le.ac.uk'{
include roles::global::common
include mysql_setup	
	include vapp::bru1
}

#any other ones that have been missed out
node /^bru1-.*$/ {
	include roles::customer::common
	include vapp::bru1
}

