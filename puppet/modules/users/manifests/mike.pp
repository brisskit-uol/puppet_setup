class users::mike {

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#########################################################################
        user { "mike":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/mike",
                managehome => true,
		gid        => 'mike',
		groups     => ['admin'],
                password   => 'temp',
        }
}
