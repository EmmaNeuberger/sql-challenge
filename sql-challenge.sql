 
CREATE TABLE departments(
dept_no VARCHAR,
dept_name VARCHAR);

CREATE TABLE dept_emp(
emp_no VARCHAR ,
dept_no VARCHAR ,
from_date VARCHAR,
to_date VARCHAR);

CREATE TABLE dept_manager(
dept_no VARCHAR ,
emp_no VARCHAR ,
from_date VARCHAR,
to_date VARCHAR);

CREATE TABLE employees(
emp_no VARCHAR ,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
gender VARCHAR,
hire_date VARCHAR);

CREATE TABLE salaries(
emp_no VARCHAR ,
salary INT ,
from_date VARCHAR,
to_date VARCHAR);

CREATE TABLE titles(
emp_no VARCHAR,
title VARCHAR,
from_date VARCHAR,
to_date VARCHAR);


-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender, 
salaries.salary
FROM employees
JOIN salaries ON
employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE hire_date = '1986%';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
--employees, departments, dept_manager
SELECT dept_manager.dept_no, 
dept_manager.from_date,
dept_manager.to_date,
dept_manager.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM dept_manager
JOIN employees
ON dept_manager.emp_no = employees.emp_no
  JOIN departments
  ON dept_manager.dept_no = departments.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.first_name,
employees.last_name,
dept_emp.emp_no,
departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
	JOIN departments ON
	dept_emp.dept_no = departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--departments, employees
SELECT employees.last_name,
employees.first_name,
dept_emp.emp_no,
departments.dept_name
FROM employees
JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
	JOIN departments ON
	departments.dept_no = dept_emp.dept_no
	WHERE departments.dept_name = “Sales”;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--departments, employees
SELECT employees.last_name,
employees.first_name,
dept_emp.emp_no,
departments.dept_name
FROM employees
JOIN dept_emp ON
dept_emp.emp_no = employees.emp_no
	JOIN departments ON
	departments.dept_no = dept_emp.dept_no;
	WHERE departments.dept_name = “Development”;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--employees
SELECT last_name, count(last_name)
AS last_name_freq
FROM employees
GROUP BY last_name
ORDER BY last_name_freq DESC;
