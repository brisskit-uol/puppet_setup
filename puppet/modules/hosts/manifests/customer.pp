# Manage host file entries on servers with a customer (vApp) role

class hosts::customer {

	require hosts

	$vapp_hostname = "${vapp_name}.brisskit.le.ac.uk"

	# Collect all entries from PuppetDB that are in the ga vApp

	Host <<| tag == "ga" |>>

	# Role specific host entries 

	case $vm_role {

			"openesb", "openesbx": {

			# Collect host entries that do not have the same IP
			# addresses as the openesb server and are in the
			# same vApp

			Host <<| ip != "${ipaddress}" and tag == "${vapp_name}" |>>

			# Create host entries specifically for the openesb
			# server

			host { $vapp_hostname:
				ensure		=> present,
				ip		=> $ipaddress,
				host_aliases	=> [ "${fqdn}", "${hostname}", "${vm_role}", ],
				tag		=> "${vapp_name}",
			}

		}

		"i2b2": {

			# Collect host entries from PuppetDB that are in
			# the same vApp

			Host <<| tag == "${vapp_name}" |>>

			# Create host entries specifically for the i2b2
			# server

			$pound_ipaddress = pdbfactquery("${vapp_name}-pound.brisskit.le.ac.uk", "ipaddress")

			host { $vapp_hostname:
				ensure	=> present,
				ip	=> $pound_ipaddress,
				tag	=> "${vapp_name}",
			}

		}

		default: {

			# On all servers not specified above collect host
			# entries from PuppetDB that are in the same vApp

			Host <<| tag == "${vapp_name}" |>>

		}

	}

}
