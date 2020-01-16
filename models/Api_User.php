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
  public function __construct($db) {
    $this->conn = $db;
  }

  // Get api_users
  public function read_api_users() {
    // create query
    $query = 'SELECT *
    FROM ' . $this->table . '
    ORDER BY api_user_id ASC';

    // prepare statement
    $stmt = $this->conn->prepare($query);

    // execute query
    $stmt->execute();

    return $stmt;

  }
}
?>
