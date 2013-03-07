class fw::target::civicrm {

	require fw::target::customer

	#################################
	# Allow www from reverse proxy	#
	#################################

	firewall { "500 allow www from pound":

		source	=> "pound",
		port	=> "80",
		action	=> "accept",

	}

	#########################
	# Allow www from i2b2	#
	#########################

	firewall { "500 allow www from i2b2":

		source	=> "i2b2",
		port	=> "80",
		action	=> "accept",

	}

}
