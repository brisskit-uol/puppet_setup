####################################################################
#The base bru packages that should go in each bru VM
class bru_base {
	include base
	include ntp
	include puppet
	include users::ob30
}
#####################################################################

#Customer vApps
import "nodes/bru1"
import "nodes/bru3"
import "nodes/demo"

#Global admin vApp
import "nodes/ga"

