-- Dimension Table: Customer
CREATE TABLE CustomerDim (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50),
    Region VARCHAR(50),
    RegistrationDate DATE
);

-- Dimension Table: Product
CREATE TABLE ProductDim (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(200),
    ProductCategory VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    Supplier VARCHAR(100)
);

-- Dimension Table: Time
CREATE TABLE TimeDim (
    TimeID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT,
    DayOfWeek VARCHAR(20)
);

-- Fact Table: Sales
CREATE TABLE SalesFact (
    SalesID SERIAL PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    TimeID INT,
    Quantity INT,
    SalesAmount DECIMAL(12, 2),
    Discount DECIMAL(5, 2),
    NetSales DECIMAL(12, 2),
    FOREIGN KEY (CustomerID) REFERENCES CustomerDim(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES ProductDim(ProductID),
    FOREIGN KEY (TimeID) REFERENCES TimeDim(TimeID)
);

-- Create indexes for better query performance
CREATE INDEX idx_sales_customer ON SalesFact(CustomerID);
CREATE INDEX idx_sales_product ON SalesFact(ProductID);
CREATE INDEX idx_sales_time ON SalesFact(TimeID);
CREATE INDEX idx_product_category ON ProductDim(ProductCategory);
CREATE INDEX idx_customer_country ON CustomerDim(Country);
CREATE INDEX idx_time_quarter ON TimeDim(Quarter, Year);