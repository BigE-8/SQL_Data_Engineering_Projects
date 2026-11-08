# Exploratory Data Analysis w/SQL: Job Market Analysis
## HEADING 2

Normal Text  
**Bold Text**  
*Italics*  
~This is code~  
- Bullet 1  
- Bullet 2  
1. Number 1  
2. Number 2  
[link Text](https://google.com)  
![Project 1 Overview](../Images\1_1_Project1_EDA.png)  
~~~sql
SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000, 2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    optimal_score DESC
LIMIT 25;
~~~

