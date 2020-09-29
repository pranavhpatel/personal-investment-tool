/****** Object:  View [dbo].[qryStockLedger]    Script Date: 2017-11-12 2:29:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[qryStockLedger] 
AS
	SELECT
		[LedgerID],
		s.[StockID],
		s.[Ticker] as 'Ticker',
		[TransType] as 'Type',
		[StockTradeID],
		[DayTradeID],
		[TradeDate],
		[SettleDate],
		[Quantity],
		[Price],
		[Amount],
		[Comm],
		[NetAmt],
		[Position],
		[TimeStamp],
		[EnterBy],
		[Locked]
	From dbo.tblStockLedger 
	inner join dbo.tblStocksNew s on dbo.tblStockLEdger.[StockID] = s.[StockID]
GO

