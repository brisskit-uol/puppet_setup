# Manages host file entries

class hosts {

	# Create entry for localhost

	host { "localhost":
		ensure		=> present,
		ip		=> "127.0.0.1",
	}

	# Export entry for fqdn with aliases to PuppetDB and tag with vApp name

	@@host { $fqdn:
		ensure		=> present,
		ip		=> $ipaddress,
		host_aliases	=> ["${hostname}","${vm_role}",],
		tag		=> "${vapp_name}",
	}

}
