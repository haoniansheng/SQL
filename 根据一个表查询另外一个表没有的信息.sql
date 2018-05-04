 
		SELECT
			emp.emp_name,
			emp.emp_no
		FROM
			(
				SELECT
					emp_no
				FROM
					trainee_period
				INNER  JOIN  period ON period.id  = trainee_period.period_id
				WHERE
					 period.`status`=1
			) a
		RIGHT  JOIN emp ON emp.emp_no  = a.emp_no
WHERE emp.role_id=4 and a.emp_no is null