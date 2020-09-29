/****** Object:  Table [dbo].[tblStockBroker]    Script Date: 2017-11-12 2:19:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblStockBroker](
	[BrokerID] [int] IDENTITY(1,1) NOT NULL,
	[BrokerName] [varchar](30) NOT NULL,
	[DefaultCommRate] [decimal](19, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrokerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

