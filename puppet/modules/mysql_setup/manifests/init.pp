#Install and configure mysql
class mysql_setup {

	#Install mysql-server
	#Need to take account of stuff like lowercasetablenames etc in the config file
	#Probably have to copy a my.cnf over.
	class { 'mysql::server':
		config_hash => { 'root_password' => 'foo' }
	}


	mysql_setup::add_user {'jim': 
		database => 'test2',
		user => 'jim',
		host => 'somehost',
		ensure => 'absent',
	}


        #catisue
        mysql_setup::add_user {'catissue':
                database => 'catissue',
                user     => 'catissue',
                host     => 'catissue',
        }

        #civicrm
        mysql_setup::add_user {'civicrm':
                database => 'civicrm',
                user     => 'civicrm',
                host     => 'civicrm',
        }

        #onyx
        mysql_setup::add_user {'onyx':
                database => 'onyx',
                user     => 'onyx',
                host     => 'onyx',
        }

        #opal
        mysql_setup::add_user {'opal':
                database => 'opal',
                user     => 'opal',
                host     => 'opal',
        }


	#redcap
	mysql_setup::add_user {'redcap':
                database => 'redcap',
                user     => 'redcap',
                host     => 'redcap',
        }



}


#Set up the DB, the user, and its grants. The host variable is the ROLE the VM has.
define mysql_setup::add_user ($database, $user, $host, $grant = 'all', $ensure = 'present') {


	#Make the DB. 
        database {"$database":
                ensure => "$ensure",
        }


	#$temp=loadyaml("/etc/brisskit/mysql/$user.cfg")

	file { "/etc/brisskit/mysql/$user.yaml":
		ensure => 'present',
	#	source => "puppet:///modules/mysql/$user.yaml",
	}


	#Figure out password
        #I could set this here, or I could read it in from somewhere
        $password="huh"

        #Print password to file
        $pw_string =    "#Database config params set by puppet\nhost=mysql\ntype=mysql\ndatabase=$database\nuser=$user\npassword=$password"
        file { "/etc/brisskit/mysql/$user.cfg":
                content => "$pw_string",
        }


	#Set up the user. Note how this uses three different hostnames, this is because
	#the various apps connect under different hostnames.
	
	#user@shortname
	database_user {"${user}@${host}":
		ensure        => "$ensure",
		password_hash => mysql_password($password),
	}

        #user@vapp-shortname
        database_user {"${user}@${vapp_name}-${host}":
                ensure        => "$ensure",
                password_hash => mysql_password($password),
        }

        #user@vapp-shortname.brisskit.le.ac.uk
        database_user {"${user}@${vapp_name}-${host}.brisskit.le.ac.uk":
                ensure        => "$ensure",
                password_hash => mysql_password($password),        
	}


	#Do the grants
  	
	#user@shortname
	database_grant {"${user}@${host}/${database}":
      		privileges => $grant,
      		provider   => 'mysql',
      		require    => Database_user["${user}@${host}"],
    	}

        #user@vapp-shortname
        database_grant {"${user}@${vapp_name}-${host}/${database}":
                privileges => $grant,
                provider   => 'mysql',
                require    => Database_user["${user}@${vapp_name}-${host}"],
        }

        #user@vapp-shortname.brisskit.le.ac.uk
        database_grant {"${user}@${vapp_name}-${host}.brisskit.le.ac.uk/${database}":
                privileges => $grant,
                provider   => 'mysql',
                require    => Database_user["${user}@${vapp_name}-${host}.brisskit.le.ac.uk"],
        }
}



