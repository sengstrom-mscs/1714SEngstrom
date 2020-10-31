-- Stacey Engstrom
-- Exercise 2F:Animal Shelter Test Queries
-- AnimalShelter DB

--)2F-1 All Animals
SELECT Animals.AnimalName, AnimalTypes.Type, People.FirstName + N' ' + People.LastName AS Expr1
FROM     Animals INNER JOIN
                  People ON Animals.Person_Id = People.Id INNER JOIN
                  AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id

--)2F-2 Cash Donations
SELECT People.LastName + N',' + N' ' + People.FirstName AS Donor, Donations.DonationDate, SUM(Donations.Value) AS Amount
FROM     Donations INNER JOIN
                  DonationTypes ON Donations.DonationType_Id = DonationTypes.Id INNER JOIN
                  People ON Donations.Person_Id = People.Id
GROUP BY People.LastName + N',' + N' ' + People.FirstName, Donations.DonationDate, DonationTypes.Description
HAVING (DonationTypes.Description = N'Cash')

--)2F-3 Total Donations for each Donor
SELECT Donations.Person_Id AS ID, People.FirstName + N' ' + People.LastName AS Donor, SUM(Donations.Value) AS [Total Donations]
FROM     Donations INNER JOIN
                  People ON Donations.Person_Id = People.Id
GROUP BY Donations.Person_Id, People.FirstName + N' ' + People.LastName

--)2F-4 Number of Dogs for each owner
SELECT People.Id, People.LastName + N',' + N' ' + People.FirstName AS Owner, SUM(AnimalTypes.Id) AS [Number of Dogs]
FROM     Animals INNER JOIN
                  AnimalTypes ON Animals.AnimalType_Id = AnimalTypes.Id INNER JOIN
                  People ON Animals.Person_Id = People.Id
GROUP BY People.Id, People.LastName + N',' + N' ' + People.FirstName, AnimalTypes.Type
HAVING (AnimalTypes.Type = N'Dog')


