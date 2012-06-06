class users::si84{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on the gimp VM. UGLY!
	#########################################################################
	#Saj
        $si84_pw='$6$33o7S6Zz$heDp.TsPOLgevc2/1Pq9.mLDUegbgmvYXJasLhqnlfsi368SjXh4xVMMVCJwOjOTyA8Prtxqh/d9mYUZWLhmw/'
        user { "si84":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/si84",
                managehome => true,
                password   => "$si84_pw",
        }
}
