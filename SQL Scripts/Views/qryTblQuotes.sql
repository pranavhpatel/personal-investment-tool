/****** Object:  View [dbo].[qrytblQuotes]    Script Date: 2017-11-12 2:30:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[qrytblQuotes]
as

select a.[QuotesID],
	a.[StockID],
	s.[Ticker],
	a.[QuoteDate],
	a.[Last],
	a.[Open],
	a.[High],
	a.[Low],
	a.[VWAP],
	a.[Volume]
	from [dbo].[tblQuotes] a
	inner join [dbo].[tblStocksNew] s on a.[stockid] = s.[stockid] 
GO

