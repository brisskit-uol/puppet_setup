class roles::customer::common {

	require roles::global::common

	# Manage hosts file
	include hosts::customer

	#Manage the sshd_config file
#	include sshd::config::password

	#Make sure unzip is installed - maven distributes as .zip
	package { "unzip":
		ensure => installed
	}

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting base_customer config $vapp_name":}


	#settings file - just the inst prefix atm
        file { "/etc/brisskit/settings.cfg":
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => 0644,
                source => "puppet:///modules/roles/customer/settings/${vapp_name}_settings",
		require => File["/etc/brisskit"],
        }
}
