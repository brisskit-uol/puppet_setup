#Base class for all the global admin VMs
class base_ga {

	require base_global
 

	#hosts file
	file { "/etc/hosts":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/base_ga/ga_hosts",
	}
}
