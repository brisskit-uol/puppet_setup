#civicrm VMs
class users::customer_civicrm
{
        realize( Users::Virtual::Ssh_user["ob30"] )
	realize( Users::Virtual::Ssh_user["si84"] )
}
