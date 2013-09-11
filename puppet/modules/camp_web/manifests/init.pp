#Set up a simple html page with links to stuff
#I've been lazy with this and stuck stuff in /var/www
#really it needs to go in /var/local/brisskit, but the
#apache settings will need to be set too.
class camp_web {

	#Make sure apache is up and running.
	package { "apache2": 
        	ensure => installed,
    	}

	service { "apache2":
        	ensure => running,
    	}


	#Add some php
	package { "php5":
		ensure => installed,
	}


       	#Make sure the default index.html page is not there.
        file { "/var/www/index.html":
                ensure  => absent,
	}


        #add the admin dir
        file { "/var/www/admin":
                ensure  => directory,
                owner   => "www-data",
                group   => "www-data",
                mode    => '644',
        }

	#Admin index.php page
        file { "/var/www/admin/index.php":
                ensure  => file,
                owner   => "www-data",
                group   => "www-data",
                mode    => '600',
                source  => 'puppet:///modules/camp_web/admin_index.php',
		require => File["/var/www/admin"],
        }

	#Main index.php page
        file { "/var/www/index.php":
                ensure  => file,
                owner   => "www-data",
                group   => "www-data",
                mode    => '600',
		source  => 'puppet:///modules/camp_web/index.php',
        }

        #robots
        file { "/var/www/robots.txt":
                ensure  => file,
                owner   => "www-data",
                group   => "www-data",
                mode    => '600',
                source  => 'puppet:///modules/camp_web/robots.txt',
        }


}
