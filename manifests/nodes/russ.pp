#################################################
#russ development work
#-NO BACKUPS
#################################################
#client1
node 'russ-client1.brisskit.le.ac.uk' {
	

}

#client-2
node 'russ-client-2.brisskit.le.ac.uk' {

	class { fw: stage => first }
	include fw::target::base

}

#master
node 'russ-master.brisskit.le.ac.uk' {


}
