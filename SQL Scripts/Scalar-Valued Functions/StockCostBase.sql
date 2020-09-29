/****** Object:  UserDefinedFunction [dbo].[StockCostBase]    Script Date: 2017-11-12 2:23:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[StockCostBase] 
(
	@StockID int,
	@StockTradeID int,
	@DayTradeID int,
	@TradeDate datetime,
	@BVChange decimal (19,6)
)
RETURNS decimal (19,6)
AS
BEGIN
	DECLARE @CB decimal (19,6)

	SELECT @CB = SUM(IsNull(BVChange,0)) FROM dbo.tblStockLedger WHERE (StockID = @StockID and TradeDate < @TradeDate) or (StockID = @StockID and TradeDate = @TradeDate and DayTradeID < @DayTradeID)
	SET @CB = IsNull(@CB,0) + IsNull(@BVChange,0)
	
	RETURN @CB

END






GO

