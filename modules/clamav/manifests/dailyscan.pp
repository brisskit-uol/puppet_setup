class clamav::dailyscan {

	require clamav
	require clamav::freshclam

	cron { "clamav-dailyscan":
		ensure	=> present,
		command	=> "clamscan -ri --exclude-dir=^/sys\|^/proc\|^/dev / > dev/null 2>&1",
		user	=> "root",
		minute	=> fqdn_rand(60),
		hour	=> fqdn_rand(2) + 22,
	}

}