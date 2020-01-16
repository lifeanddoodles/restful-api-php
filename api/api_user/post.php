<?php
session_start();

include_once '../../config/DB.php';

$username = $_POST['username'];
$password = $_POST['password'];

if( $username === '' || $password === '' ) {
echo json_encode('Error: All fields are required');
} else {
    // echo json_encode('User added successfully');
    // verify if user exists
    $query = 'SELECT * FROM api_users WHERE api_user_username = ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute(array($username));
    $result = $stmt->fetch();

    if(!$result){
        // user not found
        echo 'User does not exist';
        die();
    }
    if( password_verify( $password , $result['api_user_password']) ) {
        // passwords match
        $_SESSION['admin'] = $username;
        header('Location: userlist.html');

    } else {
        echo 'Incorrect password';
        die();
    }
}

?>
