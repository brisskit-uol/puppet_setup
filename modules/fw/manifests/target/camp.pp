class fw::target::camp {

	require fw::target::customer

	#########################################
	# Collect firewall rules from PuppetDB	#
	#########################################

	Firewall <<| tag == "${vapp_name}" and tag == "${vm_role}" |>>

	#################################
	# Export Allow SSH from camp	#
	#################################

	@@firewall { "110 allow SSH from ${vm_role}":

		source  => "${hostname}",
		port    => "22",
		action  => "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#################
	# Allow SSH	#
	#################

	firewall { "100 allow SSH from ga-gimp":

		source	=> "ga-gimp",
		port	=> "22",
		action	=> "accept",

	}

}
