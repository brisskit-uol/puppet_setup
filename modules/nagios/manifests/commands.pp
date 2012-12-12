class nagios::commands {

	# Command definitions for Nagios
	# Used to define notification commands such as email and Pushover

#	file { "/etc/nagios3/commands.cfg":
#		ensure	=> file,
#		owner	=> 'root',
#		group	=> 'root',
#		mode	=> 0644,
#		source	=> "puppet:///modules/nagios/commands.cfg",
#		require	=> Package["nagios3"],
#		notify	=> Exec["nagios-config-check"],
#	}

	file { "/var/local/brisskit/nagios-server/notify_by_pushover.sh":
		ensure	=> file,
		owner	=> 'root',
		group	=> 'nagios',
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/notify_by_pushover.sh",
		require	=> File["/var/local/brisskit/nagios-server"],
	}

}
