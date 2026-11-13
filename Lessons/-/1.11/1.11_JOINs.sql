SELECT
    jpf.job_id,
    jpf.job_title_short,
    jpf.company_id,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact as jpf
RIGHT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id;