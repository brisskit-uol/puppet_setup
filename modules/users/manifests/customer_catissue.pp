#catissue VMs
class users::customer_catissue
{
        realize( Users::Virtual::Ssh_user["jl99"] )
        realize( Users::Virtual::Ssh_user["si84"] )
}
