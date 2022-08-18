/*
Columnstore Index
statt zeileorientierung spaltenroientiertes Ablegen der Daten
extrem hohe Kompressionsraten möglich
Deutlich weniger IO --> deutlich weniger RAM --> deutlich weniger CPU

Allerdings.. jeder INS UP erstellt DAtensätze in einem HEAP
		    ein DEL lscht nicht


Evtl sind es genau die DAten , die man Einfügt und ändert--> HEAP-SCAN

*/
--Prüfung der Segemente, Status und Deltastores
select from sys.dm_db_column_store_row_group_physical_stats


--Berechnung pro , die wo

--Summe der Fracht pro Orderid, alle aus Germany
set statistics io, time on

select orderid, SUM(freight) from ku1
where Country = 'germany'
group by orderid
--61131 Seiten  --CPU-Zeit = 642 ms, verstrichene Zeit = 89 ms.

dbcc showcontig('ku1')
-- Mittlere Seitendichte (voll).....................: 97.87%
-- Gescannte Seiten.............................: 48019

--veraltet
select * from sys.dm_db_index_physical_stats
	(db_id(), object_id('ku1'),NULL,NULL,'detailed')
	--forward Record Counts


--Korrekter Index.. 

--CL IX vs NON CL IX
--CL IX reserviert für OrderDate


select * from customers

insert into Customers (CustomerID, CompanyName) values ('ppedv', 'fa ppedv')


select orderid, SUM(freight) from ku1
where Country = 'germany'
group by orderid
--923  16ms 22 ms


select orderid, SUM(UnitPrice*Quantity) from ku1
where Country = 'germany' OR EmployeeID = 4
group by orderid

select * from sys.dm_db_index_usage_stats



select * into ku2 from ku1

select orderid, SUM(freight) from ku2
where Country = 'germany'
group by orderid


USE [Northwind]
GO

SELECT  top 10000000 [CustomerID]
      ,[CompanyName]
      ,[ContactName]
      ,[ContactTitle]
      ,[City]
      ,[Country]
      ,[EmployeeID]
      ,[OrderDate]
      ,[ShipVia]
      ,[Freight]
      ,[ShipName]
      ,[ShipCity]
      ,[ShipCountry]
      ,[OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[LastName]
      ,[FirstName]
      ,[BirthDate]
      ,[ProductName]
      ,[UnitsInStock]

  FROM [dbo].[ku2]

GO  3

