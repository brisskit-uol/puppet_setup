class fw::target::puppet {

	require fw::target::ga

	#########################
	# Allow 8080 from ANY   #       
	#########################

	firewall { "505 allow 8080 from ANY":

		port    => "8080",
		action  => "accept",

	}


	case $environment {

		"eduserv": {

			#################################
			# Allow puppet from INTERNAL	#
			#################################

			firewall { "205 allow puppet from INTERNAL":

				source	=> "192.168.0.0/24",
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

			firewall { "205 allow puppet from INTERNAL":

				source	=> "10.228.174.176/28",
				port	=> "8140",
				action	=> "accept",

			}

			firewall { "207 allow puppet from INTERNAL":

				source	=> "10.228.174.192/28",
				port	=> "8140",
				action	=> "accept",

			}

		}

	}

}
