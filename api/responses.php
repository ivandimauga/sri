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
        $alluser = mysqli_query($db_conn, "SELECT * FROM responses");
        if(mysqli_num_rows($alluser) > 0)
        {
            while($row = mysqli_fetch_array($alluser))
            {
                $json_array["userdata"][] = array(
                    "submitName" => $row['submitName'],
                    "designation" => $row['designation'],
                    "contactNumber" => $row['contactNumber'],
                    "email" => $row['email'],
                    "_year" => $row['_year'],
                    "category" => $row['category'],
                    "department" => $row['department'],
                    "agency" => $row['agency'],
                    "university" => $row['university'],
                    "nameGOCC" => $row['nameGOCC'],
                    "nameLWD" => $row['nameLWD'],
                    "provinceLGU" => $row['provinceLGU'],
                    "cityMunicipalLGU" => $row['cityMunicipalLGU'],
                    "nameSUC" => $row['nameSUC'],
                    "nameOthers" => $row['nameOthers'],
                    "agencyHead" => $row['agencyHead'],
                    "_grant" => $row['_grant'],
                    "qualifiedCivilian" => $row['qualifiedCivilian'],
                    "qualifiedMUP" => $row['qualifiedMUP'],
                    "qualifiedContractual" => $row['qualifiedContractual'],
                    "qualifiedCasual" => $row['qualifiedCasual'],
                    "SRIRate" => $row['SRIRate'],
                    "ratePaid" => $row['ratePaid'],
                    "PSFund" => $row['PSFund'],
                    "totalMOOE" => $row['totalMOOE'],
                    "travellingExpenses" => $row['travellingExpenses'],
                    "trainingScholarship" => $row['trainingScholarship'],
                    "suppliesMaterialsExpenses" => $row['suppliesMaterialsExpenses'],
                    "utilityExpenses" => $row['utilityExpenses'],
                    "communicationExpenses" => $row['communicationExpenses'],
                    "CIEExpenses" => $row['CIEExpenses'],
                    "PSExpenses" => $row['PSExpenses'],
                    "GSExpenses" => $row['GSExpenses'],
                    "repairsMaintenanceExpenses" => $row['repairsMaintenanceExpenses'],
                    "FASubsidy" => $row['FASubsidy'],
                    "TIPFees" => $row['TIPFees'],
                    "laborWages" => $row['laborWages'],
                    "advertisingExpenses" => $row['advertisingExpenses'],
                    "printingPublicationExpenses" => $row['printingPublicationExpenses'],
                    "representationExpenses" => $row['representationExpenses'],
                    "transpoDeliveryExpenses" => $row['transpoDeliveryExpenses'],
                    "rentLeaseExpenses" => $row['rentLeaseExpenses'],
                    "MDCOExpenses" => $row['MDCOExpenses'],
                    "subscriptionExpenses" => $row['subscriptionExpenses'],
                    "otherExpenses" => $row['otherExpenses'],
                    "grandTotal" => $row['grandTotal'],
                    "nonGrantReason" => $row['nonGrantReason'],
                    "filename" => $row['filename'],
                    "filesize" => $row['filesize'],
                    "filetype" => $row['filetype']
                );
            }
            echo json_encode($json_array["userdata"]);
            return;
        } else {
            echo json_encode(["result" => "Please check the data"]);
            return;
        }
    break;
    
    case "POST":
        $userpostdata = json_decode(file_get_contents("php://input"));

        $submitName = $_POST['submitName'];
        $designation = $_POST['designation'];
        $contactNumber = $_POST['contactNumber'];
        $email = $_POST['email'];
        $_year = $_POST['_year'];
        $category = $_POST['category'];
        $department = $_POST['department'];
        $agency = $_POST['agency'];
        $university = $_POST['university'];
        $nameGOCC = $_POST['nameGOCC'];
        $nameLWD = $_POST['nameLWD'];
        $provinceLGU = $_POST['provinceLGU'];
        $cityMunicipalLGU = $_POST['cityMunicipalLGU'];
        $nameSUC = $_POST['nameSUC'];
        $nameOthers = $_POST['nameOthers'];
        $agencyHead = $_POST['agencyHead'];
        $_grant = $_POST['_grant'];
        $qualifiedCivilian = $_POST['qualifiedCivilian'];
        $qualifiedMUP = $_POST['qualifiedMUP'];
        $qualifiedContractual = $_POST['qualifiedContractual'];
        $qualifiedCasual = $_POST['qualifiedCasual'];
        $SRIRate = $_POST['SRIRate'];
        $ratePaid = $_POST['ratePaid'];
        $PSFund = $_POST['PSFund'];
        $totalMOOE = $_POST['totalMOOE'];
        $travellingExpenses = $_POST['travellingExpenses'];
        $trainingScholarship = $_POST['trainingScholarship'];
        $suppliesMaterialsExpenses = $_POST['suppliesMaterialsExpenses'];
        $utilityExpenses = $_POST['utilityExpenses'];
        $communicationExpenses = $_POST['communicationExpenses'];
        $CIEExpenses = $_POST['CIEExpenses'];
        $PSExpenses = $_POST['PSExpenses'];
        $GSExpenses = $_POST['GSExpenses'];
        $repairsMaintenanceExpenses = $_POST['repairsMaintenanceExpenses'];
        $FASubsidy = $_POST['FASubsidy'];
        $TIPFees = $_POST['TIPFees'];
        $laborWages = $_POST['laborWages'];
        $advertisingExpenses = $_POST['advertisingExpenses'];
        $printingPublicationExpenses = $_POST['printingPublicationExpenses'];
        $representationExpenses = $_POST['representationExpenses'];
        $transpoDeliveryExpenses = $_POST['transpoDeliveryExpenses'];
        $rentLeaseExpenses = $_POST['rentLeaseExpenses'];
        $MDCOExpenses = $_POST['MDCOExpenses'];
        $subscriptionExpenses = $_POST['subscriptionExpenses'];
        $GSExpenses = $_POST['GSExpenses'];
        $otherExpenses = $_POST['otherExpenses'];
        $grandTotal = $_POST['grandTotal'];
        $nonGrantReason = $_POST['nonGrantReason'];
        $filename = $_POST['filename'];
        $filesize = $_POST['filesize'];
        $filesize = $_POST['filesize'];

        if(isset($_FILES["file"]) && $_FILES["file"]["error"] == 0) {
            $target_dir = "uploads/";

            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true); 
            }

            $file_type = strtolower(pathinfo($_FILES["file"]["name"], PATHINFO_EXTENSION));
            $allowed_types = array("jpg", "jpeg", "png", "pdf");

            if (!in_array($file_type, $allowed_types)) {
                echo "Sorry, only JPG, JPEG, PNG, and PDF files are allowed.";
            } else {
                $target_file = $target_dir . basename($_FILES["file"]["name"]);

                if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
                    $filename = $_FILES["file"]["name"];
                    $filesize = number_format($_FILES["file"]["size"] / 1024, 2);
                    $filetype = $_FILES["file"]["type"];
                } else {
                    echo "Error occurred while uploading the file.";
                }
            }
            } else {
                echo "Error: " . $_FILES["file"]["error"];
        }

        $result = mysqli_query($db_conn, "INSERT INTO responses (submitName, designation, contactNumber, email, _year, category, department, agency, university, nameGOCC, nameLWD, provinceLGU, cityMunicipalLGU, nameSUC, nameOthers, agencyHead, _grant, qualifiedCivilian, qualifiedMUP, qualifiedContractual, qualifiedCasual, SRIRate, ratePaid, PSFund, totalMOOE, travellingExpenses, trainingScholarship, suppliesMaterialsExpenses, utilityExpenses, communicationExpenses, CIEExpenses, PSExpenses, GSExpenses, repairsMaintenanceExpenses, FASubsidy, TIPFees, laborWages, advertisingExpenses, printingPublicationExpenses, representationExpenses, transpoDeliveryExpenses, rentLeaseExpenses, MDCOExpenses, subscriptionExpenses, otherExpenses, grandTotal, nonGrantReason, filename, filesize, filetype) 
        VALUES('$submitName', '$designation', '$contactNumber', '$email', '$_year', '$category', '$department', '$agency', '$university', '$nameGOCC', '$nameLWD', '$provinceLGU', '$cityMunicipalLGU', '$nameSUC', '$nameOthers', '$agencyHead', '$_grant', '$qualifiedCivilian', '$qualifiedMUP', '$qualifiedContractual', '$qualifiedCasual', '$SRIRate', '$ratePaid', '$PSFund', '$totalMOOE', '$travellingExpenses', '$trainingScholarship', '$suppliesMaterialsExpenses', '$utilityExpenses', '$communicationExpenses', '$CIEExpenses', '$PSExpenses', '$GSExpenses', '$repairsMaintenanceExpenses', '$FASubsidy', '$TIPFees', '$laborWages', '$advertisingExpenses', '$printingPublicationExpenses', '$representationExpenses', '$transpoDeliveryExpenses', '$rentLeaseExpenses', '$MDCOExpenses', '$subscriptionExpenses', '$otherExpenses', '$grandTotal', '$nonGrantReason', '$filename', '$filesize', '$filetype')");

        if ($result) {
            echo json_encode(["success" => "User added successfully"]);
            return;
        } else {
            echo json_encode(["success" => "Please check the user data!"]);
            return;
        }
    break;

}


// Connect to your MySQL database using PDO or mysqli

// Fetch data from your database
$query = "SELECT * FROM sridatabase";
$result = $pdo->query($query);

// Convert data to JSON format
$data = $result->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($data);

?>
