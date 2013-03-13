class fw::target::civicrm {

	require fw::target::customer

	#################################
	# Export Allow SSH from civicrm	#
	#################################

	@@firewall { "110 allow SSH from civicrm":

		source	=> "${vapp_name}-civicrm",
		port	=> "22",
		action	=> "accept",
		tag	=> "${vapp_name}",

	}

	#################################
	# Allow www from reverse proxy	#
	#################################

	firewall { "500 allow www from pound":

		source	=> "${vapp_name}-pound",
		port	=> "80",
		action	=> "accept",

	}

	#########################
	# Allow www from i2b2	#
	#########################

	firewall { "500 allow www from i2b2":

		source	=> "${vapp_name}-i2b2",
		port	=> "80",
		action	=> "accept",

	}

}
