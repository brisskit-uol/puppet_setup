class hosts {

	$parts = split($fqdn, '[.-]')
	$parts_hostname = split($fqdn, '[.]')
	$vapp_name = $parts[0]
	$vm_role = $parts[1]
	$vm_name = $parts_hostname[0]

	host { "localhost":
		ensure		=> present,
		ip		=> "127.0.0.1",
		target		=> "/tmp/hosts_test2",
	}

	@@host { $fqdn:
		ensure		=> present,
		ip		=> $ipaddress,
		host_aliases	=> [ "${vm_name}", "${vm_role}", ],
		tag		=> "${vapp_name}",
		target		=> "/tmp/hosts_test2",
	}

}
