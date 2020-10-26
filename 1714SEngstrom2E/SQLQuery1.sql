-- Stacey Engstrom
-- Exercise 2D: Mulit-Table Joins, totals
-- PropertyManager DB

--2E1 Building Name and Location, filter by Winona,MN
SELECT   BuildingName, Address, City + N', ' + State + N' ' + Zip AS [City State Zip]
FROM         Building
WHERE     (City = N'Winona')

--2E2 Apartment Estimated Rent
SELECT   Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent]
FROM         Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId
WHERE     (Building.City = N'Red Wing')

--2E3 Estimated vs Actual Rent
SELECT   Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms AS [Estimated Rent], 
                         Apartment.Rent - (Apartment.SquareFeet * 0.9 + 100 * Apartment.Bathrooms) AS Difference
FROM         Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId
WHERE     (Building.City = N'Red Wing')

--2E4 Invoice Total
SELECT   Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS Expr1
FROM         Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

--2E5 Invoice Total and Recipt
SELECT   Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], 
                         Receipt.Amount
FROM         Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

--2E6 Invoice Total vs Received
SELECT   Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS Tenant, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount, 
                         SUM(LineItem.Amount) - Receipt.Amount AS Difference
FROM         Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingID, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING   (SUM(LineItem.Amount) - Receipt.Amount > 0)

--2E7 Late Payments
SELECT   Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Tenant Name], Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(Day, Invoice.DueDate, 
                         Receipt.ReceiptDate) AS [Days Late]
FROM         Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingID INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Building.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, DATEDIFF(Day, Invoice.DueDate, Receipt.ReceiptDate), Invoice.DueDate, 
                         Receipt.ReceiptDate
HAVING   (DATEDIFF(Day, Invoice.DueDate, Receipt.ReceiptDate) > 0)

--2E8 Next Invoice Date
SELECT   Person.PersonID, Person.FirstName + N' ' + Person.LastName AS Tenant, MAX(Invoice.InvoiceDate) AS [Recent Invoice], DATEADD(month, 1, MAX(Invoice.InvoiceDate)) 
                         AS [Next Invoice]
FROM         Person INNER JOIN
                         Apartment ON Person.PersonID = Apartment.TenantID INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Person.PersonID, Person.FirstName + N' ' + Person.LastName