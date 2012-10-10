#Define all the potential users available throughout the whole stack.
#This file should be included on all VMs, then users be realized as needed.
class users::virtual
{
	#Generic difinition of new users
	define ssh_user($password)
	{
		user { $name:
			ensure     => present,
                	shell      => "/bin/bash",
                	home       => "/home/$name",
                	managehome => true,
			groups     => ['admin'],
			password   => "$password",
		}
	}

	#List of all the virtual users - these need to be realized elsewhere

	#Hack event users - TEMPORARY. The PW is the same in each case... (2/10/12)
	@ssh_user { "temp":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}


	@ssh_user { "adamr":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "adamw":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "adrianm":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "andyc":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "andrewl":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "anthonyt":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "christianam": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "christianb":  password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "daphnec":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "davem":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "fangmins":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "gavinw":      password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "gerritw":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "jang":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "jenss":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "jonathant":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "jonathanr":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "karinem":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "kirstyp":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "mahendram":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "malcolmn":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "malcolmt":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "martinh":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "neilb":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "nickh":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "paulm":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "richarda":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "robf":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "russp":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "simonh":      password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "srikantha":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "timb":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "titoc":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "veerlee":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}

}
