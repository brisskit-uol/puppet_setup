class users::jim {

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting user jim config $vapp_name":}


	#########################################################################
	#Users - The password hash is taken from /etc/shadow on this VM. UGLY!
	#########################################################################
	#Fictional user
	$jim_pw='$6$hUNOhBMH$U8t1YDPO9mEPhYmkSwiwXn2xbHKdkJgtu710vQAPG.pOse0Fvl1kcXYKyKK4Xqje/NaRodaIsI6e1w8nlxMQS0'
	user { "jim":
		ensure     => present,
		shell	   => "/bin/bash",
		home	   => "/home/jim",
		managehome => true,
		groups     => 'admin',
		password   => "$jim_pw",
	}
}
