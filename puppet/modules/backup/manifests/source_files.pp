#####################################################################
#Copy the backup scripts around. For now I am just copying all of 
#them everywhere, when I get a chance I should case this.

class backup::source_files {

        #admin.sh script
        file { "/var/local/brisskit/backup/source/admin.sh":
                ensure  => file,
                owner   => "root",
                group   => "backup",
                mode    => '610',
                require => File["/var/local/brisskit/backup/source"],
        }

	#civicrm.sh script
        file { "/var/local/brisskit/backup/source/civicrm.sh":
                ensure  => file,
                owner   => "root",
                group   => "backup",
                mode    => '610',
                require => File["/var/local/brisskit/backup/source"],
        }

        #global_master.sh script
        file { "/var/local/brisskit/backup/source/global_master.sh":
                ensure  => file,
                owner   => "root",
                group   => "backup",
                mode    => '610',
                require => File["/var/local/brisskit/backup/source"],
        }

        #vapp_master.sh script
        file { "/var/local/brisskit/backup/source/vapp_master.sh":
                ensure  => file,
                owner   => "root",
                group   => "backup",
                mode    => '610',
                require => File["/var/local/brisskit/backup/source"],
        }
}
