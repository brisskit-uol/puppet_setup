class resolver::ga {

	require resolver

	resolv_conf { "ga":
		nameservers	=> ["8.8.8.8", "193.63.76.11"],
	}

}
