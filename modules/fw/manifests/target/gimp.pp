class fw::target::gimp {

	require fw::target::ga

	firewall { "105 allow SSH from ANY":

		port	=> "22",
		action	=> "accept",

	}

}
