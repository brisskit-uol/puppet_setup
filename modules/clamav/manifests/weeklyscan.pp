class clamav::weeklyscan {

	require clamav
	require clamav::freshclam

	cron { "clamav-weeklyscan":
		ensure	=> present,
		command	=> "clamscan -ri --exclude-dir=^/sys\|^/proc\|^/dev / > dev/null 2>&1",
		user	=> "root",
		minute	=> fqdn_rand(60),
		hour	=> fqdn_rand(24),
		weekday	=> fqdn_rand(2) + 6,
	}

}
