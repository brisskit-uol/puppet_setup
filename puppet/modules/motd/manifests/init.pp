#Get rid of some of the motd stuff I dont want to show.
class motd {

	#link to ubuntu.com for help
	file {"/etc/update-motd.d/10-help-text":
		path   => "/etc/update-motd.d/10-help-text",
		ensure => absent,
	}

	#note about a newer ubuntu release being available
       	file {"/etc/update-motd.d/91-release-upgrade":
                path   => "/etc/update-motd.d/91-release-upgrade",
                ensure => absent,
        }
}



###########################################################
#Put a motd file on gimp
class motd::gimp {

        file { "/etc/update-motd.d/99-brisskit":
                path    => "/etc/update-motd.d/99-brisskit",
		ensure  => present,
                owner   => root,
                group   => root,
                mode    => 755,
                source => "puppet:///modules/motd/gimp.txt.${environment}",
        }

}
