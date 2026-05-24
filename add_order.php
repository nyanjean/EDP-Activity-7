<?php
include 'db.php';
header('Content-Type: application/json');

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get raw data sent from JavaScript fetch()
    $input = json_decode(file_get_contents('php://input'), true);

    $menuId   = mysqli_real_escape_string($conn, $input['menuId']);
    $qty      = intval($input['qty']);
    $customer = mysqli_real_escape_string($conn, $input['customer']);
    $date     = mysqli_real_escape_string($conn, $input['date']);
    $notes    = mysqli_real_escape_string($conn, $input['notes']);

    // Check for required inputs
    if (empty($menuId) || empty($customer) || $qty < 1) {
        echo json_encode(["success" => false, "error" => "Missing or invalid required fields."]);
        exit;
    }

    // Generate a unique InventoryLogID starting with 'IL'
    $logId = "IL" . time() . rand(10, 99);

    // SQL query inserting into your altered columns
    $sql = "INSERT INTO inventorylog (InventoryLogID, TransactionType, TransactionQuantity, TransactionDate, MenuID, InventoryID, CustomerName, TransactionNotes) 
            VALUES ('$logId', 'Sale', $qty, '$date', '$menuId', NULL, '$customer', '$notes')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode(["success" => true, "id" => $logId]);
    } else {
        echo json_encode(["success" => false, "error" => mysqli_error($conn)]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Invalid Request Method."]);
}
?>