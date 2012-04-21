class postfix {

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting postfix config $vapp_name":}

	#########################################################################
	#Directories and files
	#########################################################################

	#hosts file
	file { "/etc/postfix/main.cf":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/postfix/main.cf",
	}

}
