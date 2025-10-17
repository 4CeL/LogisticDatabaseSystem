CREATE DATABASE Testing --nanti ganti

USE Testing

CREATE TABLE MsItem (
    ItemID CHAR(5) PRIMARY KEY,
    ItemName VARCHAR(200),
    Weight_kg INT,
    UnitPrice DECIMAL(10, 2)
)

CREATE TABLE MsSender (
    SenderID CHAR(5) PRIMARY KEY,
    SenderName VARCHAR(200),
    SenderPhoneNumber VARCHAR(100)
)

CREATE TABLE MsReceiver (
    ReceiverID CHAR(5) PRIMARY KEY,
    ReceiverName VARCHAR(200),
    ReceiverPhoneNumber VARCHAR(100)
)

CREATE TABLE MsCourier (
    CourierID CHAR(5) PRIMARY KEY,
    CourierCompany VARCHAR(200)
)

CREATE TABLE MsShipping (
    ShippingID CHAR(5) PRIMARY KEY,
    ShippingDestination VARCHAR(200),
    ShippingDate DATE,
    ShippingOrigin VARCHAR(200),
    DeliveryStatus VARCHAR(200),
    ItemID CHAR(5),
    CourierID CHAR(5),
    FOREIGN KEY (ItemID) REFERENCES MsItem(ItemID),
    FOREIGN KEY (CourierID) REFERENCES MsCourier(CourierID)
)

CREATE TABLE TrOrder (
    OrderID CHAR(5) PRIMARY KEY,
    ShippingID CHAR(5),
    Quantity INT,
    OrderDate DATE,
    ReceiverID CHAR(5),
    SenderID CHAR(5),
    ItemID CHAR(5),
    FOREIGN KEY (ShippingID) REFERENCES MsShipping(ShippingID),
    FOREIGN KEY (ReceiverID) REFERENCES MsReceiver(ReceiverID),
    FOREIGN KEY (SenderID) REFERENCES MsSender(SenderID),
    FOREIGN KEY (ItemID) REFERENCES MsItem(ItemID)
)


INSERT INTO MsReceiver (ReceiverID, ReceiverName, ReceiverPhoneNumber) VALUES
('R001', 'Evelyn Carter', '+1-212-555-0198'),
('R002', 'James Harrison', '+81-3-4567-8901'),
('R003', 'Sophia Bennett', '+49-30-9876-5432'),
('R004', 'Alexander Gray', '+61-2-8765-4321'),
('R005', 'Olivia Morgan', '+971-4-567-1234'),
('R006', 'Henry Thompson', '+27-21-345-6789'),
('R007', 'Isabella Brooks', '+55-11-2345-6789')

INSERT INTO MsSender (SenderID, SenderName, SenderPhoneNumber) VALUES
('S001', 'Charlotte Evans', '+1-310-555-0123'),
('S002', 'Benjamin Foster', '+44-20-7946-0958'),
('S003', 'Amelia Scott', '+33-1-2345-6789'),
('S004', 'Lucas Reed', '+61-2-9876-5432')

INSERT INTO MsItem (ItemID, ItemName, Weight_kg, UnitPrice) VALUES
('I002', 'Laptop', 2, 10000000),
('I004', 'Sack of rice', 10, 50000),
('I005', 'Table', 13, 1000000),
('I001', 'Refrigerator', 30, 10000000),
('I003', 'Gaming Chair', 17, 3000000),
('I006', 'Table Lamp', 2, 500000)

INSERT INTO MsCourier (CourierID, CourierCompany) VALUES
('C001', 'FedEx'),
('C002', 'UPS'),
('C003', 'DHL Express'),
('C004', 'TNT'),
('C005', 'Aramex'),
('C006', 'USPS'),
('C007', 'Prime Logistics')

INSERT INTO MsShipping (ShippingID, ShippingDestination, ShippingOrigin, ShippingDate, DeliveryStatus, ItemID, CourierID) VALUES
('SH001', 'New York', 'Los Angeles', '2024-11-05', 'Shipped', 'I002', 'C001'),
('SH002', 'Tokyo', 'London', '2024-11-07', 'In Transit', 'I004', 'C002'),
('SH003', 'Berlin', 'Paris', '2024-11-10', 'Out for Delivery', 'I005', 'C003'),
('SH004', 'Sydney', 'Seoul', '2024-11-12', 'Delivered', 'I001', 'C004'),
('SH005', 'Dubai', 'Seoul', '2024-11-15', 'Pending', 'I003', 'C005'),
('SH006', 'Cape Town', 'Los Angeles', '2024-11-18', 'Returned', 'I006', 'C006'),
('SH007', 'São Paulo', 'Paris', '2024-11-20', 'Failed Delivery', 'I002', 'C007')

INSERT INTO TrOrder (OrderID, ShippingID, ReceiverID, SenderID, ItemID, Quantity, OrderDate) VALUES
('OR001', 'SH001', 'R001', 'S001', 'I002', 2, '2024-11-01'),
('OR002', 'SH002', 'R002', 'S002', 'I004', 3, '2024-11-03'),
('OR003', 'SH003', 'R003', 'S003', 'I005', 1, '2024-11-06'),
('OR004', 'SH004', 'R004', 'S004', 'I001', 2, '2024-11-08'),
('OR005', 'SH005', 'R005', 'S001', 'I003', 4, '2024-11-10'),
('OR006', 'SH006', 'R006', 'S001', 'I006', 1, '2024-11-13'),
('OR007', 'SH007', 'R007', 'S003', 'I002', 3, '2024-11-16');

-- SELECT * FROM MsSender
-- SELECT * FROM MsReceiver
-- SELECT * FROM MsItem
-- SELECT * FROM MsCourier
-- SELECT * FROM MsShipping
-- SELECT * FROM TrOrder