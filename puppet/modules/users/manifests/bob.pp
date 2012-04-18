class users::bob {

	#########################################################################
	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#########################################################################
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


	#Make sure we have a .ssh dir to put stuff in
	file { "/home/bob/.ssh":
    		ensure  => directory,
    		owner   => 'bob',
		group   => 'bob',
    		mode    => 0700,
	}

	#Copy the private key across
	file { "/home/bob/.ssh/id_rsa":
		ensure => present,
		owner  => 'bob',
		group  => 'bob',
		mode   => 0700,
		source => "puppet:///modules/base/bru1_bob_id_rsa",
	}

	$bob_public_key='AAAAB3NzaC1yc2EAAAADAQABAAABAQDNTkWBjkd7eoSmo8yE1Mgg9e4s5wvqSMKKdZNfX/HXOFph8KiEBJYhgCs5XLK6hP9yZYaOYgP5Mt5OL3QKjSx/hidY2C5s8DR5xQ3dvxRaaz/8GD+KDsf/0ifQJKaocP3f/EgwXxHm77mA9WNtZ5bnOLeqnWdfMTzg8EpCBeHUwX4nfAZILTWHjad9NHVwN4h2bPbjkGdFf0eMsJM3PISMuyYYp9H1LYu0rXNasiZ+cQasThid95qlBDiqru5tLEA8bbcROArjRHXcLlo4Psh0JGUkcrcfrTuhyAUUH0Gzm5dJQT9BIldubmr3tQSMYACq2RjtHu0ovjWOHU7kNx6X'
	ssh_authorized_key { "bob-rsa-key":
   		ensure => 'present',
   		key => "$bob_public_key",
   		type => 'rsa',
   		user => 'bob',
   		require => File["/home/bob/.ssh"],
	}
}
