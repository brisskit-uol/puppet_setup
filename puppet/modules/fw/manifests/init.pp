class fw {

	include fw::pre, fw::post

	# Purge unmanaged firewall resources
	#
	# This will clear any existing rules, and make sure that only rules
	# defined in puppet exist on the machine

	resources { "firewall":
		purge => true
	}

	# These defaults ensure that the pre & post classes are run in the right
	# order to avoid potentially locking you out of your box during the
	# first puppet run.

	Firewall {
		before  => Class['fw::post'],
		require => Class['fw::pre'],
	}

	class { firewall: }

}
