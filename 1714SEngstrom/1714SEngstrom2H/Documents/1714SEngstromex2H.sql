
SELECT People.Id, People.FirstName + N' ' + People.LastName AS Employee, Departments.DepartmentName
FROM     Employees INNER JOIN
                  People ON Employees.Person_Id = People.Id INNER JOIN
                  Departments ON Employees.Department_Id = Departments.Id

SELECT Contracts.Date, Caterers.Name, Menus.Price, Contracts.Total
FROM     Contracts INNER JOIN
                  Menus ON Contracts.Menu_Id = Menus.Id INNER JOIN
                  Caterers ON Contracts.Caterer_Id = Caterers.Id

SELECT Employees.Id, People.FirstName + N' ' + People.LastName AS Employee, EmpStatus.Description
FROM     Employees INNER JOIN
                  People ON Employees.Person_Id = People.Id INNER JOIN
                  EmpStatus ON Employees.Employment_Id = EmpStatus.Id