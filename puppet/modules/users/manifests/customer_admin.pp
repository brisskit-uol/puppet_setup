#Since this is the main ssh gateway for this vApp all users need access to it.
class users::customer_admin
{
        realize( Users::Virtual::Ssh_user["jl99"] )
        realize( Users::Virtual::Ssh_user["ob30"] )     
        realize( Users::Virtual::Ssh_user["russ"] ) 
	realize( Users::Virtual::Ssh_user["si84"] )
}
