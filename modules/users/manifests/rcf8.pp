class users::rcf8{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on the gimp VM. UGLY!
	#########################################################################
	#Rob Free
        $rcf8_pw='$6$2P3m8sSV$Jw9iHdiAcxxFOUlcrVGotjA.JI9fZOJhhyT.nehBB28AT4lF8FiVkhPf44DJht3yeuHbDdCUyNoyhQXzwHKGt0'
        user { "rcf8":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/rcf8",
                managehome => true,
		groups     => ['admin'],
                password   => "$rcf8_pw",
        }
}
