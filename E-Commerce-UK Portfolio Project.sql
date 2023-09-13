
SELECT *
FROM PortfolioProject..ECommerceUKCleaned

-- OVERALL TOTAL OF Quantity and UnitPrice

SELECT SUM(Quantity) AS TotalQuantity, SUM(UnitPrice) AS TotalUnitPrice
FROM PortfolioProject..ECommerceUKCleaned


--

SELECT Country