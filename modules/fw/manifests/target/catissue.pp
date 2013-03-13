class fw::target::catissue {

	require fw::target::customer

	#########################################
	# Export Allow SSH from catissue	#
	#########################################

	@@firewall { "110 allow SSH from ${vm_role}":

		source	=> "${hostname}",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

	#################################
	# Allow mysql from catissue	#
	#################################

	@@firewall { "400 allow mysql from ${vm_role}":

		source	=> "${hostname}",
		port	=> "3306",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "mysql", ],

	}

}
