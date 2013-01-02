class nagios::target::base {

	require nagios::target

	package { "nagios-plugins":
		ensure	=> installed,
	}

	file { "/var/local/brisskit/nagios-client":
		ensure	=> directory,
		owner	=> "root",
		group	=> "nagios",
		mode	=> 0644,
	}

	file { "/var/local/brisskit/nagios-client/send_nrdp.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/send_nrdp.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	file { "/etc/nagios-plugins/config/brisskit.cfg":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0644,
		source	=> "puppet:///modules/nagios/brisskit.cfg",
		require => Package["nagios-plugins"],
	}

	#########################
	# Check Disk Space	#
	#########################

	@@nagios_service { "check-disk-space-${hostname}":
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

}

