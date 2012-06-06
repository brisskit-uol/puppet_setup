class users::jl99{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on the gimp VM. UGLY!
	#########################################################################
	#Jeff
        $jl99_pw='$6$sXsz31a8$oUGK6LDFEYCJQtDLDdDm7U4AJHcHXBCFJB3Xa49NXkhqpsh0m8oAurl5EfZpygDHVM8RgHAyFe4UJ5WLh6pxN/'
        user { "jl99":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/jl99",
                managehome => true,
                password   => "$jl99_pw",
        }
}
