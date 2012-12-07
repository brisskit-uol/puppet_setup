###########################################################
#Look after pound in the vApp
class pound {

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	#Make sure it is installed
	package { "pound": 
        	ensure => installed 
    	}

	#Make sure it is running
	service { "pound":
        	ensure => running,
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
