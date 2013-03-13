class fw::target::openesb {

	require fw::target::customer

	#################################
	# Export Allow SSH from openesb	#
	#################################

	@@firewall { "110 allow SSH from openesb":

		source	=> "${vapp_name}-openesb",
		port	=> "22",
		action	=> "accept",
		tag	=> "${vapp_name}",

	}

	#################################
	# Allow 9080 from civicrm	#
	#################################

	firewall { "500 allow 9080 from civicrm":

		source	=> "${vapp_name}-civicrm",
		port	=> "9080",
		action	=> "accept",

	}

}
