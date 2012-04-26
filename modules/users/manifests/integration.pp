class users::integration {

	#########################################################################
	#User::integration - The password hash is taken from /etc/shadow on this VM. UGLY!
	#
	#This user is used for integration - i.e. copying stuff from one VM to
	#i2b2. The private ssh key goes on the source systems and the public
	#key on i2b2. This way I can passwordlessly copy to i2b2, but not to 
	#the other VMs with the private key.
	#In the future I could lock this account down a lot more...
	#########################################################################
	$integration_pw='$6$hUNOhBMH$U8t1YDPO9mEPhYmkSwiwXn2xbHKdkJgtu710vQAPG.pOse0Fvl1kcXYKyKK4Xqje/NaRodaIsI6e1w8nlxMQS0'
#	user { "integration":
#		ensure     => present,
#		shell	   => "/bin/bash",
#		home	   => "/home/integration",
#		managehome => true,
#		password   => "$integration_pw",
#	}


	#Make sure we have a .ssh dir to put stuff in
#	file { "/home/integration/.ssh":
 #   		ensure  => directory,
  #  		owner   => 'integration',
#		group   => 'integration',
 #   		mode    => 0700,
#	}


	#Now we want to figure out what this machine does.
	$parts = split("${hostname}", '-')
	$vm_role = $parts[1]

	#Only copy the private key to catissue, civicrm, onyx, redcap
	if ( $vm_role == 'catissue') or ( $vm_role == 'civicrm' ) or ( $vm_role == 'onyx' ) or ( $vm_role == 'redcap' )
	{

		#Make sure user exists
		user { "integration":
                	ensure     => present,
                	shell      => "/bin/bash",
                	home       => "/home/integration",
                	managehome => true,
                	password   => "$integration_pw",
        	}


	        #Make sure we have a .ssh dir to put stuff in
        	file { "/home/integration/.ssh":
                	ensure  => directory,
                	owner   => 'integration',
                	group   => 'integration',
                	mode    => 0700,
        	}




		#Copy the private key across
		file { "/home/integration/.ssh/id_rsa":
			ensure => present,
			owner  => 'integration',
			group  => 'integration',
			mode   => 0700,
			source => "puppet:///modules/users/integration_id_rsa",
		}
	} elsif $vm_role == 'i2b2' {


       user { "integration":
                ensure     => present,
                shell      => "/bin/bash",
                home       => "/home/integration",
                managehome => true,
                password   => "$integration_pw",
        }


        #Make sure we have a .ssh dir to put stuff in
        file { "/home/integration/.ssh":
                ensure  => directory,
                owner   => 'integration',
                group   => 'integration',
                mode    => 0700,
        }





		#Only copy the public key to i2b2
		$integration_public_key='AAAAB3NzaC1yc2EAAAADAQABAAABAQDNTkWBjkd7eoSmo8yE1Mgg9e4s5wvqSMKKdZNfX/HXOFph8KiEBJYhgCs5XLK6hP9yZYaOYgP5Mt5OL3QKjSx/hidY2C5s8DR5xQ3dvxRaaz/8GD+KDsf/0ifQJKaocP3f/EgwXxHm77mA9WNtZ5bnOLeqnWdfMTzg8EpCBeHUwX4nfAZILTWHjad9NHVwN4h2bPbjkGdFf0eMsJM3PISMuyYYp9H1LYu0rXNasiZ+cQasThid95qlBDiqru5tLEA8bbcROArjRHXcLlo4Psh0JGUkcrcfrTuhyAUUH0Gzm5dJQT9BIldubmr3tQSMYACq2RjtHu0ovjWOHU7kNx6X'
		ssh_authorized_key { "integration-rsa-key":
   			ensure => 'present',
   			key => "$integration_public_key",
   			type => 'rsa',
   			user => 'integration',
   			require => File["/home/integration/.ssh"],
		}
	}
}
