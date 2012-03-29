import 'nodes.pp'

#package {
#    'apache2':
#        ensure => installed
#}

#service {
#    'apache2':
#        ensure => true,
#        enable => true,
#        require => Package['apache2']
#}

#package {
#	'ntp':
#		ensure => installed
#}

#service {
#	'ntp':
#		ensure => true,
#		enable => true,
#		require => Package['ntp']
#}

#package {
#	'logwatch':
#		ensure => installed
#}

#service {
#	'logwatch':
#		ensure => true,
#		enable => true,
#		require => Package['logwatch']
#}

#package {
#	'mysql-server-core-5.1':
#		ensure => installed
#}

#service {
#	'mysql-server-core-5.1':
#		ensure => true,
#		enable => true,
#		require => Package['mysql-server-core-5.1']
#}


#class brisskit {
#	file { "/etc/brisskit":
#		ensure => "directory",
#	}
#}

