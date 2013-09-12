#It is useful to be able to monitor some hosts/services outside our our infrastructure.
#This will copy HAND MADE (i.e not made by puppet) host and service files into nagios.
class nagios::external_hosts {

	file { "/etc/nagios3/conf.d/host_uol-opalserver1.datashield.org.cfg":
		ensure	=> file,
		owner	=> 'root',
		group	=> 'nagios',
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/external_hosts/host_uol-opalserver1.datashield.org.cfg",
	}


       file { "/etc/nagios3/conf.d/sevice_uol-opalserver1.datashield.org.cfg":
                ensure  => file,
                owner   => 'root',
                group   => 'nagios',
                mode    => 0755,
                source  => "puppet:///modules/nagios/external_hosts/service_uol-opalserver1.datashield.org.cfg",
        }

       file { "/etc/nagios3/conf.d/host_uol-opalserver2.datashield.org.cfg":
                ensure  => file,
                owner   => 'root',
                group   => 'nagios',
                mode    => 0755,
                source  => "puppet:///modules/nagios/external_hosts/host_uol-opalserver2.datashield.org.cfg",
        }

       file { "/etc/nagios3/conf.d/service_uol-opalserver2.datashield.org.cfg":
                ensure  => file,
                owner   => 'root',
                group   => 'nagios',
                mode    => 0755,
                source  => "puppet:///modules/nagios/external_hosts/service_uol-opalserver2.datashield.org.cfg",
        }



}
