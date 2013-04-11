#Looks after the wiki and drupal public pages
class base_pub {

	require roles::global::common

	#Long list of potential users. These need to be realised elsewhere.
	include users::virtual	

	# Manage hosts file
	include hosts::pub

	#hosts file. This is actually the ga-hosts file, but it should do.
#	file { "/etc/hosts":
#		ensure => present,
#		owner  => 'root',
#		group  => 'root',
#		mode   => 0644,
#		source => "puppet:///modules/roles/ga_hosts",
#	} 
}
