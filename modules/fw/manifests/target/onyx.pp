class fw::target::onyx {

	require fw::target::customer

	#################################
	# Export Allow SSH from onyx	#
	#################################

	@@firewall { "110 allow SSH from onyx":

		source	=> "${vapp_name}-onyx",
		port	=> "22",
		action	=> "accept",
		tag	=> "${vapp_name}",

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
