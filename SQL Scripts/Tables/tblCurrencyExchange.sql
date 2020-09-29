/****** Object:  Table [dbo].[tblCurrencyExchange]    Script Date: 2017-11-12 2:16:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCurrencyExchange](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[SourceCurrency] [int] NULL,
	[DestinationCurrency] [int] NULL,
	[Rate] [decimal](19, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unicon_tblCurrencyExchange_Date_Value] UNIQUE NONCLUSTERED 
(
	[EffectiveDate] ASC,
	[SourceCurrency] ASC,
	[DestinationCurrency] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

