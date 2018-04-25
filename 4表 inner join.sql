SELECT
	course_name
FROM
	(
		SELECT 
			course_id
		FROM
			(
				SELECT
					a.id
				FROM
					(
						SELECT
							period.period,
							period.id
						FROM
							period
						INNER JOIN trainee_period ON period.id = trainee_period.period_id
						WHERE
							period.`status` = 1
					) a
				INNER JOIN trainee_period ON trainee_period.period_id = a.id
				WHERE
					trainee_period.emp_no = 'yr010'
			) b
		INNER JOIN period_course ON period_course.period_id = b.id
		WHERE
			`status` = 3
	) d
INNER JOIN course ON course.course_id = d.course_id 