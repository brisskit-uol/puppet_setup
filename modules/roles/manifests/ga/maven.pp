class roles::ga::maven {

	require ::roles::ga::common

	realize( Users::Virtual::Ssh_user["jl99"] )
	realize( Users::Virtual::Ssh_user["si84"] )

	include ::nexus

	#################
	# Backup	#
	#################

	# Set up file tree
	include ::backup::base

	# Set up users
	include ::backup::users::ga_backup

	# Copy master_backup pub key to ga_backup authorized keys
	ssh::auth::server { "master_backup": user => "ga_backup" }

	#################
	# Firewall	#
	#################

	#include ::fw::target::maven
	#Need the hosts file to be made first
	class {::fw::target::maven: stage => third }
}
