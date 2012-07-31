#####################################################################
#Copy the backup scripts around. For now I am just copying all of 
#them everywhere, when I get a chance I should case this.

class backup::source_files {

	#Lets figure out the vApp name
	$temp1 = split("${fqdn}", '[.]')
	$hostname = $temp1[0]
	notify{"Hostname: $hostname":}
	$temp2 = split("$hostname", '-')
	$role = $temp2[1]
	notify{"Role: $role":}

	#############################################################
	#Customer vapp data
	case $role
	{
		camp:
		{
		        #admin.sh script
		        file { "/var/local/brisskit/backup/source/admin.sh":
        		        ensure  => file,
        		        owner   => "root",
        		        group   => "backup",
        		        mode    => '650',
				source  => 'puppet:///modules/backup/customer/admin.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}

		        #vapp_master.sh script
        		file { "/var/local/brisskit/backup/source/vapp_master.sh":
                		ensure  => file,
                		owner   => "root",
                		group   => "backup",
                		mode    => '650',
                		source  => 'puppet:///modules/backup/customer/vapp_master.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}
		}
	
		catissue:
		{

		        #catissue.sh script
        		file { "/var/local/brisskit/backup/source/catissue.sh":
                		ensure  => file,
                		owner   => "root",
                		group   => "backup",
                		mode    => '650',
                		source  => 'puppet:///modules/backup/customer/catissue.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}
		}

		civicrm:
		{

			#civicrm.sh script
        		file { "/var/local/brisskit/backup/source/civicrm.sh":
                		ensure  => file,
                		owner   => "root",
                		group   => "backup",
                		mode    => '650',
				source  => 'puppet:///modules/backup/customer/civicrm.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}
		}

		onyx:
		{	
			#onyx.sh script
		        file { "/var/local/brisskit/backup/source/onyx.sh":
                		ensure  => file,
                		owner   => "root",
                		group   => "backup",
                		mode    => '650',
                		source  => 'puppet:///modules/backup/customer/onyx.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}

        	}
	}


	#############################################################
	#Global admin
	case $hostname
	{
		ga-backup:
		{
		        #puppet_master.sh script
        		file { "/var/local/brisskit/backup/source/puppet_master.sh":
                		ensure  => file,
                		owner   => "root",
                		group   => "backup",
                		mode    => '650',
                		source  => 'puppet:///modules/backup/ga/puppet_master.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}	

	        	#global_master.sh script
        		file { "/var/local/brisskit/backup/source/global_master.sh":
                		ensure  => file,
                		owner   => "root",
                		group   => "backup",
                		mode    => '650',
                		source  => 'puppet:///modules/backup/customer/global_master.sh',
                		require => File["/var/local/brisskit/backup/source"],
        		}
		}

		ga-puppet:
		{
                       #puppet.sh script
                        file { "/var/local/brisskit/backup/source/puppet.sh":
                                ensure  => file,
                                owner   => "root",
                                group   => "backup",
                                mode    => '650',
                                source  => 'puppet:///modules/backup/ga/puppet.sh',
                                require => File["/var/local/brisskit/backup/source"],
                        }
		}
	}
}
