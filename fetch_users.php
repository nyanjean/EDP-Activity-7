<?php
include 'db.php';

$sql = "SELECT 
            user_id, 
            username, 
            email, 
            password_hash, 
            first_name, 
            last_name, 
            role, 
            status, 
            recovery_code, 
            created_at, 
            updated_at 
        FROM users";

$result = mysqli_query($conn, $sql);

$users = [];

if ($result) {
    while($row = mysqli_fetch_assoc($result)){
        $users[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($users);
?>