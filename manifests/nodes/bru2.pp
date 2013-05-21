#################################################
#BRU2
#################################################
#vApp specific
class vapp::bru2 {

	#	include clamav::dailyscan
}

#camp - everyone needs to be on this to get
#to the other VMs
node 'bru2-camp.brisskit.le.ac.uk' {
	include roles::customer::camp
	include vapp::bru2

	#Lets make this the pound server too.
	#include pound
}

#i2b2
node 'bru2-i2b2.brisskit.le.ac.uk' {
        include roles::customer::i2b2
	include vapp::bru2
}

#opal
node 'bru2-opal.brisskit.le.ac.uk' {
	include roles::customer::opal
	include vapp::bru2
#	include mysql
}

#pound
node 'bru2-pound.brisskit.le.ac.uk' {
#        include roles::customer::pound
	include vapp::bru2

include roles::customer::common
include pound::hostnames

}

#any other ones that have been missed out
node /^bru2-.*$/ {
	include roles::customer::common
	include vapp::bru2
}

