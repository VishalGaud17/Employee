
# Employee Data Analysis

SELECT * 
FROM emp;

CREATE TABLE emp_staging 
LIKE emp;

INSERT emp_staging
SELECT * FROM emp;

SELECT * 
FROM emp_staging;

# Q. How many employees are in each department?

	SELECT 
		Department, count(*) count
	FROM emp_staging
	GROUP BY Department
	ORDER BY count desc;
    
# Q. What is the average salary in each department?

	SELECT 
		Department, avg(Annual_Salary) avg_annual_salary
	FROM emp_staging
	GROUP BY Department
	ORDER BY avg_annual_salary desc;

# Q. Who are the top 5 highest-paid employees in the company?

	WITH top_5_highest_paid_employee AS 
	(
		SELECT
			DENSE_RANK()
			OVER(ORDER BY Annual_Salary desc) ranking,
			First_Name, Last_Name, Department, Annual_Salary
		FROM emp_staging
	)
	SELECT * 
	FROM top_5_highest_paid_employee
	WHERE ranking <=5;

# Q. What is the salary range (min, max, average) by job title?

	SELECT 
		Department, 
		min(Annual_Salary) min_annual_salary, 
		avg(Annual_Salary) avg_annual_salary, 
		max(Annual_Salary) max_annual_salary
	FROM emp_staging
	GROUP BY Department
	ORDER BY avg_annual_salary desc;
    
# Q. How many employees were hired in each year?

	SELECT 
		year(start_date) `year`, count(*)
	FROM emp_staging
	GROUP BY `year`
	ORDER BY `year`;

# Q. What is the hiring trend across departments?

	SELECT 
		Department, count(*) count
	FROM emp_staging
    GROUP BY Department
    ORDER BY count desc;
    
# Q. What is the gender ratio in the company?

	SELECT 
		Gender, count(*) count
    FROM emp_staging
    GROUP BY Gender;
    
# Q.  How does average salary differ between genders in each department?

	WITH avg_annual_by_dept_male AS
	(
		SELECT 
			Department, avg(Annual_Salary) avg_sal_male
		FROM emp_staging
		WHERE Gender = 'Male'
		GROUP BY Department
	),avg_annual_by_dept_female AS
	(
		SELECT 
			Department, avg(Annual_Salary) avg_sal_female
		FROM emp_staging
		WHERE Gender = 'Female'
		GROUP BY Department
	)
	SELECT male.Department, avg_sal_male, avg_sal_female 
	FROM avg_annual_by_dept_male AS male
	JOIN avg_annual_by_dept_female AS female
	ON male.Department = female.Department
	ORDER BY male.department;
    
    
	SELECT 
		Department,
		AVG(
			CASE 
			WHEN Gender = 'Male' 
			THEN Annual_Salary 
			END
			) AS avg_sal_male,
		AVG(
			CASE 
			WHEN Gender = 'Female' 
			THEN Annual_Salary 
			END
			) AS avg_sal_female
	FROM emp_staging
	GROUP BY Department
	ORDER BY Department;
  
# Q. Which department has the highest total salary expense?

	SELECT Department, 
		sum(Annual_Salary) total_salary_expense,
		count(*)
	FROM emp_staging
	GROUP BY Department
	ORDER BY total_salary_expense desc;

# Q. What is the average tenure of employees in each department?

	SELECT Department, avg(`Years`) avg_tenure_in_years
	FROM emp_staging
	GROUP BY Department
	ORDER BY avg_tenure_in_years desc;

# Q. What is the average performance score by department?

	SELECT Department, avg(Job_Rate) `out of 5`
	FROM emp_staging
	GROUP BY Department
	ORDER BY `out of 5` desc;

# Q. Which employees have the highest performance scores, and what are their roles?

	SELECT 
		First_Name, Last_Name, Department, Job_Rate
	FROM emp_staging
	WHERE Job_Rate = 5;

# Q. How many employees are working in each location?

	SELECT 
		Country, count(*) employees
	FROM emp_staging
	GROUP BY Country
	ORDER BY employees desc;

# Q. What is the average salary by location?

	SELECT 
		Country, avg(Annual_Salary) avg_salary
	FROM emp_staging
	GROUP BY Country
	ORDER BY avg_salary desc;
    
# Q. Which employees are in the top 10% salary bracket?

WITH top_10_percent_salary AS
(
	SELECT 
		First_Name, Last_Name, Annual_Salary,
		PERCENT_RANK()
		OVER(ORDER BY Annual_Salary desc) salary_percentile
	FROM emp_staging
)
SELECT First_Name, Last_Name, Annual_Salary
FROM top_10_percent_salary
WHERE salary_percentile <= 0.10;

# Q.  Write a query to retrieve all employees in the "IT" department using this view.

	CREATE VIEW IT_employees AS
		SELECT *
		FROM emp_staging
		WHERE Department = 'IT';
        
	SELECT * 
    FROM IT_employees;

# Q. Which employees have a tenure of more than 10 years?

SELECT First_Name, Last_Name,Department , Years
FROM emp_staging
WHERE Years = 
	(SELECT max(Years) FROM emp_staging);

# Q. Retrieve all employees working in "UAE" using this view.

	CREATE VIEW UAE_employee AS
		SELECT * 
		FROM emp_staging
		WHERE Country = 'United Arab Emirates';
    
    SELECT * 
    FROM UAE_employee;



SELECT * 
FROM emp_staging;
