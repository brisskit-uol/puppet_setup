class fw::target::catissue {

	require fw::target::customer

	#################################
	# Allow 8080 from reverse proxy	#
	#################################

	firewall { "500 allow 8080 from pound":

		source	=> "pound",
		port	=> "8080",
		action	=> "accept",

	}

	#################################
	# Allow 8080 from openesb	#
	#################################

	firewall { "500 allow 8080 from openesb":

		source	=> "openesb",
		port	=> "8080",
		action	=> "accept",

	}

}
