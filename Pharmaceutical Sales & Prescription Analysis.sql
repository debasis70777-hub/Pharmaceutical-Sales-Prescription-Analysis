-- Create Database
CREATE DATABASE pharma_db;
USE pharma_db;

-- Create table for daily_sales
CREATE TABLE daily_sales (
    datum DATE,
    Year INT,
    Month INT,
    Hour INT,
    Weekday_Name VARCHAR(20),
    Day_Name VARCHAR(20),
    M01AB FLOAT,
    M01AE FLOAT,
    N02BA FLOAT,
    N02BE FLOAT,
    N05B FLOAT,
    N05C FLOAT,
    R03 FLOAT,
    R06 FLOAT,
    Total_Sales FLOAT
);

-- create table for weekly sales
CREATE TABLE weekly_sales (
    datum DATE,
    Year INT,
    Month INT,
    Hour INT,
    Weekday_Name VARCHAR(20),
    Day_Name VARCHAR(20),
    M01AB FLOAT,
    M01AE FLOAT,
    N02BA FLOAT,
    N02BE FLOAT,
    N05B FLOAT,
    N05C FLOAT,
    R03 FLOAT,
    R06 FLOAT,
    Total_Sales FLOAT
);

-- createing table for monthly sales
CREATE TABLE monthly_sales (
    datum DATE,
    Year INT,
    Month INT,
    Hour INT,
    Weekday_Name VARCHAR(20),
    Day_Name VARCHAR(20),
    M01AB FLOAT,
    M01AE FLOAT,
    N02BA FLOAT,
    N02BE FLOAT,
    N05B FLOAT,
    N05C FLOAT,
    R03 FLOAT,
    R06 FLOAT,
    Total_Sales FLOAT
);

-- Createing table for hourly sales
CREATE TABLE hourly_sales (
    datum DATE,
    Year INT,
    Month INT,
    Hour INT,
    Weekday_Name VARCHAR(20),
    Day_Name VARCHAR(20),
    M01AB FLOAT,
    M01AE FLOAT,
    N02BA FLOAT,
    N02BE FLOAT,
    N05B FLOAT,
    N05C FLOAT,
    R03 FLOAT,
    R06 FLOAT,
    Total_Sales FLOAT
);

-- Import Data
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/clean_daily.csv'
INTO TABLE daily_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/clean_weekly.csv'
INTO TABLE weekly_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/clean_monthly.csv'
INTO TABLE montly_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/clean_weekly.csv'
INTO TABLE weekly_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'D:/clean_hourly.csv'
INTO TABLE hourly_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Total Revenue
SELECT SUM(Total_Sales) FROM daily_sales;

-- Monthly Trend
SELECT Month, SUM(Total_Sales)
FROM daily_sales
GROUP BY Month
ORDER BY Month;

-- Weekly Pattern
SELECT Weekday_Name, SUM(Total_Sales)
FROM daily_sales
GROUP BY Weekday_Name;

-- Hourly Sales
SELECT Hour, SUM(Total_Sales)
FROM hourly_sales
GROUP BY Hour
ORDER BY Hour;

-- Drug Category Performance
SELECT 
    SUM(M01AB), SUM(M01AE), SUM(N02BA),
    SUM(N05B), SUM(R03)
FROM daily_sales;

-- Top Drug Category
SELECT 'M01AB' AS drug, SUM(M01AB) FROM daily_sales
UNION ALL
SELECT 'M01AE', SUM(M01AE) FROM daily_sales
UNION ALL
SELECT 'N02BA', SUM(N02BA) FROM daily_sales
ORDER BY 2 DESC;

