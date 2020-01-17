<?php

// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

require_once '../../config/DB.php';
require_once '../../models/Api_User.php';

// instantiate database and connect
$database = new Database();
$db = $database->connect();

// instantiate api_user object
$api_user = new Api_User($db);

// api_user query
$result = $api_user->read_api_users();

// get row count
$num = $result->rowCount();
// if(!empty($num)){echo $num;}
// check if there's any api_users

if( $num > 0 ) {
// api_user array
$api_users_arr = array();

while( $row = $result->fetch(PDO::FETCH_ASSOC) ) {
  extract($row);

  $api_user_item = array(
  'api_user_id' => $row['api_user_id'],
  'api_user_fname' => $row['api_user_fname'],
  'api_user_lname' => $row['api_user_lname']
  );

  // push to "data"
  array_push( $api_users_arr, $api_user_item );

}

// turn to JSON and output
echo json_encode( $api_users_arr );

} else {
  // no api_users
  echo json_encode( array( 'message' => 'No api_users found' ) );
}

?>
