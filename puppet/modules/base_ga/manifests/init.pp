#Base class for all the global admin VMs
class base_ga {

	require base_global
 
	#Long list of potential users. These need to be realised elsewhere.
	include users::virtual

	# Manage hosts file
	#include hosts::ga

	class {hosts::ga: stage => second}

	#hosts file
	#file { "/etc/hosts":
	#	ensure => present,
	#	owner  => 'root',
	#	group  => 'root',
	#	mode   => 0644,
	#	source => "puppet:///modules/base_ga/ga_hosts",
	#}
}
