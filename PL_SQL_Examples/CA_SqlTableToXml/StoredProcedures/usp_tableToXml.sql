USE [AdventureWorks2012]
GO

CREATE PROC [dbo].[TabletoXML]
(
@id INT
)

AS

		SELECT 
			   per.BusinessEntityID AS "CustomerID"
			  ,per.[PersonType] AS "Contact/PersonType"
			  ,per.[Title] AS "Contact/Title"
			  ,per.[FirstName] AS "Contact/FirstName"
			  ,per.[LastName] AS "Contact/LastName"
			  ,ad.AddressLine1 AS "Address/Street"
			  ,ad.City AS "Address/City"
			  ,ad.PostalCode AS "Address/PostalCode"
			  ,ad.[StateProvinceID] AS "Address/RegionID"
		FROM 
			[AdventureWorks2012].[Person].[Person] per
			inner JOIN 
					(
					SELECT 
						*
					FROM 
						(
						SELECT 
							 [BusinessEntityID]
							,[AddressID]
							,ROW_NUMBER() OVER (PARTITION BY [BusinessEntityID] ORDER BY AddressID desc) row
						FROM 
							[AdventureWorks2012].[Person].[BusinessEntityAddress]
						)tmp 
							WHERE 
								tmp.row = 1
					) bea ON bea.BusinessEntityID = per.BusinessEntityID
			inner JOIN [AdventureWorks2012].[Person].[Address] ad ON ad.AddressID = bea.AddressID
		WHERE 
			per.BusinessEntityID = @id
		FOR XML PATH('Customer') ,TYPE




GO


