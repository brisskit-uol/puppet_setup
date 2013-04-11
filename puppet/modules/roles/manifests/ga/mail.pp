class roles::ga::mail {

	require ::roles::ga::common

	#################
	# Firewall	#
	#################

	#include ::fw::target::mail
	#Needs the hosts file to be made first
	class {::fw::target::mail: stage => third }
}
