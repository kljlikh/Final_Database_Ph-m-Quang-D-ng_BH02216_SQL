-- Xóa cơ sở dữ liệu cũ nếu đã tồn tại
DROP DATABASE IF EXISTS bag_mng;
GO

-- Tạo mới cơ sở dữ liệu
CREATE DATABASE bag_mng;
GO

USE bag_mng;
GO


-- Tạo bảng Category
CREATE TABLE Category (
    category_id INT PRIMARY KEY ,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);
-- Chèn dữ liệu mẫu
INSERT INTO Category (category_id, category_name, Description)
VALUES (1, 'BAG', 'Luxury package'),
       (2, 'BAG', 'armpit pocket');

-- Xem dữ liệu trong bảng
SELECT * FROM Category;

-- Tạo bảng Product
CREATE TABLE BagProduct (
    product_id INT PRIMARY KEY ,
    product_code VARCHAR(50) UNIQUE,
    product_name VARCHAR(150) NOT NULL,
    category INT,
    price DECIMAL(10,2),
    stock_quality INT,
    image_url VARCHAR(255),
    FOREIGN KEY (category) REFERENCES Category(category_id)
);
INSERT INTO BagProduct (product_id, product_code, product_name, category, price, stock_quality, image_url)
VALUES
(1, 'bag001', 'tuieovi', 1, 32000000, 200, 'images/tuieovi.jpg'),
(2, 'bag002', 'chalen', 1, 1200000, 200, 'images/chalen.jpg'), 
(3, 'bag003', 'diooooooo', 1, 1000000, 100, 'images/diooooooo.jpg');

select*from BagProduct
DROP TABLE IF EXISTS BagProduct;

-- Tạo bảng Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeCode NVARCHAR(50) NOT NULL,
    EmployeeName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    AuthorityLevel NVARCHAR(50) NOT NULL,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    [Password] NVARCHAR(255) NOT NULL,
    PasswordChanged NVARCHAR(255) NOT NULL
);
INSERT INTO Employee (EmployeeCode, EmployeeName, Position, AuthorityLevel, Username, [Password], PasswordChanged)
VALUES 
('BH02460', 'Le Quoc Viet', 'Sale', 'Sale', 'viet', 'viet123', 'hhhh'),
('BH02431', 'Le Anh Khanh', 'Warehouse', 'Warehouse', 'khanh', 'khanh123', 'kkkkkk'),
('BH02427', 'Bui Nhat Anh', 'Admin', 'Admin', 'nhatanh', 'anh123', 'hhhhhh');
SELECT * FROM Employee;
DROP TABLE IF EXISTS Employee;
-- Tạo bảng Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY ,
    customer_code VARCHAR(50) UNIQUE,
    customer_name VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    email VARCHAR(100)
);
INSERT INTO Customer (customer_id, customer_code, customer_name, phone, address, email)
VALUES
(1, 'C001', 'Nguyen Van An', '0905123456', '123 Le Loi, Da Nang', 'an.nguyen@example.com'),
(2, 'C002', 'Tran Thi Hoa', '0912233445', '45 Tran Phu, Ha Noi', 'hoa.tran@example.com'),
(3, 'C003', 'Le Van Minh', '0988776655', '78 Nguyen Hue, Ho Chi Minh', 'minh.le@example.com');
select*from [Customer]

DROP TABLE IF EXISTS Customers;


-- Tạo bảng Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME NOT NULL,
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Tạo bảng OrderDetail
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    QuantitySold INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES BagProduct(ProductID)
);

-- Tạo bảng Import
CREATE TABLE Import (
    ImportID INT PRIMARY KEY IDENTITY(1,1),
    ImportDate DATETIME NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Tạo bảng ImportDetail
CREATE TABLE ImportDetail (
    ImportDetailID INT PRIMARY KEY IDENTITY(1,1),
    ImportID INT,
    ProductID INT,
    QuantityImported INT NOT NULL,
    ImportCost DECIMAL(10,2),
    FOREIGN KEY (ImportID) REFERENCES Import(ImportID),
    FOREIGN KEY (ProductID) REFERENCES BagProduct(ProductID)
);
