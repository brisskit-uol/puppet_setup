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

import "nodes/pub_web"

#hack event vApps
import "nodes/hack2"
import "nodes/hack3"
import "nodes/hack4"
import "nodes/hack5"
import "nodes/hack6"

#Global admin vApp
import "nodes/ga"

