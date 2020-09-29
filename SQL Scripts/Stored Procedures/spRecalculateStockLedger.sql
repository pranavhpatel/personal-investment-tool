/****** Object:  StoredProcedure [dbo].[RecalculateStockLedger]    Script Date: 2017-11-12 2:20:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecalculateStockLedger]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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

	DECLARE @TransType varchar(10)

	-- base values
	DECLARE @Quantity decimal(19,6)
	DECLARE @Price decimal(19,6)
	DECLARE @Comm decimal(19,6)
	DECLARE @Acct int

	ALTER TABLE [dbo].[tblStockLedger] DISABLE TRIGGER [tblStockLedger_AfterInsertNewMulti]
	ALTER TABLE [dbo].[tblStockLedger] DISABLE TRIGGER [tblStockLedger_AfterUpdate]


    DECLARE @grmCursor AS CURSOR;
	SET @grmCursor = CURSOR FOR SELECT LedgerID, StockID, TradeDate, SettleDate, 
        Quantity, Price, Comm, Acct, TransType FROM dbo.tblStockLedger;  
    OPEN @grmCursor; 
    FETCH NEXT FROM @grmCursor INTO @LedgerID, @StockID, @TradeDate, @SettleDate, @Quantity, @Price, @Comm, @Acct, @TransType;

    WHILE @@FETCH_STATUS = 0
	BEGIN
        SELECT @DayTradeID = DayTradeID from dbo.tblStockLedger where LedgerID = @LedgerID
        SELECT @StockTradeID = StockTradeID from dbo.tblStockLedger where LedgerID = @LedgerID
        SELECT @TransType = TransType from dbo.tblStockLedger where LedgerID = @LedgerID
        SET @Amount = dbo.TradeAmt(@Quantity, @Price)
        SET @NetAmt = dbo.TradeAmtNet(@Quantity, @Price, @Comm)
        SET @Position = dbo.StockPosition(@StockID, @StockTradeID, @DayTradeID, @TradeDate, @Quantity)


        UPDATE dbo.tblStockLedger
        SET
			DayTradeID = @DayTradeID,
			StockTradeID = @StockTradeID,
     		TransType = @TransType,
     		Amount = @Amount,
     		NetAmt = @NetAmt,
     		Position = @Position

        WHERE LedgerID = @LedgerID


        FETCH NEXT FROM @grmCursor INTO @LedgerID, @StockID, @TradeDate, @SettleDate, @Quantity, @Price, @Comm, @Acct, @TransType;
	END

	CLOSE @GRMCursor;
	DEALLOCATE @GRMCursor;

	ALTER TABLE [dbo].[tblStockLedger] ENABLE TRIGGER [tblStockLedger_AfterInsertNewMulti]
	ALTER TABLE [dbo].[tblStockLedger] ENABLE TRIGGER [tblStockLedger_AfterUpdate]

END
GO

