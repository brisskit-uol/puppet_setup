class users::jl99{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on the gimp VM. UGLY!
	#########################################################################
	#Jeff
	$jl99_pw='$6$sUDIQM9G$CmOlasR//teeG3vrJVKdlhYk425GtiZYG2oSATdOk6LRn2DBevYf3nM8a8VK68oCignwWz9rXMvae.pU2Kwds0'
#        $jl99_pw='$6$sXsz31a8$oUGK6LDFEYCJQtDLDdDm7U4AJHcHXBCFJB3Xa49NXkhqpsh0m8oAurl5EfZpygDHVM8RgHAyFe4UJ5WLh6pxN/'
        user { "jl99":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/jl99",
                managehome => true,
		groups     => ['admin'],
                password   => "$jl99_pw",
        }
}
