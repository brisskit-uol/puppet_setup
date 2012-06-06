class users::ob30 {

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#########################################################################
	#Olly
        $ob30_pw='$6$pufwrR.L$0R9625P.e.Plqs4Dj8qMQ7BTf2Hzw5E.uYZQYXkZK.q.2K9oN.f1EddPOA2wMYD6fBhHW1v5GFsXwYhYvSD9B0'
        user { "ob30":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/ob30",
                managehome => true,
                password   => "$ob30_pw",
        }
}
