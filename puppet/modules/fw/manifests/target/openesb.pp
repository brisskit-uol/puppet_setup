class fw::target::openesb {

	require fw::target::customer

	#################################
	# Allow 8080 from openesb	#
	#################################

	@@firewall { "500 allow 8080 from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "8080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "catissue", ],

	}

}
