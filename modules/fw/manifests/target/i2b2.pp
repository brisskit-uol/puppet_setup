class fw::target::i2b2 {

	require fw::target::customer

	#################################
	# Allow www from reverse proxy	#
	#################################

	firewall { "500 allow www from pound":

		source	=> "pound",
		port	=> "80",
		action	=> "accept",

	}

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	firewall { "500 allow 8080 from pound":

		source	=> "pound",
		port	=> "8080",
		action	=> "accept",

	}

}
