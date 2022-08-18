-- =============================================
-- Create Database Snapshot Template
-- =============================================
USE master
GO


-- Create the database snapshot
CREATE DATABASE SN_Rowlevel1230 ON
( NAME = rowlevel,--Logische Name der DAtendatei von OrgDB
FILENAME = 'D:\_SQLDB\SN_Rowlevel1230.mdf' )
AS SNAPSHOT OF rowlevel;
GO

--Für den Restore müssen alle von beiden DBs runter

restore database rowlevel from database_Snapshot = 'SN_Rowlevel1230'



