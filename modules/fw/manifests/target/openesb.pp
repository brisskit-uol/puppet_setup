class fw::target::openesb {

	require fw::target::customer

	#################################
	# Allow 8080 from openesb	#
	#################################

	@@firewall { "500 allow 8080 from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "8080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "catissue", ],

	}

	#########################
	# Allow 9080 from ANY	#
	#########################

	firewall { "510 allow 9080 from ANY":

		port	=> "9080",
		action	=> "accept",

	}

	#########################
	# Allow 4848 from ANY	#
	#########################

	firewall { "510 allow 4848 fron ANY":

		port	=> "4848",
		action	=> "accept",

	}

}
