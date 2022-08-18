--Partitionierung behandelt Tabelle so, also ob sie viele kleiner Tabellen sein würden.

--Statt auf logischer Ebene viele Tabellen zu erzeugen, wird das Szenario rein auf der pyhsikalischen Ebene nachgebildet

--Was braucht man: Dateigruppen, Funktion und Schema

--zu haben ab SQL 2016 SP1 in jeder Version. DAvor nur Enterprise

--Partitionierung ist auch kompbinierbar mit Indizes und KOmpression... (Cool!)
--Partionierung extrem einfach verwaltbar
--lohnt sich bei sehr großen Tabellen und umfangreichen Scans zu vermeiden
--Zudem ist der SQL Server in der Lage auch partitionsweise Blocks zu erstellen....




create table tabelle (id int) on DGRUPPE



---------------100!----------200-------------------(5000)--------------

USE [master]
GO

GO
USE [Northwind]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 4;
GO
ALTER DATABASE [Northwind] ADD FILEGROUP [bis100]
GO
ALTER DATABASE [Northwind] ADD FILE ( NAME = N'nbis100daten', FILENAME = N'D:\_SQLDB\nbis100daten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [bis100]
GO
ALTER DATABASE [Northwind] ADD FILEGROUP [bis200]
GO
ALTER DATABASE [Northwind] ADD FILE ( NAME = N'nbis200daten', FILENAME = N'D:\_SQLDB\nbis200daten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [bis200]
GO
ALTER DATABASE [Northwind] ADD FILEGROUP [bis5000]
GO
ALTER DATABASE [Northwind] ADD FILE ( NAME = N'nbis5000Daten', FILENAME = N'D:\_SQLDB\nbis5000Daten.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [bis5000]
GO
ALTER DATABASE [Northwind] ADD FILEGROUP [rest]
GO
ALTER DATABASE [Northwind] ADD FILE ( NAME = N'nrest', FILENAME = N'D:\_SQLDB\nrest.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [rest]
GO


---
create partition function fzahl(int)
as
RANGE  LEFT FOR VALUES (100,200);
GO


select $partition.fzahl(15617) --2

create partition scheme schZahl
as
partition fzahl to (bis100,bis200, rest)
------                 1      2     3


create table partTab (id int identity, nummer int, spx char(4100))
ON schZahl(nummer)

declare @i as int=1
begin tran
while @i<=20000
	begin 
		insert into partTab
		select @i,'XY'
		set @i=@i+1		
	end
commit

--jeder DS ist in einer eig seiten

--ist dsa besser
set statistics io, time on -- evtl auch Plan
select * from partTab where nummer = 117 -- HEAP

select * from partTab where id = 117

--neue Grenze  5000

-- f(), schema , DGr  bis5000




alter partition scheme schZahl next used bis5000


select $partition.fzahl(nummer), max(nummer), min(nummer), count(*)
from parttab
group by $partition.fzahl(nummer)

alter partition function fzahl() split range (5000)


-------100------200---------------5000------------------

--15000 Teile
create table archiv (id int not null, nummer int, spx char(4100)) on rest

--alle DAten von 5000 bis 20000 ins Archiv schieben
--Grenez 100 raus...
alter partition function fzahl() merge range (100)



alter table parttab switch partition 3 to archiv

select * from archiv
select * from partTab where nummer = 4700





--Grenze 100 entfernen
-- F()

alter partition function fzahl() merge range (100)


create partition function fzahl(datetime)
as
RANGE  LEFT FOR VALUES ('31.12.2020 23:59:59.999','');
GO


create partition function fzahl(varchar(50))
as
RANGE  LEFT FOR VALUES ('N','');
GO


create partition scheme schZahl
as
partition fzahl to ([PRIMARY],[PRIMARY], [PRIMARY])












