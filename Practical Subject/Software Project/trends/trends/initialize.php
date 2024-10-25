<?php
$dev_data = array('id'=>'-1','firstname'=>'Developer','lastname'=>'','username'=>'Tatva','password'=>'d8f27fec93ba8a3e5c75ae3a67be89a3','last_login'=>'','date_updated'=>'','date_added'=>'');
if(!defined('base_url')) define('base_url','http://localhost/trends/');
if(!defined('base_app')) define('base_app', str_replace('\\','/',__DIR__).'/' );
if(!defined('dev_data')) define('dev_data',$dev_data);
if(!defined('DB_SERVER')) define('DB_SERVER',"localhost");
if(!defined('DB_USERNAME')) define('DB_USERNAME',"root");
if(!defined('DB_PASSWORD')) define('DB_PASSWORD',"");
if(!defined('DB_NAME')) define('DB_NAME',"trends_db");
?>