# Employee Data Analysis

This project involves the analysis of employee data using SQL. The dataset contains employee information such as names, departments, salaries, hire dates, performance scores, tenure, and more. The goal is to derive meaningful insights and trends from the dataset, which can assist in organizational decision-making.

## Project Structure

1. **Data Preparation**
   - The initial employee data is loaded into the `emp` table.
   - A staging table `emp_staging` is created to ensure data integrity during analysis.

2. **Key Analysis Questions and Insights**

### Employee Distribution
- **How many employees are in each department?**
  - Provides a breakdown of employee counts across departments.

### Salary Analysis
- **What is the average salary in each department?**
  - Analyzes the average annual salary by department.
- **Who are the top 5 highest-paid employees?**
  - Identifies the top earners in the company.
- **What is the salary range (min, max, average) by job title?**
  - Provides salary insights at a more granular level.
- **Which employees are in the top 10% salary bracket?**
  - Highlights employees earning in the top 10% of salaries.
- **What is the average salary by location?**
  - Compares salaries across different locations.

### Hiring and Tenure Trends
- **How many employees were hired in each year?**
  - Tracks hiring trends over time.
- **What is the hiring trend across departments?**
  - Examines which departments have seen the most hiring activity.
- **What is the average tenure of employees in each department?**
  - Calculates the average length of service in each department.

### Performance and Gender Analysis
- **What is the average performance score by department?**
  - Analyzes departmental performance trends.
- **How does average salary differ between genders in each department?**
  - Examines potential salary disparities based on gender.
- **Which employees have the highest performance scores, and what are their roles?**
  - Lists top-performing employees and their roles.
- **What is the gender ratio in the company?**
  - Provides an overview of gender distribution.

### Location Analysis
- **How many employees are working in each location?**
  - Provides a breakdown of employee distribution by location.
- **Retrieve all employees working in "UAE."**
  - Creates a view for employees in the United Arab Emirates.

3. **Views Creation**
   - Created views such as `IT_employees` and `UAE_employee` to simplify access to specific subsets of data.

## Tools and Techniques
- **SQL Queries**: Used for data exploration, aggregation, and transformation.
- **Window Functions**: Employed for ranking and calculating percentiles.
- **Common Table Expressions (CTEs)**: Used for modular and readable query design.

## Insights Gained
- Identified departments with the highest and lowest employee counts.
- Highlighted salary disparities across departments and genders.
- Analyzed hiring trends to identify growth areas.
- Recognized high-performing employees for potential reward programs.
- Provided location-based insights to aid in resource allocation.

## How to Use
1. Clone the repository.
2. Load the provided dataset into a SQL database.
3. Execute the provided SQL scripts to create the staging table, views, and run queries.
4. Analyze the output for actionable insights.

## Repository Contents
- **SQL Scripts**: Contains all the SQL queries used for analysis.
- **Dataset**: Employee data in a CSV format.
- **README**: Documentation of the project.
