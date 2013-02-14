class nagios::target::backup {

	require nagios::target

	#################################
	# Check Backup (Customer)	#
	#################################

	@@nagios_service { "check-backup-customer-${fqdn}":
		use		=> "check-backup-customer",
		host_name	=> $fqdn,
		servicegroups	=> "check-backup",
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
#                require         => Cron["check_backup_customer"],
	}

	cron { "check_backup_customer":
		command => "/var/local/brisskit/nagios-client/check_backup_customer.sh > /dev/null 2>&1",
		user    => "root",
		minute  => "*/5",
		require => File["/var/local/brisskit/nagios-client/check_backup_customer.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_backup_customer.sh":
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => 0500,
		source  => "puppet:///modules/nagios/check_backup_customer.sh",
		require	=> [ File["/var/local/brisskit/nagios-client"], File["/usr/lib/nagios/plugins/check_newest_file_age"] ],
	}

	#########################
	# Check Backup (ga)	#
	#########################

	@@nagios_service { "check-backup-ga-${fqdn}":
		use		=> "check-backup-ga",
		host_name	=> $fqdn,
		servicegroups	=> "check-backup",
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
#                require         => Cron["check_backup_ga"],
	}

	cron { "check_backup_ga":
		command => "/var/local/brisskit/nagios-client/check_backup_ga.sh > /dev/null 2>&1",
		user    => "root",
		minute  => "*/5",
		require => File["/var/local/brisskit/nagios-client/check_backup_ga.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_backup_ga.sh":
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => 0500,
		source  => "puppet:///modules/nagios/check_backup_ga.sh",
		require	=> [ File["/var/local/brisskit/nagios-client"], File["/usr/lib/nagios/plugins/check_newest_file_age"] ],
	}

	file { "/usr/lib/nagios/plugins/check_newest_file_age":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/check_newest_file_age",
		require	=> Package["nagios-plugins"],
	}

}

