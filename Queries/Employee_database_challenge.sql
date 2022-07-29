SELECT  e.emp_no,
	e.first_name,
	e.last_name,
	--e.birth_date,
	tl.title,
	tl.from_date,
	tl.to_date
INTO retirement_titles
FROM employees as e
inner join titles as tl 
on (e.emp_no = tl.emp_no)
WHERE (e.birth_date between '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

select count(title), title
into retiring_titles
from unique_titles
group by title 
order by count desc

select distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tl.title
into mentor_eligibilty
from employees as e
inner join dept_employees as de
on (e.emp_no = de.emp_no)
inner join titles as tl
on (e.emp_no =tl.emp_no)
where de.to_date = '9999-01-01' and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no asc