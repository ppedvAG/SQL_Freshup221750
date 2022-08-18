--MAXDOP regelt wieviele CPus werden für eine ABfrage max verwendet


--vor SQL 2016
--Kostenschwellwert: 5  SQL Dollar
--max Grad an Paral: 0 Alle CPUS

--Seit 2016
--KOstenschwellwert   5
--Mxdop : Anzahl der CPUs (max 8)


select * from ku1 where city = 'Paris'


--Abfragespeicher
--Scoped Database

set statistics io, time on

SELECT        Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.ShipVia, Orders.Freight, 
                         Orders.ShipName, Orders.ShipCity, Orders.ShipCountry, [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Employees.LastName, Employees.FirstName, Employees.BirthDate, 
                         Products.ProductName, Products.UnitsInStock
INTO KundeUmsatz
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                         Products ON [Order Details].ProductID = Products.ProductID


insert into kundeumsatz
select * from kundeumsatz

select * into ku1 from kundeumsatz

alter table ku1 add id int identity


select country, SUM(unitprice*quantity) from ku1 where YEAR(OrderDate) =1998
group by country

--im Plan... 2 Pfeile: mehr CPUS

select country, SUM(unitprice*quantity) from ku1
group by country option (maxdop 1)

--, CPU-Zeit = 502 ms, verstrichene Zeit = 80 ms.

--je mehr CPUs desto besser

select country, SUM(unitprice*quantity) from ku1
group by country option (maxdop 6)

--260ms 







--Messbar

select * from sys.dm_os_wait_stats where wait_type like 'CX%'