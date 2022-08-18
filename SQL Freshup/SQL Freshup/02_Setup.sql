--Filetable

--evtl besseres Konzept für DAteien im SQL Server per Fieltable
--integraler BEstandteil einer DB

\\Server\INSTANZ\DB\Tab\Datei =  C:\.....\Datei  ? Select * from filetable


--Jeglicher lokale ZUgriff geschieht über das NT Service Konto, 
--auch wenn andereres KOnto für Dienst angegeben wurde
NT Service\SQLAgent$FE.... lokale Konten, die ihr Kennwort reg. selbst ändern

--\\NAS\   -- Computerkonto.. auf Freigaben muss das Computerkonto Zugriff haben


Volumewartungstask
---------------------------------------------------------------
010102010101010101010101111110011111111111111110101101011111111
---------------------------------------------------------------

2 GB .. 4,1... 1,8

SQL Server kann selbständig vergößern ohne vorher "ausnullen" zu müssen



Tempdb

..soviele Dateien wie Kerne, aber nicht mehr als 8
..T1117  gleich große DatenDateien
..T1118  uniform Extents.. nur ein Thread hat Zugriff.. (Block:Latch)
		Problem: nur ein Thread kann auf eine Seite/Block zugreifen
				was wenn 2 #t Tabellen verscheid. User in dem selben Block sind


Was kommt in TempDB?

#t
Auslagerungen (sortieren)
363MB
Index Wartung IX Rebuild mit tempdb und Online    1100
Index Wartung IX Rebuild ohne tempdb und Offline  900
Zeilenversionierung





Arbeitsspeicher
..das ca RAM Verbrauch des OS wird im Setup nun vorreserviert, sofern man zustimmt ;-)



MAXDOP
wieviele CPUs werden für eine Abfrage verwendet...



