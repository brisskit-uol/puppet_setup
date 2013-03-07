class hosts::vapp_ipaddresses {

	# Function to allow manual creation of vApp entries

	define vapp_hosts ( $vapp_ipaddress ) {
		host { "${name}":
			ensure  => present,
			name    => $name,
			ip      => $vapp_ipaddress,
		}
	}

        vapp_hosts { "bru1": vapp_ipaddress => "192.168.0.104" }
	vapp_hosts { "bru3": vapp_ipaddress => "192.168.0.105" }
	vapp_hosts { "demo": vapp_ipaddress => "192.168.0.107" }
	vapp_hosts { "hack3": vapp_ipaddress => "192.168.0.118" }
	vapp_hosts { "hack4": vapp_ipaddress => "192.168.0.119" }
	vapp_hosts { "hack5": vapp_ipaddress => "192.168.0.120" }

}
