class fw::post {

	firewall { '998 log all':
		proto		=> 'all',
		jump		=> 'LOG',
		log_prefix	=> "[IPTABLES] dropped ",
		limit		=> "2/min",
		before		=> undef,
	}

        firewall { '999 drop all':
                proto   => 'all',
                action  => 'drop',
                before  => undef,
        }

}
