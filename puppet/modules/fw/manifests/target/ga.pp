class fw::target::ga {

	require fw::target::base

	firewall { "105 allow SSH from gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

}
