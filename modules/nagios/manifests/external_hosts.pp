#It is useful to be able to monitor some hosts/services outside our our infrastructure.
#This will copy HAND MADE (i.e not made by puppet) host and service files into nagios.
class nagios::external_hosts {

	#Set up the defaults for these files
	File {
                ensure  => file,
                owner   => 'root',
                group   => 'root',
                mode    => 0644,
		notify	=> Service["nagios3"],
	}


        #uol-drupal.brisskit.le.ac.uk - Our drupal pageson the UoL LAMP stack
        file { "/etc/nagios3/conf.d/host_uol-drupal.brisskit.le.ac.uk.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/host_uol-drupal.brisskit.le.ac.uk.cfg",
        }

        file { "/etc/nagios3/conf.d/service_uol-drupal.brisskit.le.ac.uk.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/service_uol-drupal.brisskit.le.ac.uk.cfg",
        }


	#opalserver1.datashield.org
	file { "/etc/nagios3/conf.d/host_uol-opalserver1.datashield.org.cfg":
		source	=> "puppet:///modules/nagios/external_hosts/uol/conf/host_uol-opalserver1.datashield.org.cfg",
	}

        file { "/etc/nagios3/conf.d/service_uol-opalserver1.datashield.org.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/service_uol-opalserver1.datashield.org.cfg",
        }


	#opalserver2.datashield.org
        file { "/etc/nagios3/conf.d/host_uol-opalserver2.datashield.org.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/host_uol-opalserver2.datashield.org.cfg",
        }

        file { "/etc/nagios3/conf.d/service_uol-opalserver2.datashield.org.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/service_uol-opalserver2.datashield.org.cfg",
        }

        #opalserver3.datashield.org
        file { "/etc/nagios3/conf.d/host_uol-opalserver3.datashield.org.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/host_uol-opalserver3.datashield.org.cfg",
        }

        file { "/etc/nagios3/conf.d/service_uol-opalserver3.datashield.org.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/service_uol-opalserver3.datashield.org.cfg",
        }


        #opal.rcs.le.ac.uk
        file { "/etc/nagios3/conf.d/host_uol-opal.rcs.le.ac.uk.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/host_uol-opal.rcs.le.ac.uk.cfg",
        }

        file { "/etc/nagios3/conf.d/service_uol-opal.rcs.le.ac.uk.cfg":
                source  => "puppet:///modules/nagios/external_hosts/uol/conf/service_uol-opal.rcs.le.ac.uk.cfg",
        }



}
