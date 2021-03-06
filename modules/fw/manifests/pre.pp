class fw::pre {

	# Set default require to undefined to prevent dependency cycle

	Firewall {

		require => undef,

	}

	# Default firewall rules
	# These will be applied *first* and to all nodes

	firewall { '000 accept all icmp':

		proto	=> 'icmp',
		action	=> 'accept',

	}

	firewall { '001 accept all to lo interface':

		proto   => 'all',
		iniface => 'lo',
		action  => 'accept',

	}

	firewall { '002 accept related established rules':

		proto   => 'all',
		state   => ['RELATED', 'ESTABLISHED'],
		action  => 'accept',

	}

	#################################
	# BRISSKit PCs Allow ANY	#
	#################################

	firewall { "055 allow all from russ home":

		proto	=> "all",
		source	=> "86.31.28.83",
		action	=> "accept",

	}

	firewall { "055 allow all from russ gh":

		proto	=> "all",
		source	=> "143.210.248.92",
		action	=> "accept",

	}

	firewall { "055 allow all from olly home":

		proto	=> "all",
		source	=> "86.7.201.36",
		action	=> "accept",

	}

	firewall { "055 allow all from olly work":

		proto	=> "all",
		source	=> "143.210.247.104",
		action	=> "accept",

	}

	firewall { "055 allow all from saj home":

		proto	=> "all",
		source	=> "86.17.189.116",
		action	=> "accept",

	}

	firewall { "055 allow all from saj work":

		proto	=> "all",
		source	=> "143.210.248.93",
		action	=> "accept",

	}

	firewall { "055 allow all from jeff home":

		proto	=> "all",
		source	=> "84.92.35.138",
		action	=> "accept",

	}

	firewall { "055 allow all from jeff work":

		proto	=> "all",
		source	=> "143.210.248.108",
		action	=> "accept",

	}

}
