
--1. List the employee number, last name, first name, sex, and salary of each employee.

--to capture all employees regardless of included salary, use left join
select 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex,
	s.salary
from employees as e inner join
	salaries as s on
	e.emp_no = s.emp_no

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
select
	e.first_name,
	e.last_name,
	e.hire_date
from employees as e
where e.hire_date between
	'1986-01-01' and '1986-12-31';
	
--3. List the manager of each department along with their department number, departm4...ent name, employee number, last name, and first name.

--to capture all departments regardless of named manager, use right join, then left join
select
	dm.dept_no,
	dp.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
from dept_manager as dm inner join
	departments as dp on
	dm.dept_no = dp.dept_no inner join
	employees as e on
	dm.emp_no = e.emp_no;
	
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.	

--to capture all employees regardless of named department use left join, then left join
select
	e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_no,
	dp.dept_name
from employees as e inner join
	dept_emp as de on
	e.emp_no = de.emp_no inner join
	departments as dp on
	de.dept_no = dp.dept_no;
	
--5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select
	first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules' and
last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
from employees as e inner join
	dept_emp as de on
	e.emp_no = de.emp_no inner join
	departments as dp on
	de.dept_no = dp.dept_no
where dp.dept_name ='Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
from employees as e inner join
	dept_emp as de on
	e.emp_no = de.emp_no inner join
	departments as dp on
	de.dept_no = dp.dept_no
where dp.dept_name ='Sales' or
	dp.dept_name = 'Development';
	
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).	
select last_name, count(*)
from employees
group by last_name
order by count desc;