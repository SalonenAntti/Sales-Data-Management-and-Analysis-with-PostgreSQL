-- =====================================
--  Schema creation
-- =====================================

-- Table creation

CREATE TABLE customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INTEGER NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE orderitems (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

CREATE TABLE categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);

CREATE TABLE suppliers (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(100),
    ZipCode VARCHAR(20),
    Country VARCHAR(100)
);

CREATE TABLE productcategories (
    ProductID INTEGER NOT NULL,
    CategoryID INTEGER NOT NULL,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

CREATE TABLE payments (
    PaymentID SERIAL PRIMARY KEY,
    OrderID INTEGER NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(100),
    TransactionID VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

CREATE TABLE shipping (
    ShippingID SERIAL PRIMARY KEY,
    OrderID INTEGER NOT NULL,
    ShippingDate DATE NOT NULL,
    ShippingMethod VARCHAR(100),
    TrackingNumber VARCHAR(100),
    ShippingCost DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

CREATE TABLE reviews (
    ReviewID SERIAL PRIMARY KEY,
    ProductID INTEGER NOT NULL,
    CustomerID INTEGER NOT NULL,
    Rating INTEGER CHECK (Rating >= 1 AND Rating <= 5),
    ReviewText TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

