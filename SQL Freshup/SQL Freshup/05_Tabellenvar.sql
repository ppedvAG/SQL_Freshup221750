--@Tab  vs #tab

--<= 1000 Zeilen @tab  sonst #t


--#t : ind, Lebensdauer solange Session offen ist


select * from waiting where year(Datum) = 2021 
--kommt viel oder wenig raus
--bei wenig, dann NON CL IX sehr gut geeignet

-- SQL schätzt je nach Version Tab Variable auf entweder 1 Zeile oder 100