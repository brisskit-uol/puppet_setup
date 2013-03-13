class nagios::target::puppet {

	require nagios::target

	#################################
	# Check PuppetDB Java Heap Size	#
	#################################

	@@nagios_service { "check-puppetdb-javaheapsize-${fqdn}":
		use		=> "check-puppetdb-javaheapsize",
		host_name	=> $fqdn,
		servicegroups	=> "check-puppetdb",
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
#                require         => Cron["check_puppetdb_javaheapsize"],
	}

	cron { "check_puppetdb_javaheapsize":
		command => "/var/local/brisskit/nagios-client/check_puppetdb_javaheapsize.sh > /dev/null 2>&1",
		user    => "root",
		minute  => "*/5",
		require => File["/var/local/brisskit/nagios-client/check_puppetdb_javaheapsize.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_puppetdb_javaheapsize.sh":
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => 0500,
		source  => "puppet:///modules/nagios/check_puppetdb_javaheapsize.sh",
		require	=> [ File["/var/local/brisskit/nagios-client"], File["/usr/lib/nagios/plugins/check_puppetdb_memory"] ],
	}

	file { "/usr/lib/nagios/plugins/check_puppetdb_memory":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/check_puppetdb_memory",
		require	=> [ Package["nagios-plugins"], Package["libnagios-plugin-perl"], ],
	}

	package { "libnagios-plugin-perl":
		ensure	=> installed,
		require	=> Package["libwww-perl"],
	}

	package { "libwww-perl":
		ensure	=> installed,
		require	=> Package["libjson-perl"],
	}

	package { "libjson-perl":
		ensure	=> installed,
	}

}

