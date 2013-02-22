###########################################################
#Put a motd file on gimp
class motd {

        file { "/etc/update-motd.d/99-brisskit":
                path    => "/etc/update-motd.d/99-brisskit",
		ensure  => present,
                owner   => root,
                group   => root,
                mode    => 755,
                source => "puppet:///modules/motd/gimp.txt",
        }

}
