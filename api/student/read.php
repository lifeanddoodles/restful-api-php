<?php

// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

require_once '../../config/DB.php';
require_once '../../models/Student.php';

// instantiate database and connect
$database = new Database();
$db = $database->connect();

// instantiate student object
$student = new Student($db);

// student query
$result = $student->read_students();

// get row count
$num = $result->rowCount();
// if(!empty($num)){echo $num;}
// check if there's any students

if( $num > 0 ) {
// student array
$students_arr = array();

while( $row = $result->fetch(PDO::FETCH_ASSOC) ) {
  extract($row);

  $student_item = array(
  'student_id' => $row['student_id'],
  'student_fname' => $row['student_fname'],
  'student_lname' => $row['student_lname'],
  'student_active' => $row['student_active']
  );

  // push to "data"
  array_push( $students_arr, $student_item );

}

// turn to JSON and output
echo json_encode( $students_arr );

} else {
  // no students
  echo json_encode( array( 'message' => 'No students found' ) );
}

?>
