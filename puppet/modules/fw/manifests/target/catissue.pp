class fw::target::catissue {

	require fw::target::customer

	#################################
	# Allow mysql from catissue	#
	#################################

	@@firewall { "400 allow mysql from ${vm_role}":

		source	=> "${ipaddress}",
		port	=> "3306",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "mysql", ],

	}

}
