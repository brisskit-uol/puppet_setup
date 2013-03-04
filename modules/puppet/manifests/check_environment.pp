class puppet::check_environment {

	#Need to double check we have a valid environment
	case "${environment}"
	{
		eduserv:
		{
			notify{"Eduserv!":}
		}

		uhl:
		{
			notify{"UHL!":}
		}

		default:
		{
			notify{"Bad environment set! I have ${environment}":}
			fail('Bad environment variable set in puppet.conf')
		}
	}
}
