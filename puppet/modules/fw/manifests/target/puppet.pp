class fw::target::puppet {

	require fw::target::ga

	#########################
	# Allow 8080 from ANY   #       
	#########################

	firewall { "500 allow 8080 from ANY":

		port    => "8080",
		action  => "accept",

	}


	case $environment {

		"eduserv": {

			#################################
			# Allow puppet from INTERNAL-GA	#
			#################################

			firewall { "200 allow puppet from INTERNAL-GA":

				source	=> "192.168.0.0/24",
				port	=> "8140",
				action	=> "accept",

			}

			#########################################
			# Allow puppet from INTERNAL-CUSTOMER	#
			#########################################

			firewall { "200 allow puppet from INTERNAL-CUSTOMER":

				source	=> "192.168.2.0/24",
				port	=> "8140",
				action	=> "accept",

			}

		}

		"uhl": {

			# Requires network address information

			#################################
			# Allow SMTP from INTERNAL	#
			#################################

			#firewall { "600 allow SMTP from INTERNAL":

				#source	=> "192.168.2.0/24",
				#port	=> "25",
				#action	=> "accept",

			#}

		}

	}

}
