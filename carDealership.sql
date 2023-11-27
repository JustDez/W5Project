CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  phone VARCHAR(30),
  address VARCHAR(100),
  email VARCHAR(50)
);
CREATE TABLE parts (
  parts_id SERIAL PRIMARY KEY,
  invoice_id VARCHAR(50)  
);
CREATE TABLE Service (
  service_id SERIAL PRIMARY KEY,
  order_date DATE,
  service_date VARCHAR(50),
  next_service DATE,
  service_invoice VARCHAR(50),
  service_invoice_id INTEGER,
  parts_id INTEGER,
  FOREIGN KEY (service_invoice_id) REFERENCES service_invoice(service_invoice_id),
  FOREIGN KEY (parts_id) REFERENCES parts(parts_id)
);

CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  billing_address VARCHAR(100),
  payment_medhod VARCHAR(50),
  card_number VARCHAR(50),
  service_invoice VARCHAR(50),
  salesperson_id INTEGER,
  customer_id INTEGER,
  service_id INTEGER,
  
  FOREIGN KEY (salesperson_id)  REFERENCES Salesperson(salesperson_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (service_id) REFERENCES service(service_id)
);
CREATE TABLE cars (
  car_id SERIAL PRIMARY KEY ,
  price NUMERIC(6,2),
  description_serial_number VARCHAR(200),
  model VARCHAR(50),
  make VARCHAR(100),
  invoice_id INTEGER,
  FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
);
CREATE TABLE Salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  full_name  VARCHAR(50),
  user_name  VARCHAR(50)
   

);
CREATE TABLE mechanics  (
  mechanic_id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  user_name VARCHAR(50),
  service_date VARCHAR(50),
  service_id INTEGER
);
CREATE TABLE service_invoice (
  service_invoice_id SERIAL PRIMARY KEY,
  service_type VARCHAR(50),
  service_date DATE,
  basic_service VARCHAR(50),
  mechanic_id VARCHAR(50),
  premium_service VARCHAR(50)
);



INSERT INTO Customer (full_name, phone, address, email) VALUES
('Maximillion Pegasus', '645-583-4567 ', '483 Millennium Eye Ave', 'SpiceGirlsForLife@hotmail.com')
RETURNING customer_id,
('Mai Valentine','456-246-4567', '658 Mcbalrog St', 'cardGurl41@aol.com')
RETURNING customer_id,
('Seto Kaiba', '987-658-3542', '1 Blue Eyes White Dragon Way', 'MrMoneyBags@kaibacorp.com')
RETURNING customer_id,
('Marik Ishtar', '303-574-3648', '465 Tombkeeper Drive', 'Malik.Blishtar@gmail.com')
RETURNING customer_id,
('Dartz', '675-945-3248', '300 Phawawoh Drive', 'King.Dartz@amail.com')
RETURNING customer_id,
('The Big Five', '555-555-5555', '2323 Kaiba Corp Blvd', 'TeamFourStar@kaibacorp.com')
RETURNING customer_id,
('Bandit-Keith Howard', '846-685-3265', '704 Merica way', 'InAmerica@gmail.com')
RETURNING customer_id;

-- WITH inserted_row AS (
--   INSERT INTO Customer (full_name, phone, address, email)
--   VALUES ('Bandit-Keith Howard', '846-685-3265', '704 Merica way', 'InAmerica@gmail.com')
--   RETURNING customer_id
-- )
-- SELECT customer_id FROM inserted_row;

INSERT INTO Salesperson (full_name, user_name) VALUES
('Yugi Moto', 'Super-special-awesome!')
RETURNING salesperson_id,
('Joey Wheeler', 'Brooklyn_Rage')
RETURNING salesperson_id,
('Tristan Taylor', 'Tristan_Rulz')
RETURNING salesperson_id,
('Téa Gardner', 'Dark_Magician_Girl')
RETURNING salesperson_id;




-- Insert data into parts table
INSERT INTO parts (invoice_id) VALUES
('INV123')
RETURNING parts_id,
('INV456')
RETURNING parts_id,
('INV582')
RETURNING parts_id,
('INV678')
RETURNING parts_id,
('INV246')
RETURNING parts_id,
('INV785')
RETURNING parts_id,
('INV654')
RETURNING parts_id;



-- Insert data into service_invoice table
INSERT INTO service_invoice (service_type, service_date, basic_service, mechanic_id, premium_service) VALUES
('Type1', '2023-01-01', 'Basic', '1', 'Premium1'),
('Type2', '2023-02-01', 'Basic', '2', 'Premium2');

-- Insert data into Service table
INSERT INTO Service (order_date, service_date, next_service, service_invoice_id, parts_id) VALUES
('2023-01-01', '2023-01-10', '2023-02-10', 1, 1),
('2023-02-01', '2023-02-10', '2023-03-10', 2, 2);

-- Insert data into Invoice table
INSERT INTO Invoice (full_name, billing_address, payment_medhod, card_number, service_invoice, salesperson_id, customer_id, service_id) VALUES
('Maximillion Pegasus', '483 Millennium Eye Ave', 'Credit Card', '**** **** **** 6542', 'INV123', 1, 1, 1),
('Mai Valentine', '658 Mcbalrog St', 'Cash', NULL, 'INV456', 2, 2, 2),
('Seto Kaiba', '1 Blue Eyes White Dragon Way', 'Credit Card', '**** **** **** 4658', 'INV582', 3, 3, 3),
('Marik Ishtar', '465 Tombkeeper Drive', 'Cash', NULL, 'INV678', 4, 4, 4),
('Dartz', '300 Phawawoh Drive', 'Cash', NULL, 'INV246', 5, 1, 5),
('The Big Five', '2323 Kaiba Corp Blvd', 'Cash', NULL, 'INV785', 4, 3, 4),
('Mai Valentine', '658 Mcbalrog St', 'Credit Card', '**** **** **** 8612', 'INV654', 4, 4, 4);

-- Insert data into cars table
INSERT INTO cars (price, description_serial_number, model, make, invoice_id) VALUES
(25000.00, 'ABC123', 'Sedan', 'Toyota', 1),
(30000.00, 'XYZ456', 'SUV', 'Honda', 2),
(18000.00, 'JKL789', 'Compact', 'Ford', 3),
(35000.00, 'MNO101', 'Truck', 'Chevrolet', 4),
(28000.00, 'PQR202', 'Coupe', 'BMW', 5),
(22000.00, 'STU303', 'Hatchback', 'Volkswagen', 6),
(32000.00, 'VWX404', 'Convertible', 'Mazda', 7),
(27000.00, 'YZA505', 'Sedan', 'Hyundai', 8),
(19000.00, 'BCD606', 'SUV', 'Kia', 9),
(30000.00, 'EFG707', 'Truck', 'Nissan', 10);


-- Insert data into mechanics table
INSERT INTO mechanics (full_name, user_name, service_date, service_id) VALUES
('Rex Raptor', 'DinoDan', '2023-01-10', 420)
RETURNING mechanics_id,
('Weevil Underwood', 'Bugz', '2023-02-10', 321)
RETURNING mechanics_id;





