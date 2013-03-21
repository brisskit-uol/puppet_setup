class fw::post {
	
	# Set default before to undefined to prevent dependency cycle

	Firewall {

		before	=> undef,

	}

        # Default firewall rules
        # These will be applied *last* and to all nodes

	# Log all dropped traffic

	firewall { '998 log all':
		proto		=> 'all',
		jump		=> 'LOG',
		log_prefix	=> "[IPTABLES] dropped ",
		limit		=> "2/min",
	}

	# Drop all unmatched traffic

        firewall { '999 drop all':
                proto   => 'all',
                action  => 'drop',
        }

}
