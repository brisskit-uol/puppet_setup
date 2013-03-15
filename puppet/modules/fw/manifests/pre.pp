class fw::pre {

	Firewall {

		require => undef,

	}

	# Default firewall rules

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

	firewall { "050 allow all from russ home":

		proto	=> "all",
		source	=> "86.31.28.83",
		action	=> "accept",

	}

	firewall { "050 allow all from russ gh":

		proto	=> "all",
		source	=> "143.210.248.92",
		action	=> "accept",

	}

	firewall { "050 allow all from olly home":

		proto	=> "all",
		source	=> "86.7.201.36",
		action	=> "accept",

	}

	firewall { "050 allow all from olly work":

		proto	=> "all",
		source	=> "143.210.247.104",
		action	=> "accept",

	}

	firewall { "050 allow all from saj home":

		proto	=> "all",
		source	=> "86.15.24.253",
		action	=> "accept",

	}

	firewall { "050 allow all from saj work":

		proto	=> "all",
		source	=> "143.210.248.93",
		action	=> "accept",

	}

	firewall { "050 allow all from jeff home":

		proto	=> "all",
		source	=> "84.92.35.138",
		action	=> "accept",

	}

	firewall { "050 allow all from jeff work":

		proto	=> "all",
		source	=> "143.210.248.108",
		action	=> "accept",

	}

}
