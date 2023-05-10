CREATE schema food_order;
USE food_order;
CREATE TABLE `customers` (
  `customer_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  `email` varchar(45) not null,
  `phone_no` CHAR(15) not null
)auto_increment=1;
INSERT INTO `customers` VALUES (1,'Alan Biju','alan@gmail.com',7654321);
INSERT INTO `customers` VALUES (2,'Don Sagar','don@gmail.com',7654321);
INSERT INTO `customers` VALUES (3,'Thomas','thomas@gmail.com',7654321);

CREATE TABLE `employees` (
  `employee_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_id`),
  `delivery_status` boolean,
  `phone_no` CHAR(15) not null
  
)auto_increment=1;
INSERT INTO `employees` VALUES (1,'Dona',true,7654321);
INSERT INTO `employees` VALUES (2,'Chandni',false,7654321);
INSERT INTO `employees` VALUES (3,'Akhila',true,7654321);

CREATE TABLE `orders` (
  `order_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `order_date` date not null,
  PRIMARY KEY (`order_id`),
  `res_id` tinyint(4) NOT NULL,
  `employee_id` tinyint(4) NOT NULL,
  `customer_id` tinyint(4) NOT NULL,
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
 FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`), 
 `quantity` int default 1
)auto_increment=1;

CREATE TABLE `restaurants` (
  `res_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255),
  `location` varchar(255),
  `menu_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`res_id`),
  FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`)

)auto_increment=1;

CREATE TABLE `menus` (
  `menu_id` tinyint(4) NOT NULL AUTO_INCREMENT,
	`item_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`menu_id`),
  FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)

)auto_increment=1;


CREATE TABLE `items` (
  `item_id` tinyint(4) NOT NULL AUTO_INCREMENT,
	`item_name` varchar(255),
    `item_price` varchar(255),
  PRIMARY KEY (`item_id`)
  

)auto_increment=1;


