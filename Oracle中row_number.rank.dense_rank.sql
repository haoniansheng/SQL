SELECT
	tantou_cd,
	BUMON_CD_1
FROM
	(
		SELECT
			DENSE_RANK () OVER (
				PARTITION BY BUMON_CD_1
				ORDER BY
					YAKUSYOKU_ORDER
			) my_rank,
			A .tantou_cd,
			A .BUMON_CD_1
		FROM
			PM_TANTO_BUMON A
	)
WHERE
	my_rank = 1
AND BUMON_CD_1 IS NOT NULL


DENSE_RANK  生成序号 若重复 重复生成序号 序号永远连续
RANK        生成序号 若重复 重复生成序号 但序号不连续 而是根据重复的量  比如重复10个1 直接到11为剩下一个序号
row_number  生成序号连续不重复