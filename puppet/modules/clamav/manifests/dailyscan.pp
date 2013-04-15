class clamav::dailyscan {

	require clamav
	require clamav::freshclam

	cron { "clamav-dailyscan":
		ensure	=> absent,
		command        => "clamscan -ri --exclude-dir=^/sys\\|^/proc\\|^/dev / > /var/log/clamav/scan.log",
		user	=> "root",
		minute	=> fqdn_rand(60),
		hour	=> fqdn_rand(2) + 22,
	}

}
