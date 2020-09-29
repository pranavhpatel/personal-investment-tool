/****** Object:  Trigger [dbo].[tblStockLedger_AfterInsertNewMulti]    Script Date: 2017-11-12 2:25:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tblStockLedger_AfterInsertNewMulti]
ON [dbo].[tblStockLedger]
AFter INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- test caption
	SET NOCOUNT ON;

	    -- diagnostics
    DECLARE @IsDebugging BIT
    SET @IsDebugging = 'TRUE'

		-- key values
	DECLARE @LedgerID Int
	DECLARE @TradeDate datetime
	DECLARE @SettleDate datetime
	DECLARE @StockID int

	-- calculated values
	DECLARE @DayTradeID int
	DECLARE @StockTradeID int
	DECLARE @Amount decimal(19,6)
	DECLARE @NetAmt decimal(19,6)
	DECLARE @Position decimal(19,6)

	-- base values
	DECLARE @Quantity decimal(19,6)
	DECLARE @Price decimal(19,6)
	DECLARE @Comm decimal(19,6)
	DECLARE @Acct int

	-- value by case
	DECLARE @TransType varchar(10)
	DECLARE @TransTypeTemp varchar(10)

    -- mulit row mode
    -- cursor
    DECLARE @grmCursor AS CURSOR;
	SET @grmCursor = CURSOR FOR SELECT LedgerID, StockID, TradeDate, SettleDate, 
        Quantity, Price, Comm, Acct, TransType FROM INSERTED;  
    OPEN @grmCursor; 
    FETCH NEXT FROM @grmCursor INTO @LedgerID, @StockID, @TradeDate, @SettleDate, @Quantity, @Price, @Comm, @Acct, @TransType;

    WHILE @@FETCH_STATUS = 0
    BEGIN

--	IF @IsDebugging = 'TRUE'
--	PRINT CONVERT(VARCHAR(10), @StockID) + ' ' +  CONVERT(VARCHAR(24), @FiscalDate, 113)+ ' ' +  CONVERT(VARCHAR(24), @ReportingDate, 113)
		
		-- rewrite TransType
        SET @TransTypeTemp = dbo.TransType(@StockID, @Quantity, @TransType)

        SET @DayTradeID = dbo.DayTradeID(@TradeDate, @LedgerID)
        SET @StockTradeID = dbo.StockTradeID(@StockID, @TradeDate, @LedgerID)   
        SET @Amount = dbo.TradeAmt(@Quantity, @Price)
        SET @NetAmt = dbo.TradeAmtNet(@Quantity, @Price, @Comm)
        SET @Position = dbo.StockPosition(@StockID, @StockTradeID, @DayTradeID, @TradeDate, @Quantity)

        UPDATE dbo.tblStockLedger
        SET
			DayTradeID = @DayTradeID,
			StockTradeID = @StockTradeID,
     		TransType = @TransTypeTemp,
     		Amount = @Amount,
     		NetAmt = @NetAmt,
     		Position = @Position
        WHERE LedgerID = @LedgerID


        FETCH NEXT FROM @grmCursor INTO @LedgerID, @StockID, @TradeDate, @SettleDate, @Quantity, @Price, @Comm, @Acct, @TransType;
    
    END

	CLOSE @grmCursor;
	DEALLOCATE @grmCursor;

END

GO

ALTER TABLE [dbo].[tblStockLedger] ENABLE TRIGGER [tblStockLedger_AfterInsertNewMulti]
GO

