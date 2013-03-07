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

			# Requires network address information

			#################################
			# Allow SSH from customer vApps	#
			#################################

			#firewall { "110 allow SSH from INTERNAL":

				#source	=> "192.168.2.0/24",
				#port	=> "22",
				#action	=> "accept",

			#}

		}

	}

}
