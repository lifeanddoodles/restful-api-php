<?php

// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

include_once '../../config/DB.php';
include_once '../../models/Student.php';

// connect to database
$database = new Database();
$db = $database->connect();

// instantiate student object
$student = new Student($db);


// student query
$result = $student->read_students();

// get row count
$num = $result->rowCount();
if(!empty($num)){echo $num;}
// check if there's any students
if($num > 0) {
// student array
$students_arr = array();

while($row = $result->fetch(PD0::FETCH_ASSOC)) {
  extract($row);

$student_item = array(
'student_id' => $id,
'student_fname' => $fname,
'student_lname' => $lname,
'student_active' => $is_active
);

// push to "data"
array_push($students_arr, $student_item);

}

// turn to JSON and output
echo json_encode($students_arr);

} else {
// no students
echo json_encode(array('message' => 'No students found'));
}

?>
