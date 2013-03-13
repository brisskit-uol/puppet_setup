class fw::target::customer {

	#########################################
	# Collect firewall rules from PuppetDB	#
	#########################################

	Firewall <<| tag == "${vapp_name}" and tag == "vappssh" |>>

        Firewall <<| tag == "${vapp_name}" and tag == "${vm_role}" |>>

}
