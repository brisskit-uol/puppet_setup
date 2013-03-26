class fw::target::nagios {

	require fw::target::ga

	firewall { "505 allow www from ANY":

		port	=> "80",
		action	=> "accept",

	}

}
