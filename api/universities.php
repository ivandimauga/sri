<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

$db_conn = mysqli_connect("localhost", "root", "", "sridatabase");
if ($db_conn === false) {
    die("ERROR: Could Not Connect" . mysqli_connect_error());
}

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case "GET":
        $alluniversities = mysqli_query($db_conn, "SELECT * FROM universities");
        if (mysqli_num_rows($alluniversities) > 0) {
            $universities = array();
            while ($row = mysqli_fetch_assoc($alluniversities)) {
                $university = array(
                    'id' => $row['university_id'],
                    'name' => $row['university_name']
                );
                $universities[] = $university;
            }
            echo json_encode($universities);
        } else {
            echo json_encode(array());
        }
        break;
}
?>