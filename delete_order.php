<?php
include 'db.php';
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    if (isset($_GET['id'])) {
        $orderId = mysqli_real_escape_string($conn, $_GET['id']);
        
        // Remove the log entry matching the specific tracking reference code
        $sql = "DELETE FROM inventorylog WHERE InventoryLogID = '$orderId' AND TransactionType = 'Sale'";
        
        if (mysqli_query($conn, $sql)) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "error" => mysqli_error($conn)]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "No Order ID specified."]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Invalid Request Method."]);
}
?>