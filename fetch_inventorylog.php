<?php
include 'db.php';

$sql = "SELECT 
            InventoryLogID AS log_id, 
            TransactionType AS transaction_type, 
            TransactionQuantity AS quantity, 
            TransactionDate AS transaction_date, 
            MenuID AS menu_id, 
            InventoryID AS inv_id 
        FROM inventorylog
        ORDER BY TransactionDate DESC, InventoryLogID DESC";

$result = mysqli_query($conn, $sql);

$logs = [];

if ($result) {
    while($row = mysqli_fetch_assoc($result)){
        $logs[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($logs);
?>