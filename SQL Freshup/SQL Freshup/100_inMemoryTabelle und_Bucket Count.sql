--inMemoryTabellen benötigen keine Latches bei Inserts
--inMemoryTabellen benötigen inMmemory Filegroups

USE [master]
GO

GO
ALTER DATABASE [Northwind] ADD FILEGROUP [IM] CONTAINS MEMORY_OPTIMIZED_DATA 
GO
ALTER DATABASE [Northwind] ADD FILE ( NAME = N'imVerzeichnis', FILENAME = N'D:\_SQLDB\imVerzeichnis' ) TO FILEGROUP [IM]
GO



CREATE TABLE imTabelle
(
	id int identity, 
	sp1 varchar(50),
	sp2 money INDEX IXIM NONCLUSTERED (sp2), 

   CONSTRAINT PK_IM PRIMARY KEY NONCLUSTERED (sp1),
   INDEX IXhash HASH (id) WITH (BUCKET_COUNT = 131072) --<----- in etwa Slots
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = Schema_only)   --> nach Neustart werden Daten rekonstruiert
GO

--Bucketcount
--Wird auf die nächste 2er Potenz gerundet
--> 1 MIo --> 1.048.576
--> Bucket Count *8 bytes
-- + 8 bytes mal Anzahl der zeilen

---> 1,073,741,824 ---> 8.589.934.592 bytes

--Formel für Bucket Count Berechnung auf der Basis einer bestehenden Tabelle
SELECT
  POWER(
    2,
    CEILING( LOG( COUNT( 0)) / LOG( 2)))
    AS 'BUCKET_COUNT'
FROM
  (SELECT DISTINCT id FROM ku1) T