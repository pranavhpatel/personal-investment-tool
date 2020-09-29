/****** Object:  UserDefinedFunction [dbo].[TransType]    Script Date: 2017-11-12 2:24:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TransType] 
(
	@stockID int,
	@Quantity decimal (19,6),
	@TransType varchar(10)
)
RETURNS varchar(10)
AS
BEGIN
	DECLARE @TType varchar(10)
	set @TType = @TransType
	IF @TransType = '0'
		Begin
		IF @Quantity >= 1
			SET @TType = 'Buy'
		IF @Quantity < 0
			SET @TType = 'Sell'
		END
	IF @TransType = '1' 
		SET @TType = 'Transfer'
	IF @TransType = '2' 
		SET @TType = 'Fees'
	IF @TransType = '3'
		SET @TType = 'Interest'
	RETURN @TType

END
GO

