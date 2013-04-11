class roles::customer::common {

	require roles::global::common

	#Long list of potential users. These need to be realised elsewhere.
	include users::virtual	

	# Manage hosts file
	include hosts::customer

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
