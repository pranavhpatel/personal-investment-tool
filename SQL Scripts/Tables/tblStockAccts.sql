/****** Object:  Table [dbo].[tblStockAccts]    Script Date: 2017-11-12 2:17:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblStockAccts](
	[AcctsID] [int] IDENTITY(1,1) NOT NULL,
	[AcctNum] [int] NOT NULL,
	[AcctName] [varchar](30) NOT NULL,
	[Curr] [int] NOT NULL,
	[BrokerID] [int] NOT NULL,
 CONSTRAINT [PK__tblAccts__31E96EC7FFE05240] PRIMARY KEY CLUSTERED 
(
	[AcctsID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

