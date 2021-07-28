select 	first_name as 'First Name', 
		last_name as 'Surname', 
        year(hire_date) as "Year Hired",
        round(datediff(hire_date,birth_date)/365.25,0) as 'Age at Hire', 
		round(datediff(CURDATE(),birth_date)/365.25) as 'Age', 
        round(datediff(CURDATE(), hire_date)/365.25,0) as 'Years Employed',
case 
	when gender='M' then "Male"
	else "Female"
end as "Gender (Full)"
from employees 
where gender
	in (select gender from employees where year(birth_date) > '1960' and year(birth_date) < '1980')
order by hire_date

