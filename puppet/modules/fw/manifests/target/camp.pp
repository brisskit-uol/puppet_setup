class fw::target::camp {

	require fw::target::customer

	#################
	# Allow SSH	#
	#################

	firewall { "100 allow SSH from ga-gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

}
