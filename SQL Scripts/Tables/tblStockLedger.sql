/****** Object:  Table [dbo].[tblStockLedger]    Script Date: 2017-11-12 2:19:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblStockLedger](
	[LedgerID] [int] IDENTITY(1,1) NOT NULL,
	[TradeDate] [datetime] NOT NULL,
	[SettleDate] [datetime] NOT NULL,
	[Acct] [int] NOT NULL,
	[StockID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](19, 6) NULL,
	[Comm] [decimal](19, 6) NULL,
	[DayTradeID] [int] NULL,
	[StockTradeID] [int] NULL,
	[TransType] [varchar](10) NULL,
	[Amount] [decimal](19, 6) NULL,
	[NetAmt] [decimal](19, 6) NULL,
	[Position] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[EnterBy] [varchar](5) NULL,
	[BrokerID] [int] NULL,
	[Locked] [bit] NULL,
 CONSTRAINT [PK__tblStock__AE70E0AF21DD57C9] PRIMARY KEY CLUSTERED 
(
	[LedgerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

