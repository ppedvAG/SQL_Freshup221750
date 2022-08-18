--Scalar Function 
--SQL kann zu Beginn der Ausf�rhung keinen ordentlichen Plan erstellen
--mit SQL 2019 wird die Planerstellung verz�gert um f�r die Funktion eine bessere Einsch�tzung zu bekommen
--klappt aber nur beim rel einfachen Funktionen..
--das geht nur bei einfachen Skalawertfunktionen



USE [master]
GO
ALTER DATABASE [Northwind] SET COMPATIBILITY_LEVEL = 110
GO

use northwind;
GO

select * from sys.dm_exec_function_stats

create or alter function dbo.fbrutto
	(
		@Fracht money,
		@MwSt decimal (4,2)
	) returns money
as
Begin
	return (@Fracht*@MwST)
End
--Skalarfunction kann vorab nicht exakt gesch�tzt werden..
--jetzt versteht SQL Server wie das intern funktioniert

--zB: f(spalte, Wert) --> Spalte * Wert
--... begrenzt machbar
set statistics io, time on

select * into ku3 from ku2


update ku3 set freight = freight * RAND(convert(varbinary, newid()))*100
select freight, count(*) from ku3 group by freight

select * from ku3 where dbo.fbrutto(freight,1.19) < 2
--, CPU-Zeit = 4094 ms, verstrichene Zeit = 4548 ms.

--   CPU time = 1297 ms,  elapsed time = 1614 ms.

ALTER DATABASE [Northwind] SET COMPATIBILITY_LEVEL = 150
GO

select * from ku3 where dbo.fbrutto(freight,1.19) < 2
--   CPU time = 94 ms,  elapsed time = 150 ms.

select inline_type, * from sys.sql_modules


--Bsp mit mehr Daten--->


















use StackOverflow2010;
GO

CREATE OR ALTER FUNCTION dbo.ScalarFunction ( @uid INT )
RETURNS BIGINT
    WITH RETURNS NULL ON NULL INPUT, SCHEMABINDING
AS
    BEGIN
        DECLARE @BCount BIGINT;
        SELECT  @BCount = COUNT_BIG(*)
        FROM    dbo.Badges AS b
        WHERE   b.UserId = @uid
        GROUP BY b.UserId;
        RETURN @BCount;
    END;
GO

ALTER DATABASE [StackOverflow2010] SET COMPATIBILITY_LEVEL = 150
set statistics io , time on
go
SELECT TOP 1000 u.DisplayName, dbo.ScalarFunction(u.Id)
FROM dbo.Users AS u
GO



select inline_type, * from sys.sql_modules

