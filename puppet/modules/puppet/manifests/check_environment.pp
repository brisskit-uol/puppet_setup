#We have some environment specific stuff that gets picked up by using the environment variable
#that gets set in the puppet.conf file. So, we have to be certain this is a sensible value.
#This will fail this run if it is an unexpected value.
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
			notify{"Bad environment variable set in puppet.conf. I have ${environment}":}
			fail("Bad environment variable set in puppet.conf. I have: ${environment}")
		}
	}
}
