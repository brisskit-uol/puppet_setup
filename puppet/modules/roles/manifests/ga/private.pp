class roles::ga::private {

	require roles::ga

	realize( Users::Virtual::Ssh_user["jl99"] )
	realize( Users::Virtual::Ssh_user["si84"] )

}
