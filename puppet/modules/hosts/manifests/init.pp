class hosts {

	host { "localhost":
		ensure		=> present,
		ip		=> "127.0.0.1",
		#target		=> "/tmp/hosts_test2",
	}

	@@host { $fqdn:
		ensure		=> present,
		ip		=> $ipaddress,
		host_aliases	=> ["${hostname}","${vm_role}",],
		tag		=> "${vapp_name}",
		#target		=> "/tmp/hosts_test2",
	}

}
