# World Layoffs Exploratory Data Analysis Using MySQL

## Project Overview

This project focuses on performing Exploratory Data Analysis (EDA) on a global layoffs dataset using MySQL.

The objective is to explore workforce reduction trends across companies, industries, countries, and years. SQL queries are used to aggregate data, identify patterns, compare layoffs, and calculate cumulative totals.

This project builds on my previous **World Layoffs Data Cleaning Using MySQL** project.

## Objectives

* Identify companies with the highest total layoffs.
* Analyze layoffs across industries and countries.
* Explore yearly and monthly layoffs trends.
* Calculate cumulative layoffs using SQL window functions.
* Rank companies by layoffs for each year.
* Examine layoffs by company stage.
* Identify companies reporting 100% workforce layoffs.

## Tools & Technologies

* **Database:** MySQL
* **SQL Environment:** MySQL Workbench
* **Skills:** Exploratory Data Analysis, Data Aggregation, Data Analysis

## SQL Concepts Used

* Aggregate functions: `SUM()`, `MAX()`
* Grouping and sorting: `GROUP BY`, `ORDER BY`
* Filtering: `WHERE`, `LIMIT`
* Date functions: `YEAR()`
* Common Table Expressions (CTEs)
* Window functions: `SUM() OVER()`
* Ranking functions: `DENSE_RANK()`

## Analysis & Key Findings

### 1. Company Analysis

Amazon recorded the highest total layoffs in the company-level analysis, with **18,150 reported layoffs**.

### 2. Industry Analysis

The Consumer industry recorded the highest total layoffs, with **44,782 reported layoffs**, followed by Retail with 43,613.

### 3. Yearly Analysis

Among the years analyzed, **2022 recorded the highest total layoffs**, with 160,661 reported layoffs.

### 4. Country Analysis

The United States recorded the highest total layoffs among the countries analyzed, with 256,559 reported layoffs.

### 5. Monthly Trend Analysis

Monthly layoffs were aggregated to examine changes over time. A rolling total was also calculated using a SQL window function to understand the cumulative trend.

### 6. Yearly Company Rankings

`DENSE_RANK()` was used to rank companies by total layoffs within each year and identify the companies with the highest reported layoffs.

### 7. Layoff Percentage Analysis

Several companies in the dataset reported a layoff percentage of 100%, indicating that the reported workforce reduction represented the entire workforce.

## Data Considerations

* The analysis uses the cleaned dataset from my previous data-cleaning project.
* Some records contain missing values for `total_laid_off` or `percentage_laid_off`.
* Aggregate calculations use the available numeric values; missing values are not treated as zero.
* Results represent the information available in the dataset and may not capture every layoff event.

## Project File

* `World_Layoffs_EDA.sql` — Contains the SQL queries used to perform the analysis.

## Related Project

**World Layoffs Data Cleaning Using MySQL**

The related project focuses on identifying duplicate records, standardizing inconsistent values, and handling missing data before analysis.

## What I Learned

Through this project, I practised writing SQL queries to explore a dataset, aggregate results, identify trends, use CTEs and window functions, and interpret findings.

## Author

Ratheena Aaskeen

