<?php
header('Content-Type: application/json');
require_once 'db_connect.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$input = json_decode(file_get_contents('php://input'), true);

if (!$input) {
    echo json_encode(['success' => false, 'error' => 'Invalid input']);
    exit;
}

$ingId    = $input['ingId'] ?? '';
$qty      = floatval($input['qty'] ?? 0);
$unit     = $input['unit'] ?? 'pcs';
$supplier = trim($input['supplier'] ?? '');
$date     = trim($input['date'] ?? '');

if (empty($ingId) || empty($supplier) || $qty <= 0) {
    echo json_encode(['success' => false, 'error' => 'Invalid parameters']);
    exit;
}

if (empty($date)) {
    $date = date('Y-m-d');
}

$receivedBy = 'Admin';
if (isset($_SESSION['user_fname']) && isset($_SESSION['user_lname'])) {
    $receivedBy = $_SESSION['user_fname'] . ' ' . $_SESSION['user_lname'];
}

try {
    $pdo->beginTransaction();

    $stmt = $pdo->prepare("INSERT INTO restocks (ing_id, qty, unit, supplier, received_by, date) 
                           VALUES (:ingId, :qty, :unit, :supplier, :receivedBy, :date)");
    
    $stmt->execute([
        ':ingId'      => $ingId,
        ':qty'        => $qty,
        ':unit'       => $unit,
        ':supplier'   => $supplier,
        ':receivedBy' => $receivedBy,
        ':date'       => $date
    ]);

    $db_id = $pdo->lastInsertId();
    $generatedId = "RST" . str_pad($db_id, 5, "0", STR_PAD_LEFT);

    $updateStmt = $pdo->prepare("UPDATE restocks SET unique_id = :genId WHERE id = :dbId");
    $updateStmt->execute([':genId' => $generatedId, ':dbId' => $db_id]);

    $pdo->commit();

    echo json_encode([
        'success' => true,
        'id'      => $generatedId
    ]);

} catch (PDOException $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Database error']);
}
?>