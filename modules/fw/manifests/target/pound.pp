class fw::target::pound {

	require fw::target::customer

	#################################
	# Export Allow SSH from pound	#
	#################################

	@@firewall { "110 allow SSH from pound":

		source	=> "${vapp_name}-pound",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	@@firewall { "500 allow www from pound":

		source	=> "${vapp_name}-pound",
		port	=> "80",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "camp", "civicrm", "i2b2", ],

	}

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	@@firewall { "500 allow 8080 from pound":

		source	=> "${vapp_name}-pound",
		port	=> "8080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "catissue", "i2b2", "onyx", ],

	}

	#########################
	# Allow www from ANY	#
	#########################

	firewall { "510 allow www from ANY":

		port	=> "80",
		action	=> "accept",

	}

	#########################
	# Allow 8080 from ANY	#
	#########################

	firewall { "510 allow 8080 from ANY":

		port	=> "8080",
		action	=> "accept",

	}

	#########################
	# Allow https from ANY	#
	#########################

	firewall { "510 allow https from ANY":

		port	=> "443",
		action	=> "accept",

	}

}
