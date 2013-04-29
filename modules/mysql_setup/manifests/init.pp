#Install and configure mysql
class mysql_setup {

	#Install mysql-server
	#Need to take account of stuff like lowercasetablenames etc in the config file
	#Probably have to copy a my.cnf over.
	class { 'mysql::server':
		config_hash => { 'root_password' => 'foo' }
	}


#	mysql::db { 'redcap':
 #               user     => 'redcap',
  #              password => 'mypass',
   #             host     => 'redcap',
    #            grant    => ['all'],
     #   }


	#redcap
	mysql_setup::app_db {'redcap':
		database => 'redcap',
		user     => 'redcap',
		host     => 'redcap',
	}

	#civicrm
	mysql_setup::app_db {'civicrm':
		database => 'civicrm',
		user     => 'civicrm',
		host     => 'civicrm',
	}


}

#Set up the database and output the password to a file.
define mysql_setup::app_db ($database, $user, $host) {


	#Figure out password
	#I could set this here, or I could read it in from somewhere
	$password="huh"

	#Print password to file
	$pw_string = 	"#Database config params set by puppet\nhost=mysql\ntype=mysql\ndatabase=$database\nuser=$user\npassword=$password"
	file { "/etc/brisskit/mysql/$user.cfg":
                content => "$pw_string",
        }


	#Make the database
	mysql::db { "$database":
                user     => "$user",
                password => "$password",
                host     => "$host",
                grant    => ['all'],
        }
}
