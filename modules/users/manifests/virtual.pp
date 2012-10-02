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
	@ssh_user { "temp":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}


	@ssh_user { "adrian": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "christiana": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "daphne": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "fangmin": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "gerrit": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "jens": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "jonathan": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "malcolmn": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "malcolmt": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "martin": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "neil": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "nick": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "paul": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "rob": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "simon": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "srikant": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "tito": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "veerle": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}

}
