class nagios::target::backup {

	require nagios::target

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

	file { "/usr/lib/nagios/plugins/check_newest_file_age":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/check_newest_file_age",
		require	=> Package["nagios-plugins"],
	}

}

