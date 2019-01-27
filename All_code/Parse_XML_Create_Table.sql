with cte_cust as
(
select 
    fun_return_xmltype('ONE_XML', 'Customers_2.xml') as xml_data
from 
    dual
)

Select 
    cust_data.*
FROM 
    cte_cust cust, 
xmltable
(
   '$C/Customers/Customer' Passing cust.xml_data as "C"
   COLUMNS 
    "CustomerID"    number(38,0)   path 'CustomerID',
    "Person_Type"   nvarchar2(50)  Path 'Contact/PersonType',
    "First_Name"    nvarchar2(100) Path 'Contact/FirstName',
    "Last_Name"     nvarchar2(100) Path 'Contact/LastName',
    "Street"        nvarchar2(100) Path 'Address/Street',
    "City"          nvarchar2(100) Path 'Address/City',
    "Postal_Code"   nvarchar2(100) path 'Address/PostalCode',
    "Region_ID"     number(38,0)   path 'Address/RegionID',
    "Customer_XML"  xmltype        path '/Customer'
    
) cust_data
    where 
        rownum<= 10;