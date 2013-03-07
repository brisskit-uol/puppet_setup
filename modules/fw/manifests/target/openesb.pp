class fw::target::openesb {

	require fw::target::customer

	#################################
	# Allow 9080 from civicrm	#
	#################################

	firewall { "500 allow 9080 from civicrm":

		source	=> "civicrm",
		port	=> "9080",
		action	=> "accept",

	}

}
