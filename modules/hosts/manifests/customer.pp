#This class makes sure there is an entry for each VM in a vApp in each of the hosts files.
#It does puppetDB queries to figure out the IP of each VM role, of one is missing it puts a default value.
class hosts::customer {

	require hosts

	#Collect all entries from PuppetDB that are in the ga vApp
	Host <<| tag == "ga" |>>

	#Build the customer entries
	require hosts::customer::make_hosts

}

#Get the IP addresses first
class hosts::customer::get_data {

	#Note the method used here, I couldnt use fqdn=$something as it doesnt seem to escape '-'
	#The pdbfactquery is also deprecated so I wanted to steer clear of that.
	#This query will return the IP address or an empty string if it is not found.
	#Also note the special cases (mysql and openesb) where Ive had to OR it as they have different names in places
	#I guess the smart thing to do is to add a regex for these, so they pick up e.g. role-# etc.
	
	#Had massive issues with the vapp_name not existing and knocking this over on the first run.
	if(!empty($vapp_name))
	{
		$camp_ip     = query_nodes("vm_role=camp and vapp_name=${vapp_name}",'ipaddress')
		$catissue_ip = query_nodes("vm_role=catissue and vapp_name=${vapp_name}",'ipaddress')
		$civicrm_ip  = query_nodes("vm_role=civicrm and vapp_name=${vapp_name}",'ipaddress')
		$i2b2_ip     = query_nodes("vm_role=i2b2 and vapp_name=${vapp_name}",'ipaddress')
		$mysql_ip    = query_nodes("(vm_role=mysql or vm_role=mysql2)and vapp_name=${vapp_name}",'ipaddress')
		$onyx_ip     = query_nodes("vm_role=onyx and vapp_name=${vapp_name}",'ipaddress')
		$opal_ip     = query_nodes("vm_role=opal and vapp_name=${vapp_name}",'ipaddress')
		$openesb_ip  = query_nodes("(vm_role=openesb or vm_role=openesbx) and vapp_name=${vapp_name}",'ipaddress')
		$pound_ip    = query_nodes("vm_role=pound and vapp_name=${vapp_name}",'ipaddress')

		#$fake_ip     = query_nodes("vm_role=pound and vapp_name=${vapp_name}",'ipaddress')
	}	
}



#Play with the data
class hosts::customer::mangle_data {

	require hosts::customer::get_data

	#notify{"pound=${mysql::get_data::pound_ip}":}
	#notify{"camp=${mysql::get_data::camp_ip}":}
	#notify{"fake=${mysql::get_data::fake_ip}":}

	#Might be worth doing some checks to see if array and on array size?
	#$type=type($mysql::get_data::fake_ipaddress)
	#$s=size($mysql::get_data::fake_ipaddress)

	#Might be worth checking IP address of form num.num.num.num
	#if $fake_ipaddress =~ /^\d+\.\d+\.\d+\.\d+$/

	#Check a value has been set, make it a default if it hasnt
	$default_ipaddress="127.0.0.1"
	if empty($hosts::customer::get_data::camp_ip)     { $camp     = "${default_ipaddress}" } else { $camp     = $hosts::customer::get_data::camp_ip }
        if empty($hosts::customer::get_data::catissue_ip) { $catissue = "${default_ipaddress}" } else { $catissue = $hosts::customer::get_data::catissue_ip }
        if empty($hosts::customer::get_data::civicrm_ip)  { $civicrm  = "${default_ipaddress}" } else { $civicrm  = $hosts::customer::get_data::civicrm_ip }
        if empty($hosts::customer::get_data::i2b2_ip)     { $i2b2     = "${default_ipaddress}" } else { $i2b2     = $hosts::customer::get_data::i2b2_ip }
        if empty($hosts::customer::get_data::mysql_ip)    { $mysql    = "${default_ipaddress}" } else { $mysql    = $hosts::customer::get_data::mysql_ip }
        if empty($hosts::customer::get_data::onyx_ip)     { $onyx     = "${default_ipaddress}" } else { $onyx     = $hosts::customer::get_data::onyx_ip }
        if empty($hosts::customer::get_data::opal_ip)     { $opal     = "${default_ipaddress}" } else { $opal     = $hosts::customer::get_data::opal_ip }
        if empty($hosts::customer::get_data::openesb_ip)  { $openesb  = "${default_ipaddress}" } else { $openesb  = $hosts::customer::get_data::openesb_ip }
	if empty($hosts::customer::get_data::pound_ip)    { $pound    = "${default_ipaddress}" } else { $pound    = $hosts::customer::get_data::pound_ip }

