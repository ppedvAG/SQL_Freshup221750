set statistics io, time on


--BatchMode. eigtl dem ColumnStore vorbehalten..
--Seit SQL 1019 auch in RowStore verf�gbar..

use AdventureWorksDW2016_EXT
go
alter database AdventureWorksDW2016_EXT set compatibility_level = 120;
go



alter database AdventureWorksDW2016_EXT set compatibility_level = 150;
go


--Tats Ausf�rhungsplan CLIX SCAN.. Row Mode.. KompLevele: 140
--, CPU-Zeit = 15125 ms, verstrichene Zeit = 3170 ms.



--Tats Ausf�rhungsplan CL IX SCAN.. Bacth Mode.. KompLevele: 150
-- CPU-Zeit = 7249 ms, verstrichene Zeit = 2208 ms.

select salesorderlinenumber,sum(TotalProductCost) 
from dbo.FactResellerSalesXL_PageCompressed
group by salesorderlinenumber

-- CPU-Zeit = 15559 ms, verstrichene Zeit = 2851 ms.
--, CPU-Zeit = 9547 ms, verstrichene Zeit = 1645 ms.
