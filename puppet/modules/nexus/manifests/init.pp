#Create user and group for the nexus maven VM
class nexus {

        #Make a group that all the files should belong to
        group { "nexus":
                ensure => present,
        }

        #Make the user
        user { "nexus":
                ensure     => present,
                shell      => "/bin/bash",
                gid        => "nexus",
                require    => Group["nexus"],
        }
}

