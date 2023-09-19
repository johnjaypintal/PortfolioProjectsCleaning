

WITH RowNumCTE AS (
SELECT  *,
	ROW_NUMBER() OVER (
	PARTITION BY Name,
				Platform,
				Year,
				Genre,
				Publisher,
				NA_Sales,
				EU_Sales,
				JP_Sales,
				Other_Sales,
				Global_Sales
				ORDER BY
					Name
					) ROW_NUM

FROM PortfolioProject..vgsales
)

DELETE
FROM RowNumCTE
WHERE ROW_NUM > 1