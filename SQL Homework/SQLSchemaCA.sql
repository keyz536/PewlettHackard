DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE employees;
DROP TABLE dept_manager;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE departments
(
dept_no varchar(10) primary key,
	dept_name varchar(50)
);

CREATE TABLE employees
(
emp_no int primary key,
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	gender varchar(1),
	hire_date date
);

CREATE TABLE dept_emp
(
emp_no int,
	dept_no varchar(10),
	from_date date,
	to_date date,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
); 


CREATE TABLE dept_manager
(
dept_no varchar(10),
	emp_no int,
	from_date date,
	to_date date,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees(emp_no)
);

CREATE TABLE salaries
(
emp_no int,
	salary int,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees (emp_no)
);

CREATE TABLE titles
(
emp_no int,
	title varchar(50),
	from_date date,
	to_date date,
	foreign key (emp_no) references employees (emp_no)
);