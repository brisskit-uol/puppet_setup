class fw::target::customer {

	#########################################
	# Collect firewall rules from PuppetDB	#
	#########################################

	Firewall <<| tag == "${vapp_name}" |>>

	#########################################
	# Allow SSH from all VMs in vApp	#
	#########################################

#	firewall { "110 allow SSH from camp":
#
#		source	=> "camp",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from catissue":
#
#		source	=> "catissue",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from civicrm":
#
#		source	=> "civicrm",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from i2b2":
#
#		source	=> "i2b2",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from mysql":
#
#		source	=> "mysql",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from onyx":
#
#		source	=> "onyx",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from openesb":
#
#		source	=> "openesb",
#		port	=> "22",
#		action	=> "accept",
#
#	}

#	firewall { "110 allow SSH from pound":
#
#		source	=> "pound",
#		port	=> "22",
#		action	=> "accept",
#
#	}

}
