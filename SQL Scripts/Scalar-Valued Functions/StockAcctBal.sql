/****** Object:  UserDefinedFunction [dbo].[StockAcctBal]    Script Date: 2017-11-12 2:22:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[StockAcctBal] 
(
	@Account int,
	@NetAmt decimal (19,6),
	@SettleDate datetime,
	@DayTradeID Int
)
RETURNS decimal (19,6)
AS
BEGIN
	DECLARE @AcctBal decimal (19,6)
	DECLARE @AcctBal1 decimal (19,6)
	DECLARE @AcctBal2 decimal (19,6)

	Select @AcctBal1 = Sum (IsNull(NetAmt,0)) from dbo.tblStockLedger where Acct = @Account and SettleDate < @SettleDate
	Select @AcctBal2 = Sum (IsNull(NetAmt,0)) from dbo.tblStockLedger where Acct = @Account and SettleDate = @SettleDate and DayTradeID < @DayTradeID
	
	Set @AcctBal = IsNull(@AcctBal1,0) + IsNull(@AcctBal2,0) + @NetAmt

	RETURN @AcctBal
	end
GO

