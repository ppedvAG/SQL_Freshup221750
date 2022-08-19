select * into kundeumsatz2 from KundeUmsatz


--SCAN  komplettes Durchsuchen  A bis Z 
--SEEK   Herauspicken 

set statistics io, time on

select		country, city, sum(unitprice*quantity)
from		kundeumsatz
where		productid = 2
group by country , city
--65856   ca 200ms

USE [Northwind]
GO
CREATE NONCLUSTERED INDEX NIX
ON [dbo].[KundeUmsatz] ([ProductID])
INCLUDE ([City],[Country],[UnitPrice],[Quantity])
GO


--174 Seiten (von HDD in RAM)  16ms

--CL : Orderdate
--> NON CLUSTERED ca 100mal


select		Lastname, orderdate, sum(unitprice*quantity)
from		kundeumsatz
where		employeeid in (2,3) and Country = 'UK'
group by Lastname, orderdate


--auf Kundeumsatz2

select		country, city, sum(unitprice*quantity)
from		kundeumsatz2
where		productid = 2
group by country , city


select		Lastname, orderdate, sum(unitprice*quantity)
from		kundeumsatz2
where		employeeid in (2,3) and Country = 'UK'
group by Lastname, orderdate

--beide Abfragen brauchen nur noch 0 bzw 1ms
--und brauchen im RAM max 3 MB

select * from sys.dm_db_column_store_row_group_physical_stats