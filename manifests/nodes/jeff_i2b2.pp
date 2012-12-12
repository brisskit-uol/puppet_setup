#################################################
#jeff-i2b2 postgres development work
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#i2b2
node 'jeff-i2b2.brisskit.le.ac.uk' {
        include base_customer
	
	include users::customer_i2b2
        include users::integration

	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

