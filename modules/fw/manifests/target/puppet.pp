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

			# Requires multiple rules to cater for multiple
			# CIDR blocks

			#################################
			# Allow puppet from INTERNAL	#
			#################################

			firewall { "200 allow puppet from INTERNAL":

				source	=> "10.228.174.176/28",
				port	=> "8140",
				action	=> "accept",

			}

			firewall { "200 allow puppet from INTERNAL":

				source	=> "10.228.174.192/28",
				port	=> "8140",
				action	=> "accept",

			}

		}

	}

}
