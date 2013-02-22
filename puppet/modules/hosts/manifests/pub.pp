# Manage host file entries on servers with pub role

class hosts::pub {

	require hosts

	# Collect all entries from PuppetDB that are in the ga vApp

	Host <<| tag == "ga" |>>

	# Collect all entries from PuppetDB that are in the same vApp

	Host <<| tag == "${vapp_name}" |>> 

}
