class fw::target::maven {

	require fw::target::ga

	firewall { "500 allow www from ANY":

		port	=> "80",
		action	=> "accept",

	}

}
