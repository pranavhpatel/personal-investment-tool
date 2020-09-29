/****** Object:  UserDefinedFunction [dbo].[StockPosition]    Script Date: 2017-11-12 2:23:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[StockPosition] 
(
	@StockID int,
	@StockTradeID int,
	@DayTradeID int,
	@TradeDate datetime,
	@Quantity decimal (19,6)
)
RETURNS decimal (19,6)
AS
BEGIN
	DECLARE @Qty decimal (19,6)
    SELECT @Qty = SUM(isnull(Quantity,0)) FROM tblStockLedger WHERE (StockID = @StockID and TradeDate < @TradeDate ) or (StockID = @StockID and TradeDate = @TradeDate and DayTradeID < @DayTradeID)
	SET @Qty = IsNull(@Qty,0) + IsNull(@Quantity,0)
	RETURN @Qty
	end
GO

