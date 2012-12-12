class users::russ{

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#########################################################################
	#russ
	$russ_pw='$6$Sh67MGFD$.DRno69E81ihD63JrWCJU9KIZricuXm2kTxSUJKZAlWkunZ3/4Mj0QCbI9obp/d4F.YUOfGjhDFWy7ZkHymO/0'
        user { "russ":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/russ",
                managehome => true,
		groups     => ['admin'],
                password   => "$russ_pw",
        }
}
