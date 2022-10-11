
WITH depTOP AS 
	(SELECT department_id, SUM(salary) AS sum_salary
	FROM employee 
	GROUP BY department_id)
SELECT depTOP.*
FROM depTOP
WHERE depTOP.sum_salary = (SELECT MAX(sum_salary) FROM depTOP);
