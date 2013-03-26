class fw::target::ga {

	firewall { "105 allow SSH from gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

}
