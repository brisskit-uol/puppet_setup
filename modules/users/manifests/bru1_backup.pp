class users::bru1_backup {

	$username="bru1_backup"

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#########################################################################
	user { $username:
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/${username}",
                managehome => true,
        }



        #Make sure we have a home dir to put stuff in
        file { "/home/${username}":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
        }


        #Make sure we have a .ssh dir to put stuff in
	file { "/home/${username}/.ssh":
   		ensure  => directory,
  		owner   => "${username}",
		group   => "${username}",
		mode    => '644',
		require => File["/home/${username}"],
	}



}
