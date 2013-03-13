class fw::target::i2b2 {

	require fw::target::customer

	#################################
	# Export Allow SSH from i2b2	#
	#################################

	@@firewall { "110 allow SSH from i2b2":

		source	=> "${vapp_name}-i2b2",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#########################
	# Allow www from i2b2	#
	#########################

	@@firewall { "500 allow www from i2b2":

		source	=> "${vapp_name}-i2b2",
		port	=> "80",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "civicrm", ],

	}

}
