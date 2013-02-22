<?php
// NRDP Config File
// Copyright (c) 2010 Nagios Enterprises, LLC.
// License: Nagios Open Software License <http://www.nagios.com/legal/licenses>
//  
// $Id: config.inc.php 12 2010-06-19 04:19:35Z egalstad $


// an array of one or more tokens that are valid for this NRDP install
// a client request must contain a valid token in order for the NRDP to response or honor the request
// NOTE: tokens are just alphanumeric strings - make them hard to guess!
$cfg['authorized_tokens'] = array(
	//"mysecrettoken",  // <-- not a good token
	//"90dfs7jwn3",   // <-- a better token (don't use this exact one, make your own)
	"token1234",
	"hg9npuu3i8gfpuo9i1gy9o357ehg7jyu",
	"5n60tyfjj690da00804b6zja0f6gdtkl",
	"y495xuj7pk351w5pkaz5a6idj6lowc3c",
	"gpikt91gm08swuf7e4m8ospuqnfma4iq",
	"mzj49q5q20p4pmvo0xq5qymgvutxjoge",
	"ec5fxn9x5ehdwy0o92iq9eg23cj9a42b",
	"s2hd2ky8hxs19n1243yh7t1sngt0btzi",
	"b9zwe6ecstcrcdfem1703l0szrtntmij",
	"tzd9gkufjxnku7e6yez9xzbs31ltd6ln",
	"1jn7nhfwdsmgyx5iljqr7bccue3q6nen",
	"uxgc2vt6iz25bw2gpgarmol9me53ny6w",
	"yhjrmfnxbspb7rdir72fysfh9jhj6xh8",
	"c33h3y0h70771kq622nrhqdofl2fxoxe",
	"t4vaakuiuxb1g82am9aci26uwsv2ga80",
	);
	
// do we require that HTTPS be used to access NRDP?
// set this value to 'false' to disable HTTPS requirement
$cfg["require_https"]=false;

// do we require that basic authentication be used to access NRDP?
// set this value to 'false' to disable basic auth requirement 
$cfg["require_basic_auth"]=false;

// what basic authentication users are allowed to access NRDP?
// comment this variable out to allow all authenticated users access to the NRDP
$cfg["valid_basic_auth_users"]=array(
	"nrdpuser"
	);
	
// the name of the system group that has write permissions to the external command file
// this group is also used to set file permissions when writing bulk commands or passive check results
// NOTE: both the Apache and Nagios users must be a member of this group
$cfg["nagios_command_group"]="nagios";

// full path to Nagios external command file
$cfg["command_file"]="/var/lib/nagios3/rw/nagios.cmd";

// full path to check results spool directory
$cfg["check_results_dir"]="/var/lib/nagios3/spool/checkresults";

// full path to directory where temp scratch files can be written
// NOTE: the Apache user need to be able create files here, and the Nagios user needs to read/delete those same files, so the /tmp system directory won't work (it has a sticky bit on it)
$cfg["tmp_dir"]="/var/lib/nagios3/tmp";

	
///////// DONT MODIFY ANYTHING BELOW THIS LINE /////////

$cfg['product_name']='nrdp';
$cfg['product_version']='1.0'


?>
