class fw::target::civicrm {

	require fw::target::customer

	#################################
	# Allow mysql from civicrm	#
	#################################

	@@firewall { "400 allow mysql from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "3306",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "mysql", ],

	}

	#################################
	# Allow 9080 from civicrm	#
	#################################

	@@firewall { "500 allow 9080 from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "9080",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "openesb", ],

	}

}
