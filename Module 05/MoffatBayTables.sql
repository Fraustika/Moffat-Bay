CREATE TABLE `Customer` (
  `customer_id` INT,
  `first_name` VARCHAR(15) NOT NULL,
  `last_name` VARCHAR(15) NOT NULL,
  `email` VARCHAR(15) NOT NULL,
  `phone_number` INT NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`customer_id`)
);

INSERT INTO `Customer` (`customer_id`, `first_name`, `last_name`, `email`, `phone_number`, `password`) VALUES
(101, 'John', 'Doe', 'john.doe@email', 1234567890, 'password123'),
(102, 'Jane', 'Smith', 'jane.s@email', 987654321, 'securePass'),
(103, 'David', 'Lee', 'd.lee@email', 555123456, 'myPassword'),
(104, 'Emily', 'Chen', 'e.chen@email', 111222333, 'emilyPass'),
(105, 'Michael', 'Brown', 'm.brown@email', 444555666, 'mikeBrown');

CREATE TABLE `Rooms` (
  `room_id` INT,
  `room_typeID` VARCHAR(15) NOT NULL,
  `room_number` INT NOT NULL UNIQUE,
  `guest_capacity` INT NOT NULL,
  `availability` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`room_id`)
);

INSERT INTO `Rooms` (`room_id`, `room_typeID`, `room_number`, `guest_capacity`, `availability`) VALUES
(1, 'King', 278, 2, 'Unavailable'),
(4, 'Double-Full', 103, 2, 'Available'),
(5, 'Queen', 104, 2, 'Available'),
(6, 'Double-Queen', 202, 4, 'Available'),
(7, 'King', 203, 2, 'Available'),
(8, 'King', 243, 2, 'Available');

CREATE TABLE `room_type` (
	`room_typeID` INT,
    `typeName` VARCHAR(15) NOT NULL,
    `description` TEXT NOT NULL,
    `rate` VARCHAR(15),
    `guests_max` INT NOT NULL,
    PRIMARY KEY (`room_typeID`)
);

INSERT INTO `room_type` (`room_typeID`, `typeName`, `description`, `rate`, `guests_max`) VALUES
(1, 'Double', 'A double room typically includes one double-sized bed, designed to comfortably accommodate two people. Its a standard choice, suitable for couples or solo travelers desiring a bit more room.', '$125', 2),
(2, 'Queen', 'A queen-sized bed, offering more space than a double. Its ideal for couples seeking extra comfort or for solo travelers who appreciate a larger sleeping area.', '$135', 2),
(3, 'Double-Queen', 'A double-queen room features two queen-sized beds, designed to comfortably sleep up to four people. Ideal for families or groups, it offers ample sleeping space and is a popular choice in hotels and resorts.', '$150', 4),
(4, 'King', 'Spacious room featuring a luxurious king-sized bed, perfect for ultimate comfort and relaxation.', '$160', 2);

CREATE TABLE `Reservation` (
	`reservation_id` INT,
    `customer_id` INT,
    `room_id` INT,
    `guests` INT NOT NULL,
    `check_in` DATE NOT NULL,
    `check_out` DATE NOT NULL,
    `total_price` DECIMAL,
    `reservation_status` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`reservation_id`)
);

INSERT INTO `Reservations` (`reservation_id`, `customer_id`, `room_id`, `guests`, `check_in`, `check_out`, `total_price`, `reservation_status`) VALUES
(1235566, 103, 2, 2, '2026-01-20', '2026-01-25', 675, 'Unconfirmed'),
(8712389, 104, 1, 2, '2026-01-20', '2026-01-25', 625, 'Confirmed'),
(23456781, 101, 4, 2, '2026-01-15', '2026-01-20', 800, 'Confirmed'),
(47920214, 102, 3, 4, '2026-01-20', '2026-01-25', 750, 'Confirmed');
