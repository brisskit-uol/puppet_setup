class base_customer {

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting base config $vapp_name":}

	#########################################################################
	#Directories and files
	#########################################################################

	#hosts file
	file { "/etc/hosts":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/base/hosts/${vapp_name}_hosts",
	}

	#settings file - just the inst prefix atm
        file { "/etc/brisskit/settings.cfg":
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => 0644,
                source => "puppet:///modules/base/settings/${vapp_name}_settings",
		require => File["/etc/brisskit"],
        }
}
