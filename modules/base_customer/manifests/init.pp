#This is the definition of the customer vApps.
#Note the requirement on the base_global class.
class base_customer {

	#Common settings
	require base_global

	#Long list of potential users. These need to be realised elsewhere.
	include users::virtual	


	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting base_customer config $vapp_name":}

	#########################################################################
	#Directories and files
	#########################################################################

	#hosts file
	file { "/etc/hosts":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/base_customer/hosts/${vapp_name}_hosts",
	}

	#settings file - just the inst prefix atm
        file { "/etc/brisskit/settings.cfg":
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => 0644,
                source => "puppet:///modules/base_customer/settings/${vapp_name}_settings",
		require => File["/etc/brisskit"],
        }
}
