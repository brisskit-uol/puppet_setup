#################################################
#demo
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'demo-camp.brisskit.le.ac.uk' {
        include roles::customer::camp 
}

#catissue
node 'demo-catissue.brisskit.le.ac.uk' {
        include roles::customer::catissue
}

#civicrm
node 'demo-civicrm.brisskit.le.ac.uk' {
        include roles::customer::civicrm
}

#i2b2
node 'demo-i2b2.brisskit.le.ac.uk' {
        include roles::customer::i2b2
}


#onyx
node 'demo-onyx.brisskit.le.ac.uk' {
        include roles::customer::onyx
}

#any other ones that have been missed out
node /^demo-.*$/ {
        include roles::customer::common
}

