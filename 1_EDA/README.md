# Exploratory Data Analysis w/SQL: Job Market Analysis

![Project 1 Overview](../Images\1_1_Project1_EDA.png)  

A SQL project analyzing the data engineer job market using real world job posting data. It demonstrates my ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into dat-driven insights**.  

## Executive Summary  

[Top Demanded Skills](01_top_demanded_skills.sql)

## Problem & Context 

![Data Warehouse](../Images/1_2_Data_Warehouse.png)  

- **Fact Table:** `job_postings_fact` - Central table containing job posting details (job titles, locations, salaries, dates, etc.)

## Tech Stack  

- 🛠 **Development:** VS Code for SQL editing + Terminal for DuckDB CLI

## Analysis Overview  

### Query Structure  

1. **[Top Demanded Skills](/1_EDA/01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions  
2. **[Top Paying Skills](/1_EDA/02_top_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and demand metrics   
3. **[Optimal Skills](/1_EDA/03_most_optimal_skills.sql)** - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn

### Key Insights  

- Core Languages: SQL and Python each apper in ~29,000 job postings, making them the most demanded skills.  
- Cloud Platforms: AWS and Azure are critical for modern data engineering roles.  
- Infra & tooling: Kubernetes, Docker and Terraform are associated with premium salaries.  
- Big data tools: Apache Spark shows strong demand with competitife compensation.


## SQL Skills Demonstrated  

### Query Design & Optimization  

### Data Analysis Techniques