#################################################
#demo
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'demo-camp.brisskit.le.ac.uk' {
        include bru_base
        include users::jl99, users::rcf8, users::si84, users::ss727, users::tb143
}

#catissue
node 'demo-catissue.brisskit.le.ac.uk' {
        include bru_base
        include postfix
        include users::integration, users::jl99, users::si84, users::ss727
	ssh::auth::client { "integration": }
        ssh::auth::server { "integration": }
}

#civicrm
node 'demo-civicrm.brisskit.le.ac.uk' {
        include bru_base
        include postfix
        include users::jl99, users::rcf8, users::si84, users::ss727, users::tb143
}

#i2b2
node 'demo-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::jl99, users::si84, users::ss727
        ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'demo-onyx.brisskit.le.ac.uk' {
        include bru_base
        include users::jl99
}

#any other ones that have been missed out
node /^demo-.*$/ {
        include bru_base
}

