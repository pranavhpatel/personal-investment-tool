/****** Object:  Table [dbo].[tblQuotes]    Script Date: 2017-11-12 2:16:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblQuotes](
	[QuotesID] [int] IDENTITY(1,1) NOT NULL,
	[StockID] [int] NULL,
	[QuoteDate] [datetime] NULL,
	[Open] [decimal](19, 6) NULL,
	[Last] [decimal](19, 6) NULL,
	[High] [decimal](19, 6) NULL,
	[Low] [decimal](19, 6) NULL,
	[VWAP] [decimal](19, 6) NULL,
	[Volume] [decimal](19, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuotesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unicon_tblQuotesNew_Stock_Date] UNIQUE NONCLUSTERED 
(
	[StockID] ASC,
	[QuoteDate] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

