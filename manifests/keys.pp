include ssh::auth

#####################################################################
#Define all the BACKUP users whos keys I want to pass around
#These are stored on the puppet master in /var/lib/keys
#These do not have to exist as users at this stage

ssh::auth::key { "master_backup": }   #The main user on ga-backup that runs the show
ssh::auth::key { "vapp_backup":}      #The user on customer camp that drive the vApp
ssh::auth::key { "vm_backup": }       #The user on the child VMs in the customer vApps
ssh::auth::key { "ga_backup":}        #The user on the ga VMs
ssh::auth::key { "ga_puppet_backup":} #The user on the ga_puppet VM
ssh::auth::key { "pubweb_backup":}    #The user on the public websites VM
#####################################################################

#####################################################################
#Define all the INTEGRATION users whos keys I want to pass around
ssh::auth::key { "integration": }
#####################################################################

