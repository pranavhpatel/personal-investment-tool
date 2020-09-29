/****** Object:  UserDefinedFunction [dbo].[TradeAmt]    Script Date: 2017-11-12 2:23:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create FUNCTION [dbo].[TradeAmt] 
(
	@Quantity decimal (19,6),
	@Price decimal (19,6)
)
RETURNS decimal (19,6)
AS
BEGIN
	DECLARE @TradeAmt decimal (19,6)
    SELECT @TradeAmt = (IsNull(@Quantity,0) * IsNull(@Price,0) * -1 )

	RETURN @TradeAmt

END





GO

