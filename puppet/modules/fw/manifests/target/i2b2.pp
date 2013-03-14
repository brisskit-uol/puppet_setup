class fw::target::i2b2 {

	require fw::target::customer

	#########################
	# Allow www from i2b2	#
	#########################

	@@firewall { "500 allow www from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "80",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "civicrm", ],

	}

}
