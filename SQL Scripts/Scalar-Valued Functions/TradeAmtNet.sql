/****** Object:  UserDefinedFunction [dbo].[TradeAmtNet]    Script Date: 2017-11-12 2:24:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[TradeAmtNet] 
(
	@Quantity decimal (19,6),
	@Price decimal (19,6),
	@Comm decimal (19,6)
)
RETURNS decimal (19,6)
AS
BEGIN
	DECLARE @NetTradeAmt decimal (19,6)
    SELECT @NetTradeAmt = (IsNull(@Quantity,0) * IsNull(@Price,0) * -1 ) - IsNull(@Comm,0)

	RETURN @NetTradeAmt

END





GO

