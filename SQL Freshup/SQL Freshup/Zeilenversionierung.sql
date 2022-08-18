

select @@TRANCOUNT

select * into kunden from customers

begin tran
update  kunden  set city  = 'Hamburg' where customerid = 'ALFKI'

delete from kunden where   customerid = 'ALFKI'
rollback
---LCK auf Tabelle (Zeile , Block, Partition, .., DB, Schema)
--wg Indizes!  hier l�uft ein SCAN

--READ COMMIT default

--alternative: bl�d weil Wert ist noch nicht best�
set transaction isolation level read uncommitted


USE [master]
GO

--nun werden Zeilenversionen---> Tempdb--Massive Traffic
ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO

--�ndern des Standardverhaltens des Clients: statt read commit-- man liest die g�ltige Version
ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION ON
GO
