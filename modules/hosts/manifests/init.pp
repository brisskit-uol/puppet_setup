# Manages host file entries

class hosts {

	# Create entry for localhost

	host { "localhost":
		ensure		=> present,
		ip		=> "127.0.0.1",
	}

	# Export entry for fqdn with aliases to PuppetDB and tag with vApp name

	case $vm_role {

		"maven", "maven2": {

			@@host { $fqdn:
				ensure		=> present,
				ip		=> $ipaddress,
				host_aliases	=> ["${vm_role}.brisskit.org","${hostname}","${vm_role}",],
				tag		=> "${vapp_name}",
			}

		}

		default: {

			@@host { $fqdn:
				ensure		=> present,
				ip		=> $ipaddress,
				host_aliases	=> ["${hostname}","${vm_role}",],
				tag		=> "${vapp_name}",
			}

		}

	}

}