        #if empty($mysql::get_data::fake_ip)     { $fake     = "${default_ipaddress}" } else { $fake     = $mysql::get_data::fake_ip }

}

#Now build the hosts file
class hosts::customer::make_hosts {

	require hosts::customer::mangle_data

	#notify{"camp = ${hosts::customer::mangle_data::camp}":}
       	#notify{"catissue= ${hosts::customer::mangle_data::catissue}":}
       	#notify{"civicrm= ${hosts::customer::mangle_data::civicrm}":}
       	#notify{"i2b2= ${hosts::customer::mangle_data::i2b2}":}
       	#notify{"mysql= ${hosts::customer::mangle_data::mysql}":}
       	#notify{"onyx= ${hosts::customer::mangle_data::onyx}":}
       	#notify{"opal= ${hosts::customer::mangle_data::opal}":}
       	#notify{"openesb= ${hosts::customer::mangle_data::openesb}":}
	#notify{"pound= ${hosts::customer::mangle_data::pound}":}

	############################
	#The general ones. Each will be eg
	#1.2.3.4 brux-camp.brisskit.le.ac.uk brux-camp camp

	#Need to check vapp_name is set otherwise this fails.
	if(!empty($vapp_name))
	{
		#Camp
        	host { "${vapp_name}-camp.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::camp}",
                	host_aliases => ["${vapp_name}-camp","camp","junk"],
        	}

		#catissue
        	host { "${vapp_name}-catissue.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::catissue}",
                	host_aliases => ["${vapp_name}-catissue","catissue","junk"],
        	}

        	#civicrm
        	host { "${vapp_name}-civicrm.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::civicrm}",
                	host_aliases => ["${vapp_name}-civicrm","civicrm","junk"],
        	}

		#mysql
        	host { "${vapp_name}-mysql.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::mysql}",
                	host_aliases => ["${vapp_name}-mysql","mysql","junk"],
        	}

		#onyx
        	host { "${vapp_name}-onyx.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::onyx}",
                	host_aliases => ["${vapp_name}-onyx","onyx","junk"],
        	}

		#opal
        	host { "${vapp_name}-opal.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::opal}",
                	host_aliases => ["${vapp_name}-opal","opal","junk"],
        	}

        	#pound
        	host { "${vapp_name}-pound.brisskit.le.ac.uk":
                	ensure       => present,
                	ip           => "${hosts::customer::mangle_data::pound}",
                	host_aliases => ["${vapp_name}-pound","pound","junk"],
        	}



		############################
		#The special cases

		#i2b2
		#This needs to resolve vapp_name.brisskit.le.ac.uk back to POUND when on i2b2 VM
		#otherwise it complains about authentication.
		if $vm_role == 'i2b2'
		{
			#Is this supposed to be as well as or instead of?
        		host { "${vapp_name}.brisskit.le.ac.uk":
        	        	ensure  => present,
		                ip      => "${hosts::customer::mangle_data::pound}",
				comment => "For i2b2 self lookups.",
			}

		}
		#Still need the normal host entry.        
		host { "${vapp_name}-i2b2.brisskit.le.ac.uk":
        	       	ensure       => present,
        	       	ip           => "${hosts::customer::mangle_data::i2b2}",
        	       	host_aliases => ["${vapp_name}-i2b2","i2b2","junk"],
        	}


		#Openesb
	        #This needs to resolve vapp_name.brisskit.le.ac.uk back to openesb when on openesb VM
	        #otherwise it complains about authentication.
        	if ($vm_role == 'openesb') or ($vm_role == 'openesbx')
        	{
        	        host { "${vapp_name}.brisskit.le.ac.uk":
        	                ensure  => present,
        	                ip      => "${hosts::customer::mangle_data::openesb}",
				comment => "For openesb self lookups",
        	        }

        	}
       		#Still need the normal host entry.        
	        host { "${vapp_name}-openesbx.brisskit.le.ac.uk":
        	        ensure       => present,
                	ip           => "${hosts::customer::mangle_data::openesb}",
                	host_aliases => ["${vapp_name}-openesb.brisskit.le.ac.uk","${vapp_name}-openesbx","${vapp_name}-openesb","openesbx","openesb","junk"],
        	}       
	}
}
