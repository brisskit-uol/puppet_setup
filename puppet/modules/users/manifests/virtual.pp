#Define all the potential users available throughout the whole stack.
#This file should be included on all VMs, then users be realized as needed.
class users::virtual
{
	#Generic difinition of new users
	define ssh_user($password, $ensure="present")
	{
		user { $name:
			ensure     => "$ensure",
                	shell      => "/bin/bash",
                	home       => "/home/$name",
                	managehome => true,
			groups     => ['admin'],
			password   => "$password",
		}
	}

	#List of all the virtual users - these need to be realized elsewhere


	#BRISSKit team
    	@ssh_user { "jl99":        password => '$6$sUDIQM9G$CmOlasR//teeG3vrJVKdlhYk425GtiZYG2oSATdOk6LRn2DBevYf3nM8a8VK68oCignwWz9rXMvae.pU2Kwds0'}
       	@ssh_user { "ob30":        password => '$6$pufwrR.L$0R9625P.e.Plqs4Dj8qMQ7BTf2Hzw5E.uYZQYXkZK.q.2K9oN.f1EddPOA2wMYD6fBhHW1v5GFsXwYhYvSD9B0'}
	@ssh_user { "rp310":       password => '$6$Sh67MGFD$.DRno69E81ihD63JrWCJU9KIZricuXm2kTxSUJKZAlWkunZ3/4Mj0QCbI9obp/d4F.YUOfGjhDFWy7ZkHymO/0'}
 	@ssh_user { "russ":        password => '$6$Sh67MGFD$.DRno69E81ihD63JrWCJU9KIZricuXm2kTxSUJKZAlWkunZ3/4Mj0QCbI9obp/d4F.YUOfGjhDFWy7ZkHymO/0'}
	@ssh_user { "si84":        password => '$6$33o7S6Zz$heDp.TsPOLgevc2/1Pq9.mLDUegbgmvYXJasLhqnlfsi368SjXh4xVMMVCJwOjOTyA8Prtxqh/d9mYUZWLhmw/'}




	#Hack event users - TEMPORARY. The PW is the same in each case... (2/10/12)
	@ssh_user { "temp":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "adamr":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "adamw":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "adrianm":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "andyc":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "andrewl":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "anthonyt":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "christianam": password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "christianb":  password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "daphnec":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "davem":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "fangmins":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "gavinw":      password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "gerritw":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "jang":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "jenss":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "jonathant":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "jonathanr":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "karinem":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "kirstyp":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "mahendram":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "malcolmn":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "malcolmt":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "martinh":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "neilb":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "nickh":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "paulm":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "richarda":    password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "robf":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "russp":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "simonh":      password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "srikantha":   password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/'}
	@ssh_user { "timb":        password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "titoc":       password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}
	@ssh_user { "veerlee":     password => '$6$KhCog/O2$sYBsrvVSTa33E1Tt.KW8LihCf/8zcenTs7L5GAfmhLePJ6XeG5lGpyUFsibdRUu.4ViRP0D1WgL.Oipnq4FqY/', ensure => "absent"}

}
