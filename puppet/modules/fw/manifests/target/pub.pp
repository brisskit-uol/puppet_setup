class fw::target::pub {

	require fw::target::base

	firewall { "105 allow SSH from gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

	firewall { "115 allow SSH from backup":

		source	=> "ga-backup",
		port	=> "22",
		action	=> "accept",

	}

	firewall { "505 allow www from ANY":

		port	=> "80",
		action	=> "accept",

	}

	firewall { "505 allow https from ANY":

		port	=> "443",
		action	=> "accept",

	}

}
