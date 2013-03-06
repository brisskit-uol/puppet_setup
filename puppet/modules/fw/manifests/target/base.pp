class fw::target::base {

	firewall { "100 allow SSH from gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

}
