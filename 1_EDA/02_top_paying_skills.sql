/*
Question: What are the highest-paying skills for Data Analyst?
- Calculate the median salary for each skill required in Data Analyst positions
- Focus on remote positions with specified salries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing how common
those skills are, providing a more complete picture for skill development priorities.
The median is used instead of the average to reduce the impact of outlier salaries.
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = True
GROUP BY sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;

/*
TypeScript commands the highest median salary by a massive margin at $445,000, 
while Go leads the entire dataset in job market demand with 1,714 postings. 

Key Takeaways

• Extreme Salary Outliers. TypeScript sits far above the rest at $445,000 across 132 postings, likely skewed by niche executive or senior engineering roles. 
  Perl ($158,000), PySpark ($153,026), and Kafka ($145,538) form the next highest compensation tier.

• Best Balance of Pay and Demand. Jira offers a rare combination of top-tier pay ($145,000) and heavy demand (798 postings). 
  Databricks ($110,000 across 776 postings) and Airflow ($114,250 across 552 postings) also stand out as high-value data engineering skills.

• Highest Volume Skills. Go dominates job volume with 1,714 postings at a $102,250 median salary. 
  SQL Server (1,102 postings at $100,200) and JavaScript (859 postings at $103,250) round out the top three most requested skills.

• Big Data and Core Infrastructure. Data processing tools like:
- Spark (639 postings at $102,500), DAX (544 postings at $110,000), and Hadoop (474 postings at $107,500) maintain steady six-figure demand alongside foundational systems like C ($112,850) and Linux ($112,500).
┌──────────────┬───────────────┬──────────────┐
│    skills    │ median_salary │ demand_count │
│   varchar    │    double     │    int64     │
├──────────────┼───────────────┼──────────────┤
│ typescript   │      445000.0 │          132 │
│ perl         │      158000.0 │          115 │
│ pyspark      │      153026.0 │          273 │
│ kafka        │      145538.0 │          141 │
│ zoom         │      145000.0 │          217 │
│ jira         │      145000.0 │          798 │
│ scala        │      135000.0 │          252 │
│ shell        │      117300.0 │          145 │
│ airflow      │      114250.0 │          552 │
│ c            │      112850.0 │          373 │
│ linux        │      112500.0 │          282 │
│ ssis         │      110000.0 │          444 │
│ databricks   │      110000.0 │          776 │
│ dax          │      110000.0 │          544 │
│ hadoop       │      107500.0 │          474 │
│ db2          │      106850.0 │          114 │
│ t-sql        │      106500.0 │          204 │
│ php          │      105000.0 │          136 │
│ scikit-learn │      103500.0 │          132 │
│ javascript   │      103250.0 │          859 │
│ unix         │      103000.0 │          106 │
│ spark        │      102500.0 │          639 │
│ go           │      102250.0 │         1714 │
│ confluence   │      101500.0 │          300 │
│ sql server   │      100200.0 │         1102 │
└──────────────┴───────────────┴──────────────┘
  25 rows                           3 columns

*/