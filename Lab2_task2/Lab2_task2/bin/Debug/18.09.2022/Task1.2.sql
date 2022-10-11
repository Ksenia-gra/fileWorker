
SELECT d.*
FROM employee e INNER JOIN department d ON e.department_id=d.id
WHERE salary=(SELECT MAX(salary) FROM employee)