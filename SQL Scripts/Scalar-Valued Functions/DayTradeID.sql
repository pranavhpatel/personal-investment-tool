/****** Object:  UserDefinedFunction [dbo].[DayTradeID]    Script Date: 2017-11-12 2:22:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[DayTradeID] 
(
	@TradeDate datetime,
	@LedgerID int
)
RETURNS int
AS
BEGIN
	DECLARE @DayTradeID int
    SELECT @DayTradeID = max(isnull(daytradeid,0))+1 FROM tblStockLedger 
	WHERE TradeDate = @TradeDate --and LedgerID < @LedgerID

	RETURN @DayTradeID

	end



GO

