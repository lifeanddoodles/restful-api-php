<?php
class Student {
  // Database info
  private $conn;
  private $table = 'students';

  // Properties
  public $id;
  public $email;
  public $pass;
  public $fname;
  public $lname;
  public $isactive;

  // constructor with database
  public function __construct( $db ) {
    $this->conn = $db;
  }

  // Get students
  public function read_students() {
    // create query
    $query = 'SELECT *
    FROM ' . $this->table . '
    ORDER BY student_id ASC';

    // prepare statement
    $stmt = $this->conn->prepare( $query );

    // execute query
    $stmt->execute();

    return $stmt;

  }
}
?>
