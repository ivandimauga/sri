<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header("Access-Control-Allow-Origin: * ");
header("Access-Control-Allow-Headers: * ");
header("Access-Control-Allow-Methods: * ");

$db_conn = mysqli_connect("localhost", "root", "", "sridatabase");
if($db_conn === false)
{
    die("ERROR: Could Not Connect".mysqli_connect_error());
}

$method = $_SERVER['REQUEST_METHOD'];

switch($method)
{
    case "GET":
        if(isset($_GET['department_id'])) {
            $department_id = $_GET['department_id'];
            $agency_query = "SELECT * FROM agencies WHERE department_id = $department_id";
            $result = mysqli_query($db_conn, $agency_query);
            if($result === false) {
                die("ERROR: Query failed: " . mysqli_error($db_conn));
            }

            $agencies = array();
            while($row = mysqli_fetch_assoc($result)) {
                $agency = array(
                    'id' => $row['agency_id'],
                    'name' => $row['agency_name'],
                    'department_id' => $row['department_id']
                );
                $agencies[] = $agency;
            }
            echo json_encode($agencies);
        } else {
            $alluser = mysqli_query($db_conn, "SELECT * FROM departments");
            if(mysqli_num_rows($alluser) > 0)
            {
                $departments = array();
                while($row = mysqli_fetch_assoc($alluser))
                {
                    $department = array(
                        'id' => $row['department_id'],
                        'name' => $row['department_name']
                    );
                    $departments[] = $department;
                }
                echo json_encode($departments);
            }
        }
        break;
}
?>