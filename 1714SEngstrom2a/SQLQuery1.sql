-- Stacey Engstrom
-- Exercise 2A: 2-Table Queries
-- PropertyManager DB

--2a.1) Building, Apartment tables. Sort by BuildingID and ApartmentNum

SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum

--2a.2) Building, Apartment tables. Sort by BuildingID and Rent


SELECT        Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Apartment INNER JOIN
                         Building ON Apartment.BuildingID = Building.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC

--2a.3) Apartment, Invoice tables. Sort by ApartmentNum and Invoice Date

SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingID = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC

--2a.4) Building, Apartment tables. Sort by BuildingID and Rent

SELECT        Apartment.BuildingID, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingID, Apartment.ApartmentNum, Invoice.InvoiceDate

--2a.5) Apartment, Person tables(Administrator). Sort by BuildingID and ApartmentNum.

SELECT        Apartment.BuildingID, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminID = Person.PersonID
ORDER BY Apartment.BuildingID, Apartment.ApartmentNum

--2a.6) Apartment, Person tables(TenantLastName, TenantFirstName). Sort by BuildingID, TenantLastName, TenantFirstName

SELECT        Apartment.BuildingID, Apartment.ApartmentNum, Person.LastName AS TenantLastName, Person.FirstName AS TenantFirstName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantID = Person.PersonID
ORDER BY Apartment.BuildingID, TenantLastName, TenantFirstName

--2a.7) Invoice, LineItem. Sort by ApartmentID and InvoiceDate.
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--2a.8) Invoice, LineItem. Sort by ApartmentID and InvoiceDate.

SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Rent October 2018') or
                         (LineItem.Description = N'garage')
ORDER BY Invoice.ApartmentId, Invoice.InvoiceDate DESC

--2a.9) Invoice, Reciept. Sort by ApartmentID and InvoiceID.
SELECT        Invoice.ApartmentId, Invoice.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Invoice.InvoiceId
