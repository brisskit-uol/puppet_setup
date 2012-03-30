class base {

	notify{"Starting base config":}

	#hosts file
	file { "/etc/hosts":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///modules/base/hosts",
	}

	#brisskit config directory
	file { "/etc/brisskit":
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => 0644,
	}

	#brisskit install directory
	file { "/var/local/brisskit":
		ensure => directory,
		owner => 'root',
		group => 'root',
		mode => 0644,
	} 


	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#Fictional user
	$bob_pw='$6$hUNOhBMH$U8t1YDPO9mEPhYmkSwiwXn2xbHKdkJgtu710vQAPG.pOse0Fvl1kcXYKyKK4Xqje/NaRodaIsI6e1w8nlxMQS0'
	user { "bob":
		ensure     => present,
		shell	   => "/bin/bash",
		home	   => "/home/bob",
		managehome => true,
		groups     => 'admin',
		password   => "$bob_pw",
	}

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
