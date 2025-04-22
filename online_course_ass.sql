use project;
show tables;
select * from online_course;

#How many students have enrolled in total?
SELECT COUNT(DISTINCT student_name) AS total_students FROM online_course;

#Which course has the highest number of enrollments?
SELECT course_name, COUNT(*) AS enrollments 
FROM online_course 
GROUP BY course_name 
ORDER BY enrollments DESC 
LIMIT 1;

#What is the average price paid for courses in each category?
SELECT category, AVG(price) AS avg_price 
FROM online_course 
GROUP BY category;

#List the students who have completed more than one course.
SELECT student_name, COUNT(*) AS completed_courses 
FROM online_course 
WHERE status = 'Completed' 
GROUP BY student_name 
HAVING COUNT(*) > 1;

#What is the average course duration for each status?
SELECT status, AVG(DATEDIFF(end_date, enroll_date)) AS avg_duration 
FROM online_course 
GROUP BY status;

#For each course, what percentage of enrollments were completed?
SELECT course_name,
       ROUND(SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS completion_rate
FROM online_course
GROUP BY course_name;

# Students currently enrolled but not completed:
SELECT * 
FROM online_course 
WHERE status = 'enrolled';
select * from online_course;

# Number of enrollments per course:

SELECT course_name, COUNT(*) AS total_enrollments 
FROM online_course 
GROUP BY course_name;

# Average score per course (only completed):
SELECT course_name, AVG(score) AS avg_score 
FROM online_course
WHERE status = 'completed' 
GROUP BY course_name;

#Students who scored more than 90:
SELECT * 
FROM online_course
WHERE score > 90;

# Course with the highest average score:
SELECT course_name, AVG(score) AS avg_score 
FROM online_course
WHERE course_status = 'completed' 
GROUP BY course_name 
ORDER BY avg_score DESC 
LIMIT 1;

# Course with most active enrollments:
SELECT course_name, COUNT(*) AS active_count 
FROM online_course
WHERE course_status = 'enrolled' 
GROUP BY course_name 
ORDER BY active_count DESC 
LIMIT 1;






