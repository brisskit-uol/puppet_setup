class nagios::target::mysql {

	require nagios::target

	@@nagios_service { "check-mysql-query-${fqdn}":
		use		=> "check-mysql-query",
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_mysql_query"],	
}

	cron { "check_mysql_query":
		command => "/var/local/brisskit/nagios-client/check_mysql_query.sh > /dev/null 2>&1",
		user    => "root",
		minute  => "*/5",
		require => File["/var/local/brisskit/nagios-client/check_mysql_query.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_mysql_query.sh":
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => 0500,
		source  => "puppet:///modules/nagios/check_mysql_query.sh",
		require => File["/var/local/brisskit/nagios-client"],
	}

}

