#################################################
#hack5
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack5-camp.brisskit.le.ac.uk' {
	include base_customer

	include users::customer_admin
	include users::hack

	realize( Users::Virtual::Ssh_user["tb143"] )


	package {'mysql-client': ensure => present}

	class {fw: stage => second}
	include fw::target::camp

}

#catissue
node 'hack5-catissue.brisskit.le.ac.uk' {
	include base_customer
	include postfix

	include users::customer_catissue
	include users::integration
	include users::hack

	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	class {fw: stage => second}
	include fw::target::catissue

}

#civicrm
node 'hack5-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix

	include users::customer_civicrm
	include users::hack

	class {fw: stage => second}
	include fw::target::civicrm

}

#i2b2
node 'hack5-i2b2.brisskit.le.ac.uk' {
        include base_customer

	include users::customer_i2b2
        include users::integration
	include users::hack

	realize( Users::Virtual::Ssh_user["tb143"] )


	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	class {fw: stage => second}
	include fw::target::i2b2

}

#mysql
node 'hack5-mysql.brisskit.le.ac.uk' {
	include base_customer
	include users::hack

	class {fw: stage => second}
	include fw::target::mysql
}

#onyx
node 'hack5-onyx.brisskit.le.ac.uk' {
	include base_customer

	include users::customer_onyx
	include users::hack

	class {fw: stage => second}
	include fw::target::onyx

}

#openesb
node 'hack5-openesbx.brisskit.le.ac.uk' {
        include base_customer


	#hosts file
	#file { "/etc/hosts":
	#	ensure => present,
	#	owner  => 'root',
	#	group  => 'root',
	#	mode   => 0644,
	#	source => "puppet:///modules/base_customer/hosts/hack5_hosts_openesb",
	#}

 
#	realize( Users::Virtual::Ssh_user["si84"] )
#	include users::hack

	class {fw: stage => second}
	include fw::target::openesb
}

#pound
node 'hack5-pound.brisskit.le.ac.uk' {
	include base_customer
	include users::hack

	class {fw: stage => second}
	include fw::target::pound
}

#any other ones that have been missed out
node /^hack5-.*$/ {
	include base_customer
	realize( Users::Virtual::Ssh_user["si84"] )
	realize( Users::Virtual::Ssh_user["jl99"] )
	include users::hack

	class {fw: stage => second}
	include fw::target::customer

}

