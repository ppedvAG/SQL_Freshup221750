--pro Logilewachstum

-------------------------
TX____ |______|TX TX|
-------------------------

CDC CDT

--Das Wacshtum der Logfiles ist entscheidend ist ausschlaggebnend f�r die gr��e der VLF

10MB
----------------------------------------
1    2      3     4    1     2     3       4
---------------------------------------

1MB

-----------------------------------------
1 2 3 4  1234 1234 1234 1234 1234 12
-----------------------------------------



VLF
sql 2016 default Wachstum der Logfiles: +64MB

select 1000/64
--bis zu 64MB 4 
--64 bis 1000 8
--> 1000 16

--max Anzahl an VLF 3000   6000

50 MB + 50 MB Wachstum sind wieviele VLF bei typischen 10 MB Vergr��erungen?

dbcc loginfo --undokumentiert!

zu hohe Fragmentierung
zu gro�e = langsam
keine Formel


--variables to hold each 'iteration'  
declare @query varchar(100)  
declare @dbname sysname  
declare @vlfs int  
  
--table variable used to 'loop' over databases  
declare @databases table (dbname sysname)  
insert into @databases  
--only choose online databases  
select name from sys.databases where state = 0  
  
--table variable to hold results  
declare @vlfcounts table  
    (dbname sysname,  
    vlfcount int)  
  
 --grosse Logfile sichern, dann
 --Model Einfach w�hlen (Vorsicht: TX werden aus dem Log gel�scht.. h�tten gesichert werden k�nnen)
 --Log verkleinern
 --Ideale Startg�r�e eingeben (25% der Daten).. Wachstumsrate hoch w�hlen (bis 1000MB)
 --Model Vollst�ndig und eine VOLLBACKUP

 --Restore Log  (100MB) wie lange dauert der Restore aus dem Logfile
 --alle 30min Logsicherung  .. restore 30min dauern

 --variables to hold each 'iteration'  
declare @query varchar(100)  
declare @dbname sysname  
declare @vlfs int  
  
--table variable used to 'loop' over databases  
declare @databases table (dbname sysname)  
insert into @databases  
--only choose online databases  
select name from sys.databases where state = 0  
  
--table variable to hold results  
declare @vlfcounts table  
    (dbname sysname,  
    vlfcount int)  
  
 
 
--table variable to capture DBCC loginfo output  
--changes in the output of DBCC loginfo from SQL2012 mean we have to determine the version 
 
declare @MajorVersion tinyint  
set @MajorVersion = LEFT(CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(max)),CHARINDEX('.',CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(max)))-1) 

if @MajorVersion < 11 -- pre-SQL2012 
begin 
    declare @dbccloginfo table  
    (  
        fileid smallint,  
        file_size bigint,  
        start_offset bigint,  
        fseqno int,  
        [status] tinyint,  
        parity tinyint,  
        create_lsn numeric(25,0)  
    )  
  
    while exists(select top 1 dbname from @databases)  
    begin  
  
        set @dbname = (select top 1 dbname from @databases)  
        set @query = 'dbcc loginfo (' + '''' + @dbname + ''') '  
  
        insert into @dbccloginfo  
        exec (@query)  
  
        set @vlfs = @@rowcount  
  
        insert @vlfcounts  
        values(@dbname, @vlfs)  
  
        delete from @databases where dbname = @dbname  
  
    end --while 
end 
else 
begin 
    declare @dbccloginfo2012 table  
    (  
        RecoveryUnitId int, 
        fileid smallint,  
        file_size bigint,  
        start_offset bigint,  
        fseqno int,  
        [status] tinyint,  
        parity tinyint,  
        create_lsn numeric(25,0)  
    )  
  
    while exists(select top 1 dbname from @databases)  
    begin  
  
        set @dbname = (select top 1 dbname from @databases)  
        set @query = 'dbcc loginfo (' + '''' + @dbname + ''') '  
  
        insert into @dbccloginfo2012  
        exec (@query)  
  
        set @vlfs = @@rowcount  
  
        insert @vlfcounts  
        values(@dbname, @vlfs)  
  
        delete from @databases where dbname = @dbname  
  
    end --while 
end 
  
--output the full list  
select dbname, vlfcount  
from @vlfcounts  
order by dbname