class roles::ga::gimp {

	require roles::ga

	include motd

	#################
	# Firewall	#
	#################

	include fw::target::gimp

}
