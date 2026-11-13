/*
Question: What are the most in-demand skills for Data Analyst?
- Identify the top 10 in-demand skills for Data Analyst
- Focus on remote job postings
- Why? Retrieves the top 1o skills with the highest demand in 
the remote job market, providing insights into the most valuable 
skills for data engineers seeking remote work
*/

SELECT 
    sd.skills,
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
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
Here's the breakdown of the most demanded skills for Data Analyst:
SQL dominates the job market by a wide margin with 15,293 postings, appearing in more than 1.5 times as many listings as the second-ranked skill.
Key Takeaways

• The Undisputed Leader. SQL (15,293 postings) sits comfortably at the top, proving it is the foundational requirement across data roles.
• The Core Analytics Tier. Python (9,973), Excel (9,274), and Tableau (8,213) form a tight second tier, each appearing in roughly 8,000 to 10,000 job postings.
• Business Intelligence and Statistics. Power BI (5,946) trails Tableau by over 2,200 postings, followed by statistical programming languages R (4,714) and SAS (3,430).
• Secondary and Cloud Tools. Looker (2,153), Go (1,714), and AWS (1,658) round out the top 10, showing noticeably lower volume compared to core querying and spreadsheet tools.
 
┌──────────┬──────────────┐
│  skills  │ demand_count │
│ varchar  │    int64     │
├──────────┼──────────────┤
│ sql      │        15293 │
│ python   │         9973 │
│ excel    │         9274 │
│ tableau  │         8213 │
│ power bi │         5946 │
│ r        │         4714 │
│ sas      │         3430 │
│ looker   │         2153 │
│ go       │         1714 │
│ aws      │         1658 │
└──────────┴──────────────┘
  10 rows       2 columns
*/