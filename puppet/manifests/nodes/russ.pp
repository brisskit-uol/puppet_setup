#################################################
#russ development work
#-NO BACKUPS
#################################################
#client1
node 'russ-client1.brisskit.le.ac.uk' {
	
	include hosts::customer

}

#client-2
node 'russ-client-2.brisskit.le.ac.uk' {

	include hosts::customer

}

#master
node 'russ-master.brisskit.le.ac.uk' {

	include hosts::customer

}
