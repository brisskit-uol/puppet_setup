###########################################################
#Install pound in the vApp and configure it too
class pound {

	#Lets figure out the vApp name
#	$parts = split("${fqdn}", '-')
#	$vapp_name = $parts[-2]

	#Make sure it is installed
	package { "pound": 
        	ensure => installed 
    	}

	#Make sure it is running
	service { "pound":
        	ensure => running,
    	}

        #Configure pound to start on VM boot
        file { "/etc/default/pound":
                path    => "/etc/default/pound",
		ensure  => present,
                owner   => root,
                group   => root,
                mode    => 644,
                source => "puppet:///modules/pound/startup.txt",
                notify  => Service["pound"],
        }

	#Make the config file from the template and restart pound
	file { "pound.cfg":
    		path    => "/etc/pound/pound.cfg",
    		owner   => root,
    		group   => root,
    		mode    => 644,
    		content => template("pound/vapp.erb"),
		notify  => Service["pound"],
  	}
}
