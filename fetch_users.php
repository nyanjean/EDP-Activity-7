<?php
header('Content-Type: application/json');
require_once 'db_connect.php'; 

try {
    $stmt = $pdo->query("SELECT 
                            user_id, 
                            username, 
                            email, 
                            first_name, 
                            last_name, 
                            role, 
                            status, 
                            recovery_code, 
                            created_at, 
                            updated_at 
                        FROM users");
    
    $users = $stmt->fetchAll();

    echo json_encode($users);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Failed to retrieve user data.']);
}
?>