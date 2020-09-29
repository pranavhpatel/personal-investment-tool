/****** Object:  StoredProcedure [dbo].[LoadCurrencyExchange]    Script Date: 2017-11-12 2:20:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[LoadCurrencyExchange] as
begin
merge into [dbo].[tblCurrencyExchange] as trgtbl
using
(
select
	q.EffectiveDate,
	q.SourceCurrency,
	q.DestinationCurrency,
	q.Rate
from [dbo].[Bloomberg FX Rates] q
) as srctbl

on trgtbl.[EffectiveDate] = srctbl.[EffectiveDate] and trgtbl.[SourceCurrency] = srctbl.[SourceCurrency]
when not matched then
insert
	(EffectiveDate,
	SourceCurrency,
	DestinationCurrency,
	Rate)
values
	(EffectiveDate,
	SourceCurrency,
	DestinationCurrency,
	Rate);

delete from [dbo].[Bloomberg FX Rates]

END


GO

