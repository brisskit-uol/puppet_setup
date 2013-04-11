#common global admin stuff
class roles::ga::common {

	require ::roles::global::common

	#Long list of potential users. These need to be realised elsewhere.
	include users::virtual

	# Manage hosts file
	#include hosts::ga

	#class {hosts::ga: stage => second}
	require ::hosts::ga


}
