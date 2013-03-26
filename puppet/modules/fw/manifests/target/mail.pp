class fw::target::mail {

	require fw::target::ga

	case $environment {

		"eduserv": {

			#################################
			# Allow SMTP from INTERNAL	#
			#################################

			firewall { "605 allow SMTP from INTERNAL":

				source	=> "192.168.0.0/24",
				port	=> "25",
				action	=> "accept",

			}

		}

		"uhl": {

			# Requires multiple rules to cater for multiple
			# CIDR blocks

			#################################
			# Allow SMTP from INTERNAL	#
			#################################

			firewall { "605 allow SMTP from INTERNAL":

				source	=> "10.228.174.176/28",
				port	=> "25",
				action	=> "accept",

			}

			firewall { "605 allow SMTP from INTERNAL":

				source	=> "10.228.174.192/28",
				port	=> "25",
				action	=> "accept",

			}

		}

	}

}
