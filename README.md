# personal-investment-tool

This repo contains SQL scripts to build a database for a personal investment tool and Excel and Access files to provide a dashboard to utilize various features connecting to the database. 

## Features

- User will be able to add stocks into the database using "AddStock.accdb"
- User will be able to input their personal trades completed on various brokers into "InputTrade.accdb" to have their own record. Stocks need to be added to database before trades can be recorded
- Using csv data from Yahoo finance, historical data can be added into the database
- Graphs can be exported using historical data in database

I completed this on Microsoft Azure with Transact SQL programming in 2017 during my university studies. I have greatly developed my programming standards since then! :)

# Database Breakdown
- Tables
- Views
- Stored Procedures
- Scalar-Valued Functions
- Triggers

*documentation for each file found in respective directory

## Tables
- tblCurrencyExchange.sql
- tblQuotes.sql
- tblStockAccts.sql
- tblStockBroker.sql
- tblStockLedger.sql
- tblStocksNew.sql
- tblTradingDates.sql

## Views
- qryStockLedger.sql
- qryTblQuotes.sql

## Stored Procedures
- spLoadCurrencyExchange.sql
- spLoadQuotes.sql
- spRecalculateStockLedger.sql

## Scalar-Valued Functions
- DayTradeID.sql
- StockACctBal.sql
- StockBVChg.sql
- StockCostBase.sql
- StockPosition.sql
- StockTradeID.sql
- TradeAmt.sql
- TradeAmtNet.sql
- TransType.sql

## Triggers
- tblStockLedger_AfterInsert.sql
- tblStockLedger_AfterUpdate.sql
- tblStocksNew_AfterInsert.sql

*These scripts will execute upon specific events that occur

# Future updates
- Bloomberg data pull on securities quotes and fx rates
