#Manage the sshd install and config
class sshd {

	package { "openssh-server": 
        	ensure => installed 
    	}

	service { "ssh":
        	ensure => running,
    	}

	#Not really sshd I know, but thsi will stop connections being dropped
	file { "/etc/ssh/ssh_config":
                path    => "/etc/ssh/ssh_config",
                ensure  => present,
                owner   => root,
                group   => root,
                mode    => 644,
                source => "puppet:///modules/sshd/ssh_config",
                notify  => Service["ssh"],
        }


}

#Some VMs use keys to log into, others passwords, the
#config file must reflect that.
class sshd::config::password {

	file { "/etc/ssh/sshd_config":
                path    => "/etc/ssh/sshd_config",
		ensure  => present,
                owner   => root,
                group   => root,
                mode    => 644,
                source => "puppet:///modules/sshd/sshd_config",
                notify  => Service["ssh"],
        }
}

