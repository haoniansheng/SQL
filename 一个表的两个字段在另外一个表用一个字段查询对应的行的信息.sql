SELECT
	a.emp_name AS lead_name,
	b.emp_name AS stu_name,
	week_judge.week_sco,
	week_judge.week_remark,
	week_judge.week_title,
	week_judge.create_at
FROM
	week_judge
INNER JOIN emp a ON a.emp_no = week_judge.lead_no
INNER JOIN emp b ON b.emp_no = week_judge.stu_no
WHERE
	week_judge.lead_no = 'yr005'
AND week_judge.stu_no = 'yr007'
AND week_judge.week_title = 'xxx'