/*
Indizes + Statistiken


Rebuild > 30 % Fragementierung 
Reorg  > 10%  Reorg

Statistiken:  braucht man für IX Wahl

CL IS ist gut bei Bereichsabfragen .. rel viele Zeilen
NC IX ist gut bei rel. wenigen Ergebniszeilen  --> < 1%  (ID PK)

er schätzt bereits beim gesch. Plan die ungefähre Menge der DS ab
--> Histogramm

--bei IX werden 100% genaue Stat gebildet 
ohne IX Stichproben

nicht bei jedem UP INS DEL werden STAT aktualisiert
+ 20% +500 + Abfrage




*/
select * from sys.dm_db_index_usage_stats
select * into o1 from orders

select * from o1 where employeeid = 2 --96 geschätzt und auch richtig

select * from o1 where freight  < 1 --24,28 korrekt 24

select * from o1 where orderid = 10249 and Shipcountry = 'USA'


--HEAP 200MB Daten 1 CL IX + 2 NCL IX --> 363 MB

------------------------------------------
--   OFFLINE               ONLINE
--  TEMPDB                OHNE TEMPDB
------------------------------------------

-- ONLINE + TEMPDB = ca 1100 MB
--OFFLINE  ohne tempdb = 890 MB
exec sp_Updatestats