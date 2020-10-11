-- Stacey Engstrom
-- Exercise 2B: Summary queries, min/max, sum, average, count
-- PropertyManager DB

--2B.1) Building Table. Count all buildings.

SELECT        COUNT(*) AS [Count All Buildings]
FROM            Building

--2B.2) Building Table. Count buildings in Winona.

SELECT        COUNT(*) AS [Count Buildings in Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')

--2B.3) Apartment Table. Average rent for all apartments.

SELECT        AVG(Rent) AS [Avg Rent for all Apt]
FROM            Apartment

--2B.4) Apartment Table. Average rent for all apartments.

SELECT        SUM(Rent) AS [Total Rent for Building 1]
FROM            Apartment
GROUP BY BuildingID
HAVING        (BuildingID = 1)

--2B.5) Apartment Table. Cheapest rent for all apartments.

SELECT        MIN(Rent) AS [Cheapest Rent]
FROM            Apartment
GROUP BY BuildingID
HAVING        (BuildingID = 2)

--2B.6) Apartment Table. Smallest size, avg size, largest size for building 1

SELECT        MIN(SquareFeet) AS [Smallest Size], AVG(SquareFeet) AS [Avg Size], MAX(SquareFeet) AS [Largest Size]
FROM            Apartment
GROUP BY BuildingID
HAVING        (BuildingID = 1)

--2B.7) LineItem Table. Cheapest Price.

SELECT        MIN(Amount) AS [Cheapest Price]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')

--2B.8) LineItem Table. Total Amount billed for gas.

SELECT        SUM(Amount) AS [Total for Gas]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')

--2B.9) LineItem Table. Total Rent for October

SELECT        SUM(Amount) AS [Total Rent for Oct]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Rent, October 2018')
