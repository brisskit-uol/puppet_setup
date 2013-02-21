class resolver::global {

	require resolver

	resolv_conf { "global":
		nameservers	=> ["8.8.8.8", "193.63.76.11"],
	}

}
