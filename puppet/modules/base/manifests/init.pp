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
	$bob_pw='$6$hUNOhBMH$U8t1YDPO9mEPhYmkSwiwXn2xbHKdkJgtu710vQAPG.pOse0Fvl1kcXYKyKK4Xqje/NaRodaIsI6e1w8nlxMQS0'
	user { "bob":
		ensure => present,
		shell	=> "/bin/bash",
		home	=> "/home/bob",
		managehome => true,
		password => "$bob_pw",
	}

}
