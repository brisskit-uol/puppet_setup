class fw::target::camp {

	require fw::target::customer

	#################################
	# Export Allow SSH from camp	#
	#################################

	@@firewall { "110 allow SSH from camp":

		source  => "${vapp_name}-camp",
		port    => "22",
		action  => "accept",
		tag	=> "${vapp_name}",

	}

	#################
	# Allow SSH	#
	#################

	firewall { "100 allow SSH from ga-gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

}
