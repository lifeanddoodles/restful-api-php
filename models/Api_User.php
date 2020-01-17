<?php
class Api_User {
  // Database info
  private $conn;
  private $table = 'api_users';

  // Properties
  public $id;
  public $username;
  public $password;
  public $fname;
  public $lname;

  // constructor with database
  public function __construct( $db ) {
    $this->conn = $db;
  }

  // Get api_users
  public function read_api_users() {
    // create query
    $query = 'SELECT *
    FROM ' . $this->table . '
    ORDER BY api_user_id ASC';

    // prepare statement
    $stmt = $this->conn->prepare( $query );

    // execute query
    $stmt->execute();

    return $stmt;

  }

  // Login api_user
  public function login() {
    if(!isset($_SESSION))
    {
        session_start();
    }

    // $username = $_POST['username'];
    // $password = $_POST['password'];
    $username = 'username1';
    $password = '123456';
    $hashed_password = password_hash($password,PASSWORD_DEFAULT);

    if( $username === '' || $password === '' ) {
      echo json_encode( 'Error: All fields are required' );
    } else {

        // verify if user exists
        $query = 'SELECT * FROM api_users WHERE api_user_username = ?';
        $stmt = $this->conn->prepare( $query );

        // execute query
        $stmt->execute( array( $username ) );

        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if( !$result ) {
            // user not found
            echo 'User does not exist';
            die();
        }
        // $result['api_user_pass']
        if( password_verify( $password , $hashed_password) ) {
            // passwords match
            echo 'logged in';
            $_SESSION['admin'] = $username;
            header( 'Location: http://localhost/knowledgecity/userlist.html' );

        } else {
            echo 'Incorrect password';
            die();
        }
    }
  }

  public function logout() {
    if(!isset($_SESSION))
    {
        session_start();
    }

    // Destroy session's variables
    $_SESSION = array();

    // Destroy session cookie
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

    // Destroy session
    session_destroy();

    // Headers
    header('Location:login.html');

  }
}
?>
