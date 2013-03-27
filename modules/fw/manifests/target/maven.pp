class fw::target::maven {

	require fw::target::ga

	firewall { "505 redirect www to 8081":

		dport	=> "80",
		table	=> "nat",
		chain	=> "PREROUTING",
		jump	=> "REDIRECT",
		toports	=> "8081",
		
	}

	firewall { "505 allow 8081 from ANY":

		port	=> "8081",
		action	=> "accept",

	}

}
