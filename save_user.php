<?php
include 'db.php';
header('Content-Type: application/json');

$input = json_decode(file_get_contents('php://input'), true);
if (!$input || !isset($input['action'])) {
    echo json_encode(["success" => false, "error" => "Invalid entry action request context."]);
    exit;
}

$action = $input['action'];

if ($action === 'create') {
    $fname  = mysqli_real_escape_string($conn, $input['fname']);
    $lname  = mysqli_real_escape_string($conn, $input['lname']);
    $email  = mysqli_real_escape_string($conn, $input['email']);
    $role   = mysqli_real_escape_string($conn, $input['role']);
    $status = mysqli_real_escape_string($conn, $input['status']);
    $pass   = mysqli_real_escape_string($conn, $input['pass']); // Storing plain text to match your custom array auth logic

    $sql = "INSERT INTO user (first_name, last_name, email, role, status, password_hash) 
            VALUES ('$fname', '$lname', '$email', '$role', '$status', '$pass')";
            
    if (mysqli_query($conn, $sql)) {
        echo json_encode(["success" => true, "id" => mysqli_insert_id($conn)]);
    } else {
        echo json_encode(["success" => false, "error" => mysqli_error($conn)]);
    }

} elseif ($action === 'update') {
    $id    = intval($input['id']);
    $fname = mysqli_real_escape_string($conn, $input['fname']);
    $lname = mysqli_real_escape_string($conn, $input['lname']);
    $email = mysqli_real_escape_string($conn, $input['email']);
    $role  = mysqli_real_escape_string($conn, $input['role']);
    
    $passSql = "";
    if (!empty($input['pass'])) {
        $pass = mysqli_real_escape_string($conn, $input['pass']);
        $passSql = ", password_hash = '$pass'";
    }

    $sql = "UPDATE user SET first_name = '$fname', last_name = '$lname', email = '$email', role = '$role' $passSql WHERE user_id = $id";
    
    if (mysqli_query($conn, $sql)) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "error" => mysqli_error($conn)]);
    }

} elseif ($action === 'toggle') {
    $id     = intval($input['id']);
    $status = mysqli_real_escape_string($conn, $input['status']);

    $sql = "UPDATE user SET status = '$status' WHERE user_id = $id";
    
    if (mysqli_query($conn, $sql)) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "error" => mysqli_error($conn)]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Unknown entry action pipeline request."]);
}
?>