/*
Question: What are the most optimal skills for Data Analyst-balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Analyst positions with specified annual salaries.
- Why? This approach highlights skills that balance market demand and financial reward. it weighs core skills
appropriately, rather than letting rare, outlier skills distort the results.
*/

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
    jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    optimal_score DESC
LIMIT 25;

SELECT LN(0);

/*
SQL is the most optimal skill overall, scoring 0.60 due to having the highest market demand at 783 postings alongside a solid $90,000 median salary. 

Key Takeaways

• Top Overall Value. SQL leads the ranking with an optimal score of 0.60, driven by unmatched job volume (783 postings). 
  Tableau follows closely in second at 0.59, offering the highest median salary on the list ($95,000) paired with strong demand (505 postings).

• Core Programming Tier. Python ranks third with a 0.56 score ($90,000 salary and 494 postings). 
  R and Power BI tie right below it at 0.51, delivering comparable salaries near $90,000 but with noticeably lower job demand (289 and 293 postings).

• High Demand vs. Lower Pay. Excel maintains strong market demand (441 postings) 
  but ties at a 0.51 optimal score because it carries the lowest median salary in the group at $83,500.
  
• Niche Tools. SAS (0.46) and Looker (0.42) sit at the bottom of the list, 
  offering respectable pay ($85,900 and $87,500) but significantly fewer job openings (220 and 117 postings).

┌──────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│  skills  │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│ varchar  │    double     │    int64     │     double      │    double     │
├──────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ sql      │       90000.0 │          783 │             6.7 │           0.6 │
│ tableau  │       95000.0 │          505 │             6.2 │          0.59 │
│ python   │       90000.0 │          494 │             6.2 │          0.56 │
│ r        │       89796.0 │          289 │             5.7 │          0.51 │
│ power bi │       90000.0 │          293 │             5.7 │          0.51 │
│ excel    │       83500.0 │          441 │             6.1 │          0.51 │
│ sas      │       85900.0 │          220 │             5.4 │          0.46 │
│ looker   │       87500.0 │          117 │             4.8 │          0.42 │
└──────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
*/
