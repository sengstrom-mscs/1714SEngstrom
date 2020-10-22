-- Stacey Engstrom
-- Exercise 2D: Mulit-Table Joins, totals
-- PropertyManager DB

--2D.1) Building, Apartments, Administrators
SELECT Building.BuildingId, Building.BuildingName, Building.City, Apartment.ApartmentNum, Person.FirstName, Person.LastName
FROM     Building INNER JOIN
                  Apartment ON Building.BuildingId = Apartment.BuildingID INNER JOIN
                  Person ON Apartment.AdminID = Person.PersonID
ORDER BY Building.City, Building.BuildingName, Apartment.ApartmentNum, Person.LastName, Person.FirstName

--2D.2) Tenants, Building, Apartment
SELECT Person.PersonID, Person.LastName, Person.FirstName, Building.City, Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum
FROM     Person INNER JOIN
                  Apartment ON Person.PersonID = Apartment.TenantID INNER JOIN
                  Building ON Apartment.BuildingID = Building.BuildingId
ORDER BY Person.LastName, Person.FirstName, Building.BuildingId, Apartment.ApartmentNum

--2D.3) Apartment, tenant, invoice, line item
SELECT Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM     Apartment INNER JOIN
                  Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE  (Apartment.BuildingID = 1)
ORDER BY Apartment.ApartmentNum, Person.LastName, Person.FirstName, Invoice.InvoiceDate

--2D.4) Apartment, tenant, invoice total
SELECT Apartment.BuildingID, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total]
FROM     Apartment INNER JOIN
                  Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingID, Apartment.ApartmentId, Person.LastName, Person.FirstName, Invoice.InvoiceId, Invoice.InvoiceDate

--2D.5) Invoice, tenant, receipt
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Building.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName, Receipt.ReceiptDate, Receipt.Amount
FROM     Invoice INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                  Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                  Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                  Building ON Apartment.BuildingID = Building.BuildingId
ORDER BY Invoice.InvoiceDate, Receipt.ReceiptDate

--2D.6) Invoice, tenant, apartment, billed, recieved
SELECT Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName AS Tenant, Apartment.BuildingID, Apartment.ApartmentNum, SUM(LineItem.Amount) AS Total, Receipt.Amount AS Recieved
FROM     Invoice INNER JOIN
                  Apartment ON Invoice.ApartmentId = Apartment.ApartmentId INNER JOIN
                  Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Invoice.InvoiceId, Invoice.InvoiceDate, Person.LastName, Person.FirstName, Apartment.BuildingID, Apartment.ApartmentNum, Receipt.Amount

--2D.7) Administrator, invoice, total billed, recieved
SELECT Person.PersonID, Person.LastName, LineItem.InvoiceId, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Billed, Receipt.Amount AS Recieved
FROM     Apartment INNER JOIN
                  Person ON Apartment.AdminID = Person.PersonID INNER JOIN
                  Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                  LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                  Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Person.PersonID, Person.LastName, LineItem.InvoiceId, Invoice.InvoiceDate, Receipt.Amount