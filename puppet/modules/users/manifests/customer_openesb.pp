#openesb VMs
class users::customer_openesb
{
        realize( Users::Virtual::Ssh_user["si84"] )
	realize( Users::Virtual::Ssh_user["jl99"] )
}
