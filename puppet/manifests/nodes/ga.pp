#################################################
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
#################################################

#puppet master. Be careful not to become self aware :)
node ga-puppet {
	include roles::ga::puppet
}

#mail server
node 'ga-mail.brisskit.le.ac.uk' {
	include roles::ga::mail
}

#backup vm
node ga-backup {
	include roles::ga::backup

	include clamav::dailyscan
}

#global ssh gateway
node 'ga-gimp.brisskit.le.ac.uk' {
	include roles::ga::gimp
}

#private web server
node 'ga-private.brisskit.le.ac.uk' {
	include base_ga
	realize( Users::Virtual::Ssh_user["jl99"] )
	realize( Users::Virtual::Ssh_user["si84"] )

}

#maven server
node 'ga-maven.brisskit.le.ac.uk' {
        include base_ga
	include nexus
        realize( Users::Virtual::Ssh_user["jl99"] )

}

#maven server
node 'ga-maven2.brisskit.le.ac.uk' {
	include roles::ga::maven
}


#nagios server
node 'ga-nagios.brisskit.le.ac.uk' {
	include roles::ga::nagios
}

