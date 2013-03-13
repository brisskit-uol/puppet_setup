class fw::target::i2b2 {

	require fw::target::customer

	#################################
	# Export Allow SSH from i2b2	#
	#################################

	@@firewall { "110 allow SSH from i2b2":

		source	=> "${vapp_name}-i2b2",
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

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	firewall { "500 allow 8080 from pound":

		source	=> "${vapp_name}-pound",
		port	=> "8080",
		action	=> "accept",

	}

}
