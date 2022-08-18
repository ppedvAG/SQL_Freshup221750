/*
master (Logins)
model
msdb (Jobs, Email, Historie, SSIS, Wartungsplan, ...)
tempdb (#t)


Idee. Eigenst�ndige DB


Einschr�nkungen und Tipps
Vermeiden Sie Logins mit gleichen Namen wie der Contained DB Benutzer. Falls doch, dann �ndern sie beim Login die Standarddatenbank so, dass nicht gleich auf die ContDB zugegriffen wird. Sonst gibts Fehler bei der Anmeldung.
keine Kerberos Authentifizierung m�glich
beim Anf�gen einer Datenbank den Zugriff auf Restricted User stellen, um nicht unegwollte zugriffe auf dem SQL Server zu haben.
keine Replikation
kein CDT und CDC
keine tempor�ren Prozeduren


Datenbank�bergreifende Zugriffe?
Ja, das ist m�glich. Notwendig dazu ist, dass die Contained Database auf vertrauensw�rdig gesetzt ist:

ALTER DATABASE ContDB SET TRUSTWORTHY ON

Anschliessend muss die aktuelle Verbindung des Benutzer zur�ckgesetzt werden, damit die �nderung aktiv werden kann.

*/

USE [master]
GO
ALTER DATABASE [ContDB] SET CONTAINMENT = PARTIAL WITH NO_WAIT
GO


--Teilweise:
--keine msdb Dinge dabei
--tempdb  die temp Tabellen sind immer noch in tempdb aber erben die Sparchsortierung der COntDB
---master: logins

