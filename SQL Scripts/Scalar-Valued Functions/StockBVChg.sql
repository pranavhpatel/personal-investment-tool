/****** Object:  UserDefinedFunction [dbo].[StockBVChg]    Script Date: 2017-11-12 2:23:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[StockBVChg] 
(
	@StockID int,
	@StockTradeID int,
	@DayTradeID int,
	@TradeDate datetime,
	@NetAmt decimal (19,6),
	@Quantity decimal (19,6),
	@ExchRate decimal (19,6)
)
RETURNS decimal (19,6)
AS
BEGIN
	DECLARE @BV decimal (19,6)
	DECLARE @Qty decimal (19,6)
    IF @Quantity > 0 SET @BV = round(@NetAmt * @ExchRate,2)
	IF @Quantity < 0
	
	BEGIN 
		SELECT @BV = SUM(IsNull(BVChange,0)) FROM dbo.tblStockLedger 
			WHERE (StockID = @StockID and TradeDate < @TradeDate) or (StockID = @StockID and TradeDate = @TradeDate and DayTradeID < @DayTradeID)
		SELECT @Qty = SUM(IsNull(Quantity,0)) FROM dbo.tblStockLedger 
			WHERE (StockID = @StockID and TradeDate < @TradeDate) or (StockID = @StockID and TradeDate = @TradeDate and DayTradeID < @DayTradeID)
		SET @BV = round(@BV / @Qty * @Quantity * @ExchRate,2)
	END

	RETURN @BV

END




GO

