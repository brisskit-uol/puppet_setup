class hosts::global {

	require hosts

	Host <<| tag == "${vapp_name}" |>> 

}
