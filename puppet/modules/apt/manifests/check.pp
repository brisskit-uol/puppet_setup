class apt::check {

	# Install package used to check for pending updates
		
	package { "update-notifier-common":
		ensure	=> installed,
	}

}
