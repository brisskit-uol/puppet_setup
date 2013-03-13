class fw::target::onyx {

	require fw::target::customer

	#################################
	# Export Allow SSH from onyx	#
	#################################

	@@firewall { "110 allow SSH from onyx":

		source	=> "${vapp_name}-onyx",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#########################
	# Allow mysql from onyx	#
	#########################

	@@firewall { "400 allow mysql from onyx":

		source	=> "${vapp_name}-onyx",
		port	=> "3306",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "mysql", ],

	}

}
