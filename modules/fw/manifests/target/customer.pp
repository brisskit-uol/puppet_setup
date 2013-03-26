class fw::target::customer {

	require fw::target::base

	#########################################
	# Collect firewall rules from PuppetDB	#
	#########################################

	Firewall <<| tag == "${vapp_name}" and tag == "vappssh" |>>

        Firewall <<| tag == "${vapp_name}" and tag == "${vm_role}" |>>

	#######################
	# Export Allow SSH    #
	#######################

	@@firewall { "115 allow SSH from ${vm_role}":

		source  => "${ipaddress}",
		port    => "22",
		action  => "accept",
		tag     => [ "${vapp_name}", "vappssh", ],

	}

}
