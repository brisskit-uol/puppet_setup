<?php
$url_parts = explode('.', $_SERVER["SERVER_NAME"]);
$bru_name = $url_parts[0];
?>
<html>
<head>
<title><?php echo $bru_name?> admin page</title>
</head>
<body>
<h1><?php echo $bru_name?> admin page</h1>
<body>
<p>This is where the <?php echo $bru_name?> sysadmin would do adminy things.</p>

</body>
</html>

