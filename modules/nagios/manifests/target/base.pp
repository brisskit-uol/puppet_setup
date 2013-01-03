class nagios::target::base {

	require nagios::target

	#########################
	# Check Disk Space	#
	#########################

	@@nagios_service { "check-disk-space-${fqdn}":
		use		=> "check-disk-space",
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_disk"],
	}

	cron { "check_disk":
		command	=> "/var/local/brisskit/nagios-client/check_disk.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require => File["/var/local/brisskit/nagios-client/check_disk.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_disk.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_disk.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	#########################
	# Check Current Load	#
	#########################

	@@nagios_service { "check-current-load-${fqdn}":
		use		=> check-current-load,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_load"],
	}

        cron { "check_load":
                command => "/var/local/brisskit/nagios-client/check_load.sh > /dev/null 2>&1",
                user    => "root",
                minute  => "*/5",
                require => File["/var/local/brisskit/nagios-client/check_load.sh"],
        }

        file { "/var/local/brisskit/nagios-client/check_load.sh":
                ensure  => present,
                owner   => "root",
                group   => "root",
                mode    => 0500,
                source  => "puppet:///modules/nagios/check_load.sh",
                require => File["/var/local/brisskit/nagios-client"],
        }
	
	#################
	# Check SSH	#
	#################

	@@nagios_service { "check-ssh-${fqdn}":
		use		=> check-ssh,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_ssh"],
	}
	

	cron { "check_ssh":
		command	=> "/var/local/brisskit/nagios-client/check_ssh.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require	=> File["/var/local/brisskit/nagios-client/check_ssh.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_ssh.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_ssh.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	#########################
	# Check Memory Usage	#
	#########################

	@@nagios_service { "check-mem-${fqdn}":
		use		=> check-mem,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_mem"],
	}

	cron { "check_mem":
		command	=> "/var/local/brisskit/nagios-client/check_mem.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require	=> File["/var/local/brisskit/nagios-client/check_mem.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_mem.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_mem.sh",
		require	=> [ File["/var/local/brisskit/nagios-client"], File["/usr/lib/nagios/plugins/check_mem"] ],
	}

	file { "/usr/lib/nagios/plugins/check_mem":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/check_mem",
		require	=> Package["nagios-plugins"],
	}

	#########################
	# Check Current Users	#
	#########################

	@@nagios_service { "check-current-users-${fqdn}":
		use		=> check-current-users,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_users"],
	}

	cron { "check_users":
		command	=> "/var/local/brisskit/nagios-client/check_users.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require	=> File["/var/local/brisskit/nagios-client/check_users.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_users.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_users.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	#########################
	# Check NTP Time	#
	#########################

	@@nagios_service { "check-ntp-time-${fqdn}":
		use		=> check-ntp-time,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_ntp"],
	}

	cron { "check_ntp":
		command	=> "/var/local/brisskit/nagios-client/check_ntp.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require	=> File["/var/local/brisskit/nagios-client/check_ntp.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_ntp.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_ntp.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	#################################
	# Check Zombie Processes	#
	#################################

	@@nagios_service { "check-zombie-procs-${fqdn}":
		use		=> check-zombie-procs,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_zombie_procs"],
	}

	cron { "check_zombie_procs":
		command	=> "/var/local/brisskit/nagios-client/check_zombie_procs.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require	=> File["/var/local/brisskit/nagios-client/check_zombie_procs.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_zombie_procs.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_zombie_procs.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	#################################
	# Check Total Processes		#
	#################################

	@@nagios_service { "check-total-procs-${fqdn}":
		use	     => check-total-procs,
		host_name       => $fqdn,
		target	  => "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require	 => Cron["check_total_procs"],
	}

	cron { "check_total_procs":
		command => "/var/local/brisskit/nagios-client/check_total_procs.sh > /dev/null 2>&1",
		user    => "root",
		minute  => "*/5",
		require => File["/var/local/brisskit/nagios-client/check_total_procs.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_total_procs.sh":
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => 0500,
		source  => "puppet:///modules/nagios/check_total_procs.sh",
		require => File["/var/local/brisskit/nagios-client"],
	}

	#################
	# Check DNS	#
	#################

	@@nagios_service { "check-dns-${fqdn}":
		use		=> check-dns,
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_dns"],
	}

	cron { "check_dns":
		command	=> "/var/local/brisskit/nagios-client/check_dns.sh > /dev/null 2>&1",
		user	=> "root",
		minute	=> "*/5",
		require	=> File["/var/local/brisskit/nagios-client/check_dns.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_dns.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0500,
		source	=> "puppet:///modules/nagios/check_dns.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

}

