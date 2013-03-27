class roles::ga::mail {

	require roles::ga

	#################
	# Firewall	#
	#################

	include fw::target::mail

}
