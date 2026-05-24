CREATE TABLE `orders` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `unique_id` VARCHAR(20) DEFAULT NULL,
  `menu_id` VARCHAR(50) NOT NULL,
  `category` VARCHAR(50) NOT NULL,
  `qty` INT NOT NULL,
  `customer` VARCHAR(100) DEFAULT 'Walk-In',
  `date` DATE NOT NULL,
  `notes` TEXT,
  `status` ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending'
);

CREATE TABLE `restocks` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `unique_id` VARCHAR(20) DEFAULT NULL,
  `ing_id` VARCHAR(50) NOT NULL,
  `qty` DECIMAL(10,2) NOT NULL,
  `unit` VARCHAR(20) DEFAULT 'pcs',
  `supplier` VARCHAR(100) NOT NULL,
  `received_by` VARCHAR(100) DEFAULT 'Admin',
  `date` DATE NOT NULL
);