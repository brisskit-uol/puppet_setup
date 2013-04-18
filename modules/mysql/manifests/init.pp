class mysql {

#      $pound_ipaddress = pdbfactquery("${vapp_name}-pound.brisskit.le.ac.uk", "ipaddress")
#	$spound_ipaddress = query_nodes('vapp_name="${vapp_name}"','ipaddress')

  $pound_ipaddress = query_nodes('fqdn="bru1-pound.brisskit.le.ac.uk"','ipaddress')
 $camp_ipaddress = query_nodes('fqdn="bru1-camp.brisskit.le.ac.uk"','ipaddress')
 $fake_ipaddress = query_facts('fqdn="bru1-fake.brisskit.le.ac.uk"','ipaddress')
#$fake_ipaddress=undef




notify{"$pound_ipaddress": }
#inotify{"$fake_ipaddress": }

      file { "test":
      	   path    => "/etc/brisskit/mysqltest.conf",
	   content => template("mysql/settings.erb"),
	   }

}
