#Global sysadmins. These guys get put on ALL VMs.
class users::global
{
        realize( Users::Virtual::Ssh_user["ob30"] )
        realize( Users::Virtual::Ssh_user["rp310"] )
}
