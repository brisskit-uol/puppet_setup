<?php
$url_parts = explode('.', $_SERVER["SERVER_NAME"]);
$bru_name = $url_parts[0];
?>
<html>
<title><?php echo $bru_name?> landing page</title>
<body>
<h1>It works!</h1>
<p>This is the default landing page of the <?php echo $bru_name?> institute.</p>
<p>You might want the
<ul>
<li><a href="admin">Admin page</a></li>
<li><a href="i2b2/main">i2b2 pages</a></li>
<li><a href="catissuecore">caTissue pages</a></li>
<li><a href="civicrm">CiviCRM pages</a></li>
<li><a href="onyx">Onyx pages</a></li>
</ul>
</p>
</body>
</html>

