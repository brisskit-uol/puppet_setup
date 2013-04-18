#mysql VMs
class users::customer_mysql
{
        realize( Users::Virtual::Ssh_user["si84"] )
}
