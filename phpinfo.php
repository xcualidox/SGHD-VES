<?php
echo gethostname()."<br>";
echo gethostbyname(gethostname())."<br>";
echo $_SERVER['HTTP_HOST']."<br>";
echo $_SERVER['SERVER_SIGNATURE']."<br>";
echo $_SERVER['SERVER_NAME']."<br>";
echo $_SERVER['SERVER_ADDR']."<br>";
echo $_SERVER['SERVER_PORT']."<br>";
echo $_SERVER['REMOTE_ADDR']."<br>";
echo gethostbyaddr($_SERVER['REMOTE_ADDR'])."<br>";
echo php_uname()."<br>";
echo empty([1]);
?>