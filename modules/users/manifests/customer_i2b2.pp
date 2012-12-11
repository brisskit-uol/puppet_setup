#i2b2 VMs
class users::customer_i2b2
{
        realize( Users::Virtual::Ssh_user["jl99"] )
        realize( Users::Virtual::Ssh_user["si84"] )
}
