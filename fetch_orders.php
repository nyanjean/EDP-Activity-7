<?php
include 'db.php';

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

$result = mysqli_query($conn, $sql);

$orders = [];

if ($result) {
    while($row = mysqli_fetch_assoc($result)){
        $orders[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($orders);
?>