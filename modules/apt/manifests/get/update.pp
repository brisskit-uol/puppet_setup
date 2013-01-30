class apt::get::update {

	cron { "apt-get-update":
		ensure	=> present,
		command	=> "/usr/bin/apt-get update > /dev/null 2>&1",
		user	=> "root",
		minute	=> fqdn_rand(60),
		hour	=> fqdn_rand(4),
		weekday	=> fqdn_rand(7),
	}

}
