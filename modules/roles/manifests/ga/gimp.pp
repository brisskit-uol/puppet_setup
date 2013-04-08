class roles::ga::gimp {

	require ::roles::ga

	include ::motd

	#################
	# Firewall	#
	#################

	#include ::fw::target::gimp
	#Needs the hosts file to be made first
	class {::fw::target::gimp: stage => third}
}
