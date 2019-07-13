--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select employees.emp_no as "Employee Number",
employees.last_name as "Last Name",
employees.first_name as "First Name",
employees.gender as "Gender",
salaries.salary as "Salary"
from employees
join salaries on salaries.emp_no = employees.emp_no
order by employees.emp_no;

--2. List employees who were hired in 1986.

select *
from employees
where date_part('year', hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select dm.dept_no, d.dept_name, dm.emp_no,
e.last_name, e.first_name, e.hire_date, de.to_date
from dept_manager as dm
join departments as d on d.dept_no = dm.dept_no
join employees as e on e.emp_no = dm.emp_no
join dept_emp as de on de.emp_no = dm.emp_no
order by dm.dept_no;


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
join dept_emp as de on de.emp_no = e.emp_no
join departments as d on d.dept_no = de.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select *
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
join dept_emp as de on de.emp_no = e.emp_no
join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
join dept_emp as de on de.emp_no = e.emp_no
join departments as d on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or
d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) as "Count of Last Name"
from employees
group by last_name
order by count(last_name) desc;

--Epilogue

select *
from employees
where emp_no = 499942
