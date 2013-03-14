class fw::target::customer {

	#########################################
	# Collect firewall rules from PuppetDB	#
	#########################################

	Firewall <<| tag == "${vapp_name}" and tag == "vappssh" |>>

        Firewall <<| tag == "${vapp_name}" and tag == "${vm_role}" |>>

	#######################
	# Export Allow SSH    #
	#######################

	@@firewall { "110 allow SSH from ${vm_role}":

		source  => "${ipaddress}",
		port    => "22",
		action  => "accept",
		tag     => [ "${vapp_name}", "vappssh", ],

	}

}
