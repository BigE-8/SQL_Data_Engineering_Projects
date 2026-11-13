# Exploratory Data Analysis w/SQL: Job Market Analysis

![Project 1 Overview](../Images/1_1_Project1_EDA.png)  

A SQL project analyzing the Data Analyst job market using real world job posting data. It demonstrates my ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into dat-driven insights**.  

## Executive Summary  

- **Project Scope:** Built **3 analytical queries** that answer key questions about the data analyst job market  
- **Data Modeling:** Used **multi-table joins** across fact and dimesion tables to extract insights.  
- **Analytics:** Applied **aggregations, filtering and sorting** to find top skills by demand, salary, and overall value  
- **Outcomes:** Delivered actionable insigts on SQL/PYTHON salary pattern, job postings and trends.  

1. [Top Demanded Skills](01_top_demanded_skills.sql) - demand analysis with multi-table joins.  
2. [Top Paying Skills](02_top_paying_skills.sql) - salary analysis with aggregations.  
3. [Optimal Skills](03_optimal_skills.sql) - combined demand/salary optimization query.

## Problem & Context 

Job Market Analysts need to answer questions like:  
- **Most in-demand:** *Which skills are most in-demand for Data Analysts?*  
-**Highest Paid:** *Which skills command the hightest salaries?*  
- **Best trade-off:** *What is the optimal skill set balancing demand and compensation?  

This project analyzes a **data warehouse** built using a star schema design. The warehouse structure consists of:

![Data Warehouse](../Images/1_2_Data_Warehouse.png)  

- **Fact Table:** `job_postings_fact` - Central table containing job posting details (job titles, locations, salaries, dates, etc.)  
- **Dimension Tables:**
    - `company_dim` - Company information linked to job postings.  
    - `skills_dim` - Skills catalog with skill names and types.  
- **Bridge Table:** `skills_job_dim` - Resolves the many-to-many relationship between job posings and skills.  
  
By querying across these interconnected tables, I extracted insights about skill demand, salary patterns and optimal skill combinations for data analysis roles.  

## Tech Stack  
- 🦆 **Query Engine:** DuckDB for fast OLAP-style analytical queries
- 🧮 **Language:** SQL (ANSI-style with analytical functions)
- 📊 **Data Model:** Star schema with fact + dimension + bridge tables
- 🛠 **Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- 📦 **Version Control:** Git/GitHub for versioned SQL scripts

## Analysis Overview  

### Query Structure  

1. **[Top Demanded Skills](/1_EDA/01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions  
2. **[Top Paying Skills](/1_EDA/02_top_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and demand metrics   
3. **[Optimal Skills](/1_EDA/03_most_optimal_skills.sql)** - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn

### Key Insights  

- Core Languages: SQL and Python each appear in ~15,293 job postings, making them the most demanded skills.  
- Pair Analytics with BI Tools. Adding Tableau ($95,000 median salary) or Power BI ($90,000) bridges the gap between raw data querying and business reporting, giving you the highest overall optimal score (0.59–0.60).
- Specialize to Break Six Figures. Once you have the basics, transitioning into data engineering or backend tools like Databricks ($110,000), Airflow ($114,250), PySpark ($153,026), or Go ($102,250 across 1,714 postings) is the clearest path to six-figure compensation.


## SQL Skills Demonstrated  
The Skills Demonstrated
### Query Design & Optimization  
- **Complex Joins:** Multi-table `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim`, and `skills_dim`
- **Aggregations:** `COUNT()`, `MEDIAN()`, `ROUND()` for statistical analysis
- **Filtering:** Boolean logic with WHERE clauses and multiple conditions (`job_title_short`, `job_work_from_home`, `salary_year_avg IS NOT NULL`)
- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for top-N analysis

### Data Analysis Techniques
- **Grouping:** `GROUP BY` for categorical analysis by skill
- **Mathematical Functions:** `LN()` for natural logarithm transformation to normalize demand metrics
- **Calculated Metrics:** Derived optimal score combining log-transformed demand with median salary
- **HAVING Clause:** Filtering aggregated results (skills with >= 100 postings)
- **NULL Handling:** Proper filtering of incomplete records (`salary_year_avg IS NOT NULL`)