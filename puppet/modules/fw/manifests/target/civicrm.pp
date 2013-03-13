class fw::target::civicrm {

	require fw::target::customer

	#################################
	# Export Allow SSH from civicrm	#
	#################################

	@@firewall { "110 allow SSH from civicrm":

		source	=> "${vapp_name}-civicrm",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#################################
	# Allow mysql from civicrm	#
	#################################

	@@firewall { "400 allow mysql from civicrm":

		source	=> "${vapp_name}-civicrm",
		port	=> "3306",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "mysql", ],

	}

	#################################
	# Allow 9080 from civicrm	#
	#################################

	@@firewall { "500 allow 9080 from civicrm":

		source	=> "${vapp_name}-civicrm",
		port	=> "9080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "openesb", ],

	}

}
