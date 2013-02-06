class hosts::customer {

	require hosts

	$parts = split($fqdn, '[.-]')
	$parts_hostname = split($fqdn, '[.]')
	$vapp_name = $parts[0]
	$vm_role = $parts[1]
	$vm_name = $parts_hostname[0]

	Host <<| tag == "${vapp_name}" |>>

	Host <<| tag == "ga" |>>
}
