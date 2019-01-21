Select 
    Contact.*,
    Address.*
FROM tbl_customer cust, XMLTABLE 
    (
       '/Customer/Contact' Passing cust.customer_xml
       
       COLUMNS "Person_Type"  nvarchar2(50)
                  Path 'PersonType',
               "First_Name"  nvarchar2(100)
                  Path 'FirstName',
               "Last_Name"  nvarchar2(100)
                  Path 'LastName'
    ) Contact
    , XMLTABLE 
    (
       '/Customer/Address' Passing cust.customer_xml
       
       COLUMNS "Street"  nvarchar2(100)
                  Path 'Street',
               "City"  nvarchar2(100)
                  Path 'City'
    ) Address
    where 
        rownum <= 10;