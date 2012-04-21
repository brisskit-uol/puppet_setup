class postfix {

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting postfix config $vapp_name":}

	#Make sure installed
	package { "postfix": 
        	ensure => installed 
    	}

	#Make sure running
	service { "postfix":
		ensure     => "running",
		hasrestart => true,
	}

	#hosts file
	file { "/etc/postfix/main.cf":
		notify => Service["postfix"],
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/postfix/main.cf",
	}

}
