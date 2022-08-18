--



USE [Northwind]

GO


select * from ku1 where id <2

CREATE UNIQUE NONCLUSTERED INDEX [NIXID] ON [dbo].[ku1]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)

GO

select * from ku1 where id <13000





create proc gpdemo @id int
as
select * from ku1 where id<@id

exec gpdemo 2 --Immer Seek

exec gpdemo 1000000

set statistics io , time on

select * from ku1 where id <1000000

select * from orders where orderid = 290 --tinyint, smallint, int


select * from Customers where CustomerID = 'ALFKI'

select * from customers
where
CustomerID = 'ALFKI'

dbcc freeproccache

exec gpdemo 1000000

exec gpdemo  2