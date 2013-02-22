####################################################################
#The base bru packages that should go in each bru VM
#class bru_base {
#	include base_customer
#	include ntp
#	include puppet
#	include users::ob30
#	include users::virtual
#}
#####################################################################

#Customer vApps
import "nodes/bru3"
import "nodes/demo"

import "nodes/pub_web"

#hack event vApps
import "nodes/hack3"
import "nodes/hack4"
import "nodes/hack5"

import "nodes/jeff_i2b2"

import "nodes/russ"

#Global admin vApp
import "nodes/ga"

