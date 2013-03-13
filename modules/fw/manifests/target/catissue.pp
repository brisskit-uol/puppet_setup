class fw::target::catissue {

	require fw::target::customer

	#########################################
	# Export Allow SSH from catissue	#
	#########################################

	@@firewall { "110 allow SSH from catissue":

		source	=> "${vapp_name}-catissue",
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

	#################################
	# Allow 8080 from openesb	#
	#################################

	firewall { "500 allow 8080 from openesb":

		source	=> "${vapp_name}-openesb",
		port	=> "8080",
		action	=> "accept",

	}

}
