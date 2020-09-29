/****** Object:  UserDefinedFunction [dbo].[StockTradeID]    Script Date: 2017-11-12 2:23:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[StockTradeID] 
(
	@StockID int,
	@TradeDate datetime,
	@LedgerID int
)
RETURNS int
AS
BEGIN
	DECLARE @StockTradeID int
    SELECT @StockTradeID = MAX(isnull(StockTradeID,0)) + 1 FROM tblStockLedger 
	WHERE /** TradeDate <= @TradeDate and **/ StockID = @StockID --and LedgerID < @LedgerID

	RETURN @StockTradeID

END






GO

