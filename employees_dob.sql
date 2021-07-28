# Basic query of single table to extract all employees born between 1960 and 1922, ordered by years of service,
# indicating employees nearing retirement.

SELECT 	first_name as 'First Name', 
		last_name as 'Surname', 
        year(hire_date) as "Year Hired",
        year(birth_date) as 'Year of Birth', 
        round(datediff(hire_date,birth_date)/365.25,0) as 'Age at Hire', 
		round(datediff(CURDATE(),birth_date)/365.25) as 'Age', 
        round(datediff(CURDATE(), hire_date)/365.25,0) as 'Years Employed',
        CASE 
			WHEN round(datediff(CURDATE(),birth_date)/365.25) >= 61 THEN 'Yes'
			ELSE "No"
		END AS "Nearing Retirement",
		CASE 
			WHEN gender='M' then "Male"
			ELSE "Female"
		END AS "Gender (Full)"
FROM employees 
WHERE birth_date
	IN (select birth_date from employees where year(birth_date) > '1960' and year(birth_date) <='1965')
ORDER BY round(datediff(CURDATE(),birth_date)/365.25) desc
LIMIT 50

