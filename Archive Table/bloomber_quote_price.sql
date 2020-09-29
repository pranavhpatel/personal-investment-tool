USE [StockQuotes]
GO

/****** Object:  Table [dbo].[Bloomberg Quote Prices]    Script Date: 2017-08-05 10:19:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bloomberg Quote Prices](
	[StockID] [varchar](50) NULL,
	[TickerLong] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Open] [varchar](50) NULL,
	[Last] [varchar](50) NULL,
	[High] [varchar](50) NULL,
	[Low] [varchar](50) NULL,
	[VWAP] [varchar](5) NULL,
	[Volume] [varchar](50) NULL
)
GO

