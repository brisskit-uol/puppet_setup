#onyx VMs
class users::customer_onyx
{
        realize( Users::Virtual::Ssh_user["jl99"] )
	realize( Users::Virtual::Ssh_user["si84"] )
}
