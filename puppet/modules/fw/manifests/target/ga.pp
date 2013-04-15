class fw::target::ga {

#	require ::hosts::ga

notify{"doing fw":}

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

}
