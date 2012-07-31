#####################################################################
#The various file structures

class backup::base {

	include backup::source_files


	#Make a group that all the files should belong to 
	group { "backup":
		ensure =>present,
	} 


	#########################################################################
	#Directories and files
	#########################################################################

	#brisskit backup dir
	file { "/var/local/brisskit/backup":
		ensure  => directory,
		owner   => 'root',
		group   => 'backup',
		mode    => 0644,
		require => Group["backup"],
	}

	#brisskit backup source directory
	file { "/var/local/brisskit/backup/source":
		ensure  => directory,
		owner   => 'root',
		group   => 'backup',
		mode    => 0644,
		require => [File["/var/local/brisskit/backup"], Group["backup"]],
	}


        #brisskit backup file destination directory
        file { "/var/local/brisskit/backup/files":
                ensure  => directory,
		recurse => true,
                owner   => 'root',
                group   => 'backup',
                mode    => 0664,
                require => [File["/var/local/brisskit/backup"], Group["backup"]],
        }

        #brisskit customer data backup file destination directory
        file { "/var/local/brisskit/backup/files/customer":
                ensure  => directory,
                recurse => true,
                owner   => 'root',
                group   => 'backup',
                mode    => 0664,
                require => [File["/var/local/brisskit/backup/files"], Group["backup"]],
        }

        #brisskit global admin backup file destination directory
        file { "/var/local/brisskit/backup/files/ga":
                ensure  => directory,
                recurse => true,
                owner   => 'root',
                group   => 'backup',
                mode    => 0664,
                require => [File["/var/local/brisskit/backup/files"], Group["backup"]],
        }


        #brisskit backup log directory
        file { "/var/local/brisskit/backup/log":
                ensure  => directory,
                recurse => true,
                owner   => 'root',
                group   => 'backup',
                mode    => 0664,
                require => [File["/var/local/brisskit/backup"], Group["backup"]],
        }
}


#####################################################################
#All the users

#The user that lives on the ga-master
class backup::users::master_backup {

        $username="master_backup"


       #Make a group that all the files should belong to 
        group { "${username}":
                ensure =>present,
        }

        #Make the user
        user { $username:
                ensure     => present,
                shell      => "/bin/bash",
                gid        => "${username}",
                groups     => "backup",
                home       => "/home/${username}",
                managehome => true,
                require    => Group["${username}"],
        }

        #Make sure we have a home dir to put stuff in
        file { "/home/${username}":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => [Group["${username}"], User["${username}"]],
        }

        #Make sure we have a .ssh dir to put stuff in
        file { "/home/${username}/.ssh":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => File["/home/${username}"],
        }

        #Make sure we have an authorized keys file to put keys in
        file { "/home/${username}/.ssh/authorized_keys":
                ensure  => file,
                owner   => "${username}",
                group   => "${username}",
                mode    => '600',
                require => File["/home/${username}/.ssh"],
        }



}


#The user that lives on the camp VM that runs it in vapp 
class backup::users::vapp_backup {

        $username="vapp_backup"	


       #Make a group that all the files should belong to 
        group { "${username}":
                ensure =>present,
        }

	#Make the user
        user { $username:
                ensure     => present,
                shell      => "/bin/bash",
		gid        => "${username}",
		groups     => "backup",
                home       => "/home/${username}",
                managehome => true,
		require    => Group["${username}"],
	}

        #Make sure we have a home dir to put stuff in
        file { "/home/${username}":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
		require => [Group["${username}"], User["${username}"]],
	}

        #Make sure we have a .ssh dir to put stuff in
        file { "/home/${username}/.ssh":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => File["/home/${username}"],
        }

        #Make sure we have an authorized keys file to put keys in
        file { "/home/${username}/.ssh/authorized_keys":
                ensure  => file,
                owner   => "${username}",
                group   => "${username}",
                mode    => '600',
                require => File["/home/${username}/.ssh"],
        }
}


#The user that lives on the VMs that do the backups
class backup::users::vm_backup {

        $username="vm_backup"


       #Make a group that all the files should belong to 
        group { "${username}":
                ensure =>present,
        }

        #Make the user
        user { $username:
                ensure     => present,
                shell      => "/bin/bash",
                gid        => "${username}",
                groups     => "backup",
                home       => "/home/${username}",
                managehome => true,
                require    => Group["${username}"],
        }

        #Make sure we have a home dir to put stuff in
        file { "/home/${username}":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => [Group["${username}"], User["${username}"]],
        }

        #Make sure we have a .ssh dir to put stuff in
        file { "/home/${username}/.ssh":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => File["/home/${username}"],
        }

        #Make sure we have an authorized keys file to put keys in
        file { "/home/${username}/.ssh/authorized_keys":
                ensure  => file,
                owner   => "${username}",
                group   => "${username}",
                mode    => '600',
                require => File["/home/${username}/.ssh"],
        }
}


#The user that lives on the VMs that do the backups
class backup::users::ga_backup {

        $username="ga_backup"


       #Make a group that all the files should belong to 
        group { "${username}":
                ensure =>present,
        }

        #Make the user
        user { $username:
                ensure     => present,
                shell      => "/bin/bash",
                gid        => "${username}",
                groups     => "backup",
                home       => "/home/${username}",
                managehome => true,
                require    => Group["${username}"],
        }

        #Make sure we have a home dir to put stuff in
        file { "/home/${username}":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => [Group["${username}"], User["${username}"]],
        }

        #Make sure we have a .ssh dir to put stuff in
        file { "/home/${username}/.ssh":
                ensure  => directory,
                owner   => "${username}",
                group   => "${username}",
                mode    => '644',
                require => File["/home/${username}"],
        }

        #Make sure we have an authorized keys file to put keys in
        file { "/home/${username}/.ssh/authorized_keys":
                ensure  => file,
                owner   => "${username}",
                group   => "${username}",
                mode    => '600',
                require => File["/home/${username}/.ssh"],
        }
}


