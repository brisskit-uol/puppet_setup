class hosts::customer {

	require hosts

	Host <<| tag == "ga" |>>

	if $vm_role == "openesb" {

		$openesb_hostname = "${vapp_name}.brisskit.le.ac.uk"

		Host <<| ip != "${ipaddress}" and tag == "${vapp_name}" |>>

		host { $openesb_hostname:
			ensure		=> present,
			ip		=> $ipaddress,
			host_aliases	=> [ "${fqdn}", "${hostname}", "${vm_role}", ],
			tag		=> "${vapp_name}",
		}

	}

	else {

		Host <<| tag == "${vapp_name}" |>>

	}

}
