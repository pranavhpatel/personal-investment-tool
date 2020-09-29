/****** Object:  Table [dbo].[tblStocksNew]    Script Date: 2017-11-12 2:19:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblStocksNew](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[Ticker] [nvarchar](5) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[Exchange] [nvarchar](5) NULL,
	[TickerLong] [varchar](50) NULL,
	[Allocated] [int] NULL,
	[Curr] [int] NULL,
 CONSTRAINT [PK_tblStocksNew] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

