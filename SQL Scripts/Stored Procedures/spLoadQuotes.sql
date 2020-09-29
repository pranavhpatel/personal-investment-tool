/****** Object:  StoredProcedure [dbo].[LoadQuotes]    Script Date: 2017-11-12 2:20:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[LoadQuotes] as
begin
merge into [dbo].[tblQuotes] as trgtbl
using(
select s.StockID as [StockID],
	convert(datetime, q.[Date]) as [QuoteDate],
	cast(case q.[Open] when '' then '0' else q.[Open] end as decimal(19,6)) as [Open],
	cast(case q.[Last] when '' then '0' else q.[Last] end as decimal(19,6)) as [Last],
	cast(case q.[High] when '' then '0' else q.[High] end as decimal(19,6)) as [High],
	cast(case q.[Low] when '' then '0' else q.[Low] end as decimal(19,6)) as [Low],
	cast(case q.[VWAP] when '' then '0' else q.[VWAP] end as decimal(19,6)) as [VWAP],
	cast(case q.[Volume] when '' then '0' else q.[Volume] end as decimal(19,6)) as [Volume]
	from [dbo].[Bloomberg Quote Prices] q
	left outer join tblStocksNew s on q.TickerLong = s.TickerLong)
	as srctbl

on trgtbl.[QuoteDate] = srctbl.[QuoteDate] and trgtbl.[StockID] = srctbl.[StockID]

when not matched and [Volume] is not null then

insert (
	[StockID],
	[QuoteDate],
	[Open],
	[Last],
	[High],
	[Low],
	[VWAP],
	[Volume])
values
	([StockID],
	[QuoteDate],
	[Open],
	[Last],
	[High],
	[Low],
	[VWAP],
	[Volume]);
delete from [dbo].[Bloomber Quote Prices]
end


GO

