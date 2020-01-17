<?php

require_once '../../config/DB.php';
require_once '../../models/Api_User.php';

// instantiate database and connect
$database = new Database();
$db = $database->connect();

// instantiate api_user object
$api_user = new Api_User($db);

// api_user query
$result = $api_user->logout();

?>
