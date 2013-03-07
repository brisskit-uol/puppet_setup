class fw::target::backup {

	require fw::target::ga

	case $environment {

		"eduserv": {

			#################################
			# Allow SSH from customer vApps	#
			#################################

			firewall { "110 allow SSH from INTERNAL":

				source	=> "192.168.2.0/24",
				port	=> "22",
				action	=> "accept",

			}

		}

		"uhl": {

			# Requires multiple rules to cater for multiple
			# CIDR blocks

			#################################
			# Allow SSH from customer vApps	#
			#################################

			firewall { "110 allow SSH from INTERNAL":

				source	=> "10.228.174.176/28",
				port	=> "22",
				action	=> "accept",

			}

			firewall { "110 allow SSH from INTERNAL":

				source	=> "10.228.174.192/28",
				port	=> "22",
				action	=> "accept",

			}

		}

	}

}
