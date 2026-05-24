<?php
header('Content-Type: application/json');
require_once 'db_connect.php'; 

try {
    $sql = "SELECT 
                il.InventoryLogID AS order_id,
                m.MenuName AS item_name,
                il.TransactionQuantity AS quantity,
                il.TransactionDate AS order_date,
                il.InventoryID AS inv_id
            FROM inventorylog il
            LEFT JOIN menu m ON il.MenuID = m.MenuID
            WHERE il.TransactionType = 'Sale'
            ORDER BY il.TransactionDate DESC, il.InventoryLogID DESC";

    $stmt = $pdo->query($sql);
    $orders = $stmt->fetchAll();

    echo json_encode($orders);

} catch (PDOException $e) {
    error_log("Order Fetch Error: " . $e->getMessage());
    
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Failed to retrieve order records.']);
}
?>