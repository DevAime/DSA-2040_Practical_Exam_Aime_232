-- Query 1: Roll-up - Total sales by country and quarter
-- Aggregates sales data at country and quarter level
SELECT 
    c.Country,
    t.Year,
    t.Quarter,
    COUNT(s.SalesID) as NumberOfTransactions,
    SUM(s.Quantity) as TotalQuantity,
    ROUND(SUM(s.NetSales), 2) as TotalSales
FROM 
    SalesFact s
    JOIN CustomerDim c ON s.CustomerID = c.CustomerID
    JOIN TimeDim t ON s.TimeID = t.TimeID
GROUP BY 
    c.Country, t.Year, t.Quarter
ORDER BY 
    c.Country, t.Year, t.Quarter;


-- Query 2: Drill-down - Sales details for United Kingdom by month
-- Provides detailed monthly breakdown for a specific country
SELECT 
    t.Year,
    t.Month,
    CASE t.Month
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
    END as MonthName,
    COUNT(s.SalesID) as NumberOfTransactions,
    SUM(s.Quantity) as TotalQuantity,
    ROUND(SUM(s.NetSales), 2) as TotalSales,
    ROUND(AVG(s.NetSales), 2) as AverageSales
FROM 
    SalesFact s
    JOIN CustomerDim c ON s.CustomerID = c.CustomerID
    JOIN TimeDim t ON s.TimeID = t.TimeID
WHERE 
    c.Country = 'United Kingdom'
GROUP BY 
    t.Year, t.Month
ORDER BY 
    t.Year, t.Month;


-- Query 3: Slice - Total sales by product category
-- Filters and analyzes sales by product category dimension
SELECT 
    p.ProductCategory,
    COUNT(DISTINCT s.CustomerID) as UniqueCustomers,
    COUNT(s.SalesID) as NumberOfTransactions,
    SUM(s.Quantity) as TotalQuantity,
    ROUND(SUM(s.NetSales), 2) as TotalSales,
    ROUND(AVG(s.NetSales), 2) as AverageSales,
    ROUND(SUM(s.NetSales) * 100.0 / (SELECT SUM(NetSales) FROM SalesFact), 2) as PercentageOfTotalSales
FROM 
    SalesFact s
    JOIN ProductDim p ON s.ProductID = p.ProductID
GROUP BY 
    p.ProductCategory
ORDER BY 
    TotalSales DESC;