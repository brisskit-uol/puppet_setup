#Create user and group for the nexus maven VM
class nexus {

        #Make a group that all the files should belong to
        group { "nexus":
                ensure => present,
        }

        #Make the nexus user (nexus runs as this)
        user { "nexus":
                ensure     => present,
                shell      => "/bin/bash",
                gid        => "nexus",
                require    => Group["nexus"],
        }


	#Ideally I want to add nexus users to the nexus group here,
	#but I cant figure out how to do that.

}

