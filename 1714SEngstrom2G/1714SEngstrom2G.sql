-- Stacey Engstrom
-- Exercise 2G:Property Manager2 Test Queries
-- PropertyManager2 DB

--)2G1 Building, Apartment, Admins
SELECT Buildings.Id, Buildings.BuildingName, Buildings.City, Apartments.ApartmentNum, 
People.FirstName + N' ' + People.LastName AS Admin
FROM     Buildings INNER JOIN
                  Apartments ON Buildings.Id = Apartments.Building_Id INNER JOIN
                  People ON Apartments.Admin_Id = People.Id
ORDER BY Buildings.City

--)2G2 Apartment, invoices, line items
SELECT Apartments.Building_Id, Apartments.ApartmentNum, People.LastName + N',' + N' ' + People.FirstName AS Tenant, 
LineItems.Invoice_Id, LineItems.Description, LineItems.Amount
FROM     Apartments INNER JOIN
                  Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                  LineItems ON Invoices.Id = LineItems.Invoice_Id INNER JOIN
                  People ON Apartments.Tenant_Id = People.Id
ORDER BY Apartments.ApartmentNum


--)2G3 Tenants, invoices, receipts
SELECT People.Id, People.LastName + N',' + N' ' + People.FirstName AS Tenant, Invoices.Id AS InvoiceID, 
Invoices.DueDate, Receipts.ReceiptDate, Receipts.Amount
FROM     Apartments INNER JOIN
                  People ON Apartments.Tenant_Id = People.Id INNER JOIN
                  Invoices ON Apartments.Id = Invoices.Apartment_Id INNER JOIN
                  Receipts ON Invoices.Id = Receipts.Invoice_Id
ORDER BY Tenant