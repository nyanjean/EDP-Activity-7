<?php
header('Content-Type: application/json');
require_once 'db_connect.php';

try {
    $sql = "SELECT 
                InventoryLogID AS log_id, 
                TransactionType AS transaction_type, 
                TransactionQuantity AS quantity, 
                TransactionDate AS transaction_date, 
                MenuID AS menu_id, 
                InventoryID AS inv_id 
            FROM inventorylog
            ORDER BY TransactionDate DESC, InventoryLogID DESC";

    $stmt = $pdo->query($sql);
    $logs = $stmt->fetchAll();

    echo json_encode($logs);

} catch (PDOException $e) {
    error_log("Inventory Log Fetch Error: " . $e->getMessage());
    
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Failed to retrieve inventory logs.']);
}
?>