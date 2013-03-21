class nagios::commands {

	# Command definitions for Nagios
	# Used to define additional notification commands such as Pushover

	file { "/var/local/brisskit/nagios-server/notify_by_pushover.sh":
		ensure	=> file,
		owner	=> 'root',
		group	=> 'nagios',
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/notify_by_pushover.sh",
		require	=> File["/var/local/brisskit/nagios-server"],
	}

	package { "curl":
		ensure	=> installed,
		require	=> File["/var/local/brisskit/nagios-server/notify_by_pushover.sh"],
	}

}
