# Manage host file entries on servers with ga role

class hosts::ga {

	require hosts

	# Collect all entries from PuppetDB that are in the same vApp

	Host <<| tag == "${vapp_name}" |>> 

	# Add manual entries for vApp names

	include hosts::vapp_ipaddresses

}
