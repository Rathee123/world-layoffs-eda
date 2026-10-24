SELECT * 
FROM layoffs_staging2;


SELECT MAX(total_laid_off)
FROM layoffs_staging2;


SELECT * 
FROM layoffs_staging2
WHERE total_laid_off = 12000;


SELECT MIN(total_laid_off)
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE total_laid_off = 3;


SELECT 
company ,
SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_employees_laid_off DESC;


SELECT
industry,
SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_employees_laid_off DESC;

 
 SELECT
 YEAR(date) AS year,
 SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY YEAR;


SELECT
YEAR(date) AS year,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY YEAR(date)
ORDER BY (total_laid_off) DESC;


SELECT
country,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_laid_off DESC;


SELECT 
SUBSTRING(date, 1, 7) AS `month`, 
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY SUBSTRING(date, 1, 7)
ORDER BY `month`;


WITH Monthly_Layoffs AS(

SELECT 
SUBSTRING(date, 1, 7) AS `month`, 
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY SUBSTRING(date, 1, 7)

)
SELECT 
month,
total_laid_off,
SUM(total_laid_off) OVER (
	ORDER BY month
) AS rolling_total
FROM  Monthly_Layoffs
ORDER BY month;


SELECT 
company,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 5; 


SELECT 
industry,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_laid_off DESC
LIMIT 5; 


SELECT 
company,
percentage_laid_off
FROM layoffs_staging2
WHERE percentage_laid_off IS NOT NULL
ORDER BY percentage_laid_off DESC
LIMIT 5;


SELECT
company,
YEAR(date) AS year,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY company, YEAR(date)
ORDER BY company,year;


SELECT
company,
YEAR(date) AS year,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company,YEAR(date)
ORDER BY total_laid_off DESC
LIMIT 10;


SELECT
company,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_laid_off DESC
LIMIT 10;


WITH company_Year AS(
SELECT
company,
YEAR(date) AS year,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY company, year(date)

)
SELECT company,
year,
total_laid_off,
DENSE_RANK () OVER(
PARTITION BY year
ORDER BY total_laid_off DESC)
AS des_rank
FROM company_year
ORDER BY year,des_rank;



WITH company_Year AS(
SELECT
company,
YEAR(date) AS year,
SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY company, year(date)

),
Company_Rank AS
(SELECT 
company,
year,
total_laid_off,
DENSE_RANK () OVER(
PARTITION BY year
ORDER BY total_laid_off DESC
)
AS des_rank
FROM company_year
)
SELECT *
FROM Company_Rank
WHERE des_rank <= 5
ORDER BY year, des_rank; 


SELECT 
stage,
SUM(total_laid_off) As total_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_laid_off DESC;


SELECT
company,
industry,
total_laid_off,
percentage_laid_off,
date
FROM layoffs_staging2
WHERE percentage_laid_off IS NOT NULL
ORDER BY percentage_laid_off DESC
LIMIT 10;


SELECT
COUNT(*) AS total_rows,
SUM(CASE WHEN company IS NULL THEN 1 ELSE 0 END) AS null_company,
SUM(CASE WHEN industry IS NULL THEN 1 ELSE 0 END) AS null_industry,
SUM(CASE WHEN total_laid_off IS NULL THEN 1 ELSE 0 END) AS null_total_laid_off,
SUM(CASE WHEN percentage_laid_off IS NULL THEN 1 ELSE 0 END) AS null_percentage_laid_off,
SUM(CASE WHEN company  IS NULL THEN 1 ELSE 0 END) AS null_date
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL;


SELECT DISTINCT company,industry
FROM layoffs_staging2
WHERE company = "Bally' Interactive";

SELECT company,industry
FROM layoffs_staging2
WHERE company LIKE '%Bally%';


SELECT *
FROM layoffs_staging2
WHERE company LIKE '%Bally%';


SELECT COUNT(*) AS missing_industry
FROM layoffs_staging2
WHERE industry IS NULL
OR TRIM(industry) = '';


SELECT company,industry,location,date
FROM layoffs_staging2
WHERE industry IS NULL
OR TRIM(industry) = '';

SELECT company,industry
FROM layoffs_staging2
WHERE company IN ('Airbnb','Bally''s Interactive','Carvana','Juul')
ORDER BY company;

UPDATE layoffs_staging2
SET industry = 'Travel'
WHERE company = 'Airbnb'
AND (industry IS NULL OR industry = '');

SELECT company,industry
FROM layoffs_staging2
WHERE company = 'Airbnb';

UPDATE layoffs_staging2
SET industry = 'Transportation'
WHERE company = 'Carvana'
AND (industry IS NULL OR industry = '');

UPDATE layoffs_staging2
SET industry = 'Consumer'
WHERE company = 'Juul'
AND (industry IS NULL OR industry = '');

SELECT company,industry
FROM layoffs_staging2
WHERE company LIKE '%Bally%';

SELECT 
COUNT(*) AS total_rows,
SUM(CASE WHEN industry IS NULL OR industry = ''THEN 1 ELSE 0 END)AS missing_industry
FROM layoffs_staging2;


SELECT
COUNT(*) AS total_rows,
SUM(CASE WHEN company IS NULL OR company = '' THEN 1 ELSE 0 END) AS missing_company,
SUM(CASE WHEN industry IS NULL OR industry = '' THEN 1 ELSE 0 END) AS missing_industry,
SUM(CASE WHEN total_laid_off IS NULL THEN 1 ELSE 0 END) AS missing_total_laid_off,
SUM(CASE WHEN percentage_laid_off IS NULL THEN 1 ELSE 0 END) AS missing_percentage_laid_off,
SUM(CASE WHEN date  IS NULL THEN 1 ELSE 0 END) AS missing_date
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE date IS NULL;

SELECT *
FROM layoffs_staging2
WHERE company = 'Blackbaud';

SELECT *
FROM layoffs_staging2
WHERE date IS NULL;


SELECT COUNT(*) AS missing_dates
FROM layoffs_staging2
WHERE date IS NULL;


SELECT company,industry
FROM layoffs_staging2
WHERE industry IS NULL OR industry = '';


SELECT
COUNT(*) AS total_rows,
SUM(CASE WHEN company IS NULL OR company = '' THEN 1 ELSE 0 END) AS missing_company,
SUM(CASE WHEN industry IS NULL OR industry = '' THEN 1 ELSE 0 END) AS missing_industry,
SUM(CASE WHEN total_laid_off IS NULL THEN 1 ELSE 0 END) AS missing_total_laid_off,
SUM(CASE WHEN percentage_laid_off IS NULL THEN 1 ELSE 0 END) AS missing_percentage_laid_off,
SUM(CASE WHEN date  IS NULL THEN 1 ELSE 0 END) AS missing_date
FROM layoffs_staging2;


SELECT
company,location,industry,total_laid_off,percentage_laid_off,date,
stage,country,funds_raised_millions,
COUNT(*) AS duplicate_count
FROM layoffs_staging2
GROUP BY company,location,industry,total_laid_off,percentage_laid_off,date,
stage,country,funds_raised_millions
HAVING COUNT(*) > 1;

SELECT *
FROM layoffs_staging2;




