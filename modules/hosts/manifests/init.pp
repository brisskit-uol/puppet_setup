class hosts {

	$parts = split("${fqdn}", '.-')
	$vapp_name = $parts[0]
	$vm_role = $parts[1]

	@@host { $fqdn:
		ensure		=> present,
		ip		=> $ipaddress,
		host_aliases	=> $vm_role,
		tag		=> $vapp_name,
	}

	Host <<| tag == $vapp_name |>>
}
