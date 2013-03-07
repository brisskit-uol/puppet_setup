class fw::target::onyx {

	require fw::target::customer

	#################################
	# Allow www from reverse proxy	#
	#################################

	firewall { "500 allow www from pound":

		source	=> "pound",
		port	=> "80",
		action	=> "accept",

	}

}
