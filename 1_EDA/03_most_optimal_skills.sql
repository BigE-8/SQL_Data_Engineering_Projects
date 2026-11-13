/*
Question: What are the most optimal skills for data engineers-balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
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
    jpf.job_title_short = 'Data Engineer'
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
Top Skills by Optimal Score:
- Terraform leads the list with a $184k median salary and 193 postings, resulting in the highest overall "optimal score"
- Python and SQL dominate demand (over 1100 postings each), with strong median salaries of $135k and $130k, respectively
- AWS (783 postings, $137k median), Spark (503 postings, $140k median), and Airflow (386 postings, $160k median)
- Kafka offers high compensation ($145k medan) and solid demand (292 postings).
- Tools like Snowflakes, Azure, and Databricks each have 250-475 postings and median salaries betweens $128-$137k.

DevOps & Engineering Tools:
- Airflow ($150K), Kubernetes ($150.5K), and Docker ($135K) stand out for their mix of demand and top median salaries.
- Git ($140K/208 postings) and Github ($135K/127 postings) have broad utility and competitive compensation.

Noteworthy Languages:
- Java (303 postings, $135K median) and Scala (247 postings, $137K median) remain strong choices for well-paid data engineering roles.
- Go ($140K/113 postings) is another programming language with excellent compensation.

Databases & Cloud:
- Redshift ($130K/274 postings), GCP ($136K/196 postings), Hadoop ($135K/198 postings), NoSQL ($134.4K/193 postings), and MongoDB ($135.8K/136 postings) add to a well-rounded data engineering skill set.
- R, Pyspark, and BigQuery each deliver competitive salaries and meet the threshold for demand.

Summary:
Skills that consistently appear near the top balance a strong combination of market demand (job security) and financial benefit. Python, SQL, AWS, Spark, Airflow, and Terraform are particularly strategic for both immediate opportunities and longer-term career growth in data engineering.

*/
