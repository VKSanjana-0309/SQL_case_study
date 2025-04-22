create database Project;
use project;

show tables;
select * from pcos_rotterdam_balanceado;

# Get all records from the dataset.
select *from pcos_rotterdam_balanceado;

#2. Count total number of patients.
select count(*) as total_no_of_assignment from pcos_rotterdam_balanceado;

#3. Find the average BMI of patients.
select avg(BMI) as avg_BMI from pcos_rotterdam_balanceado;

#How many patients have irregular menstruation?
select count(*) as no_irregular_menstruvation from pcos_rotterdam_balanceado where Menstrual_Irregularity =1;

#Find average testosterone level for diagnosed vs non-diagnosed patients.
select * from pcos_rotterdam_balanceado;
select PCOS_Diagnosis,avg('Testosterone_Level(ng/dL)') as avg_testosterone_level from pcos_rotterdam_balanceado group by PCOS_Diagnosis; 

#Show BMI category
select * from pcos_rotterdam_balanceado;
select Age,BMI,
 case 
  when BMI <13 then 'Underweight'
  when BMI between 13 AND 24 then 'Normal'
  when BMI between 25 AND 30 then 'Overweight'
  else 'Obese'
END as BMI_category
from pcos_rotterdam_balanceado; 

SELECT Age, BMI,
  CASE 
    WHEN BMI < 18.5 THEN 'Underweight'
    WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
  END AS BMI_Category
FROM pcos_rotterdam_balanceado; 

#Count how many patients are in each BMI category.
select * from pcos_rotterdam_balanceado;
select BMI_Category, count(*) as count
from 
(select CASE 
    WHEN BMI < 18.5 THEN 'Underweight'
    WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
  END AS BMI_Category
FROM pcos_rotterdam_balanceado) as BMI_table group by BMI_Category;

#What is the average antral follicle count grouped by menstrual irregularity?
select * from pcos_rotterdam_balanceado;
select Menstrual_Irregularity ,avg(Antral_Follicle_Count) as avg_count from pcos_rotterdam_balanceado group by Menstrual_Irregularity;

#Find the top 5 highest testosterone levels.
select * from pcos_rotterdam_balanceado order by 'Testosterone_Level(ng/dL)' desc limit 5; 

#Correlation check approximation using SQL (not exact, but indicative).
SELECT 
  ROUND(CORR(BMI, "Testosterone_Level(ng/dL)"), 2) AS corr_bmi_testosterone,
  ROUND(CORR(BMI, Antral_Follicle_Count), 2) AS corr_bmi_follicles
FROM pcos_rotterdam_balanceado;

