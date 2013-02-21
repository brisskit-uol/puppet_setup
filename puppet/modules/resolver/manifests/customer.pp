class resolver::customer {

	require resolver

	resolv_conf { "customer":
		nameservers	=> ["8.8.8.8", "193.63.76.11"],
	}

}
