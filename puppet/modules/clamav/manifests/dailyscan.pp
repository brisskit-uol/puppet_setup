class clamav::dailyscan {

	require clamav
	require clamav::freshclam

	cron { "clamav-dailyscan":
		ensure	=> present,
		#command	=> "clamscan -ri --exclude-dir=^/sys\|^/proc\|^/dev / > dev/null 2>&1",
		command        => "clamscan -ri --exclude-dir=^/sys\|^/proc\|^/dev / > /var/log/clamav/scan.log",
		user	=> "root",
		minute	=> fqdn_rand(60),
		#minute => 50,
		hour	=> fqdn_rand(4) + 22,
		#hour => 15,
	}

}
