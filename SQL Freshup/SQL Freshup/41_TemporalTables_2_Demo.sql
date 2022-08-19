use TemporalTables
GO

insert into Contacts 
(Lastname,Firstname,Birthday, Phone, email) 
select 'Kent', 'Clark','3.4.2010', '089-3303003', 'clarkk@krypton.universe' 

insert into Contacts 
(Lastname,Firstname,Birthday, Phone, email) 
select 'Wayne', 'Bruce','3.4.2012', '08677-3303003', 'brucew@gotham.city' 

select * from contacts
select * from contactshistory

--Und nun die Änderungen, die zu einer Versionierung der Datensätze führt 
WAITFOR DELAY '00:00:02'
update contacts set email = 'wer@earth.de' where cid = 1 
update contacts set Phone = 'w3434' where cid = 1 
update contacts set Lastname = 'Wayne' where cid = 1 

WAITFOR DELAY '00:00:02'

select getdate() as Zeit into #Zeit

WAITFOR DELAY '00:00:02'


update contacts set email = 'asas@earth.de' where cid = 1 
update contacts set Phone = 'w34sasaa34' where cid = 2 
update contacts set Lastname = 'Smith' where cid = 1 

--Result
select * from contacts 

select * from [dbo].[Contactshistory]

select * , 
		(Select  
			convert(varchar(50),min(Startdatum)) 
			+ '<-->' + 
			convert(varchar(50), Max(Enddatum)) 
		from ContactsHistory )
	from ContactsHistory


--2020-04-14 18:50:43.1110912<-->2020-04-14 18:57:53.3801501

--nach Version suchen
'2022-08-19 12:14:37.000000'
select * from contactshistory 
where 
    Startdatum >= '19.3.2021 14:19:20'  
    and 
    Enddatum <= '19.3.2021 14:20:50'

--Noch besser
select * from contacts 
    FOR SYSTEM_TIME AS OF '2022-08-19 12:14:37.000000'
    where cid =1 
union all
select * from contacts 
       where cid =1 


--Neue Spalten
Alter Table contacts
	add spx int


	select * from [dbo].[MSSQL_TemporalHistoryFor_581577110]


	select * from contacts



update contacts set Firstname= 'Chris', spx=2 where cid = 1

	--nope
delete from Contactshistory where StartDatum <= '2016-08-05 12:45:43.2711351'


