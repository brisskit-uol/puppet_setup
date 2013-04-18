class mysql {

      $pound_ipaddress = pdbfactquery("${vapp_name}-pound.brisskit.le.ac.uk", "ipaddress")

      file { "test":
      	   path    => "/etc/brisskit/mysqltest.conf",
	   content => template("mysql/settings.erb"),
	   }

}