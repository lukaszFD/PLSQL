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
			LEFT JOIN [AdventureWorks2012].[Person].[BusinessEntityAddress] bea ON bea.BusinessEntityID = per.BusinessEntityID
			LEFT JOIN [AdventureWorks2012].[Person].[Address] ad ON ad.AddressID = bea.AddressID
		WHERE 
			per.BusinessEntityID = @id
		FOR XML PATH('Customer') ,TYPE




GO


