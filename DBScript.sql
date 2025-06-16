CREATE DATABASE ComputerShop;
GO

USE ComputerShop;
GO

CREATE TABLE Users (
    userId INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fullName NVARCHAR(100),
    createdAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Products (
    productId INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(500),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    imageUrl VARCHAR(255)
);

CREATE TABLE Orders (
    orderId INT PRIMARY KEY IDENTITY(1,1),
    userId INT NOT NULL,
    orderDate DATETIME DEFAULT GETDATE(),
    totalAmount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING',
    FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE OrderDetails (
    orderDetailId INT PRIMARY KEY IDENTITY(1,1),
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES Orders(orderId),
    FOREIGN KEY (productId) REFERENCES Products(productId)
);

CREATE TABLE Cart (
    cartId INT PRIMARY KEY IDENTITY(1,1),
    userId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (productId) REFERENCES Products(productId)
);

-- Insert sample data
INSERT INTO Users (username, password, email, fullName) VALUES
('admin', 'admin123', 'admin@computershop.com', N'Quản Trị Viên'),
('user1', 'user123', 'user1@computershop.com', N'Nguyễn Văn A');

INSERT INTO Products (name, description, price, stock, imageUrl) VALUES
(N'Laptop Dell XPS 13', N'Core i7, 16GB RAM, 512GB SSD', 1299.99, 50, 'dell_xps13.jpg'),
(N'MacBook Pro 14', N'M1 Pro, 16GB RAM, 1TB SSD', 1999.99, 30, 'macbook_pro.jpg'),
(N'Gaming PC RTX 3080', N'Core i9, 32GB RAM, 1TB SSD', 2499.99, 20, 'gaming_pc.jpg');