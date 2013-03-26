class fw::target::pound {

	require fw::target::customer

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	@@firewall { "505 allow www from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "80",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "camp", "civicrm", "i2b2", ],

	}

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	@@firewall { "505 allow 8080 from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "8080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "catissue", "i2b2", "onyx", ],

	}

	#########################
	# Allow www from ANY	#
	#########################

	firewall { "515 allow www from ANY":

		port	=> "80",
		action	=> "accept",

	}

	#########################
	# Allow 8080 from ANY	#
	#########################

	firewall { "515 allow 8080 from ANY":

		port	=> "8080",
		action	=> "accept",

	}

	#########################
	# Allow https from ANY	#
	#########################

	firewall { "515 allow https from ANY":

		port	=> "443",
		action	=> "accept",

	}

}
