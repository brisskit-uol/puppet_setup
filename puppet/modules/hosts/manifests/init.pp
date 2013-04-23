#Manages host file entries.
#Im only exporting and collecting ga and pub since the customer vapps need a lot more care and attention.

class hosts {

	# Create entry for localhost

	host { "localhost":
		ensure		=> present,
		ip		=> "127.0.0.1",
	}

	#Export entry for fqdn with aliases to PuppetDB and tag with vApp name for ga and pub vapps
	if $vapp_name == 'ga' or $vapp_name == 'pub'
	{
		case $vm_role {

			"maven", "maven2": {
				@@host { $fqdn:
					ensure		=> present,
					ip		=> $ipaddress,
					host_aliases	=> ["maven.brisskit.org","${vm_role}.brisskit.org","${hostname}","${vm_role}",],
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
}
