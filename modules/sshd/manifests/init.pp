class sshd {

	package { "openssh-server": 
        	ensure => installed 
    	}

	service { "ssh":
        	ensure => running,
    	}
}
