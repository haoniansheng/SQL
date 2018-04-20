SELECT
	emp_name,
	b.emp_no,
	period,
	content,
	title,
	read_flag,
	update_at
FROM
	(
		SELECT
			emp.emp_name,
			emp.emp_no,
			a.period
		FROM
			(
				SELECT
					trainee_period.emp_no,
					period.period
				FROM
					period
				INNER JOIN trainee_period ON period.id = trainee_period.period_id
				WHERE
					period.leader_no = 'yr004' AND period.`status`=1
			) a
		INNER JOIN emp ON emp.emp_no = a.emp_no
	) b
INNER JOIN (
	SELECT
		emp_no,
		content,
		title,
		read_flag,
		update_at
	FROM
		daily
) c ON c.emp_no = b.emp_no