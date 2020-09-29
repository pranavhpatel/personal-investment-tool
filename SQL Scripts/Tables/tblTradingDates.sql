/****** Object:  Table [dbo].[tblTradingDates]    Script Date: 2017-11-12 2:19:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTradingDates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_tblTradingDates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

