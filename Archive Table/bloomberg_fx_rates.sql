USE [StockQuotes]
GO

/****** Object:  Table [dbo].[Bloomber FX Rates]    Script Date: 2017-08-05 10:18:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bloomber FX Rates](
	[EffectiveDate] [datetime] NULL,
	[SourceCurrency] [int] NULL,
	[DestinationCurrency] [int] NULL,
	[Rate] [decimal](19, 6) NULL
)
GO

