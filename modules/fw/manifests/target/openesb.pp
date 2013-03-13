class fw::target::openesb {

	require fw::target::customer

	#################################
	# Export Allow SSH from openesb	#
	#################################

	@@firewall { "110 allow SSH from ${vm_role}":

		source	=> "${hostname}",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#################################
	# Allow 8080 from openesb	#
	#################################

	@@firewall { "500 allow 8080 from ${vm_role}":

		source	=> "${hostname}",
		port	=> "8080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "catissue", ],

	}

}
