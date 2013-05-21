class hosts::vapp_ipaddresses {

	# Function to allow manual creation of vApp entries

	define vapp_hosts ( $vapp_ipaddress ) {
		host { "${name}":
			ensure  => present,
			name    => $name,
			ip      => $vapp_ipaddress,
		}
	}

        vapp_hosts { "bru1":  vapp_ipaddress => "192.168.0.101" }
        vapp_hosts { "bru2":  vapp_ipaddress => "192.168.0.106" }
	vapp_hosts { "demo":  vapp_ipaddress => "192.168.0.100" }
	vapp_hosts { "hack3": vapp_ipaddress => "192.168.0.118" }
	
	vapp_hosts {"uhl":    vapp_ipaddress => "10.228.174.190"}
}
