

SELECT*
FROM PortfolioProject..ECommerceUK


SELECT InvoiceDateConverted, CONVERT(Date, InvoiceDate)
FROM PortfolioProject..ECommerceUK

UPDATE ECommerceUK
SET InvoiceDate = CONVERT(Date, InvoiceDate)

ALTER TABLE ECommerceUK
ADD InvoiceDateConverted Date;

UPDATE ECommerceUK
SET InvoiceDateConverted = CONVERT(Date, InvoiceDate)



WITH RowNumCTE AS (
SELECT  *,
	ROW_NUMBER() OVER (
	PARTITION BY InvoiceNo,
				StockCode,
				Description,
				Quantity,
				InvoiceDate,
				CustomerID
				ORDER BY
					InvoiceNo
					) ROW_NUM
FROM PortfolioProject..ECommerceUK

)

SELECT *
FROM RowNumCTE
WHERE ROW_NUM > 1


SELECT CustomerID, ISNULL(CONVERT(NVARCHAR, CustomerID), 'NO CUSTOMER ID')
FROM PortfolioProject..ECommerceUK


UPDATE PortfolioProject..ECommerceUK
SET CustomerID = ISNULL(CONVERT(NVARCHAR, CustomerID), 'NO CUSTOMER ID')


ALTER TABLE PortfolioProject..ECommerceUK
ADD CustomerIDFixed NVARCHAR(25);

UPDATE PortfolioProject..ECommerceUK
SET CustomerIDFixed = ISNULL(CONVERT(NVARCHAR, CustomerID), 'NO CUSTOMER ID')




SELECT Description, ISNULL(CONVERT(NVARCHAR, Description), 'NO DESCRIPTION')
FROM PortfolioProject..ECommerceUK

UPDATE PortfolioProject..ECommerceUK
SET Description = ISNULL(CONVERT(NVARCHAR, Description), 'NO DESCRIPTION')




ALTER TABLE PortfolioProject..ECommerceUK
DROP COLUMN InvoiceDate, CustomerID, DescriptionFixed


