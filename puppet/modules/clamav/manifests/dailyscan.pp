class clamav::dailyscan {

	require clamav
	require clamav::freshclam

	cron { "clamav-dailyscan":
		ensure	=> present,
		command        => "clamscan -ri --exclude-dir=^/sys\\|^/proc\\|^/dev / > /var/log/clamav/scan.log",
		user	=> "root",
		minute	=> fqdn_rand(30),
		hour	=> 14,
	}

}
