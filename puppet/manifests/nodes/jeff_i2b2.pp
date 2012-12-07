#################################################
#jeff-i2b2 postgres development work
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#i2b2
node 'jeff-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::si84, users::jl99
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

