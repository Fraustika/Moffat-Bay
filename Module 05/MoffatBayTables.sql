CREATE TABLE `Customer` (
  `customer_id` INT,
  `first_name` VARCHAR(15) NOT NULL,
  `last_name` VARCHAR(15) NOT NULL,
  `email` VARCHAR(15) NOT NULL,
  `phone_number` INT NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Rooms` (
  `room_id` INT,
  `room_typeID` VARCHAR(15) NOT NULL,
  `room_number` INT NOT NULL UNIQUE,
  `guest_capacity` INT NOT NULL,
  `availability` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`room_id`)
);

CREATE TABLE `room_type` (
	`room_typeID` INT,
    `typeName` VARCHAR(15) NOT NULL,
    `description` TEXT NOT NULL,
    `rate` VARCHAR(15),
    `guests_max` INT NOT NULL,
    PRIMARY KEY (`room_typeID`)
);

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


