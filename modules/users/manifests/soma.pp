class users::soma{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on the gimp VM. UGLY!
	#########################################################################
	#Soma
        $ss727_pw='$6$5HiDZcVq$wX0yMsxw9loZpKB90HnpvVQvtnrFZegN30Ju4RNYVAXyad/mXyEf3ILn0HWsVEF0uExgtjGRCGHfm3cJPKJiX0'
        user { "ss727":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/ss727",
                managehome => true,
                password   => "$ss727_pw",
        }
}
