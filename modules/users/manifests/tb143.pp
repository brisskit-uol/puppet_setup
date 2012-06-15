class users::tb143{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on the gimp VM. UGLY!
	#########################################################################
	#Tim
        $tb143_pw='$6$gMmYV4WM$NW8tMY8hcOZ5T4/zIDOMzB6E7HT.yV/zcLWcckqeuj1OmvknQnRc/I9w.iAW.Y2tk7dl5tuYZKvCn4I/ldjYe/'
        user { "tb143":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/tb143",
                managehome => true,
		groups     => ['admin'],
                password   => "$tb143_pw",
        }
}
