class resolver::global {

	require resolver

	case $environment {

		# Use UHL DNS servers as supplied by BRICCS

		"uhl": {

			resolv_conf { "global":
				nameservers	=> ["10.147.126.165", "10.147.126.166", "10.156.249.165", "10.156.249.166", "10.160.15.165", "10.160.15.166", "8.8.8.8", "8.8.4.4",],
			}

		}

		# Use Google and Eduserv DNS servers

		"eduserv": {

			resolv_conf { "global":
				nameservers	=> ["8.8.8.8", "193.63.76.11",],
			}

		}

		# Use pre-defined DNS servers

		default: {

			resolv_conf { "global": }

		}

	}

}
