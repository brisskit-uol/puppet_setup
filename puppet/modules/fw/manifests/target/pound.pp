class fw::target::pound {

	require fw::target::customer

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
