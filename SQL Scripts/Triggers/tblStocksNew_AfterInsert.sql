/****** Object:  Trigger [dbo].[tblStocksNew_AfterInsertNew]    Script Date: 2017-11-12 2:29:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create trigger [dbo].[tblStocksNew_AfterInsertNew]
on [dbo].[tblStocksNew]
after insert
as
begin
--designed for single row insert
--set nocount on added to prevent extra result sets from interfering with select statemtns
set nocount on;
--key vlaues
declare @StockID int
declare @Ticker nvarchar(5)
declare @Exchange nvarchar(5)
--base values
declare @TickerLong varchar(50)
declare @CompanyName nvarchar(100)

set @Ticker = (select [Ticker] from inserted)
set @CompanyName = (select [CompanyName] from inserted)
set @Exchange = (select [Exchange] from inserted)
set @TickerLong = @Ticker +':'+ @Exchange

update [dbo].[tblStocksNew]
set
[Ticker] = @Ticker,
[CompanyName] = @CompanyName,
[TickerLong] = @TickerLong
where [Ticker] = @Ticker and [Exchange] = @Exchange
END
GO

ALTER TABLE [dbo].[tblStocksNew] ENABLE TRIGGER [tblStocksNew_AfterInsertNew]
GO

