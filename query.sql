--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- I decided to include only the current managers by using year = 9999.
SELECT  m.dept_no, m.emp_no, m.to_date, d.dept_name, e.last_name, e.first_name, e.hire_date
FROM dept_manager AS m 
INNER JOIN departments AS d ON
m.dept_no = d.dept_no
INNER JOIN employees AS e ON
m.emp_no = e.emp_no
WHERE EXTRACT(YEAR FROM m.to_date) = '9999';

--List the department of each employee with the following information: employee number, last name, first name, and department name.
--this is for current employees at their current position only
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS f ON
e.emp_no = f.emp_no
INNER JOIN departments AS d ON
d.dept_no = f.dept_no
WHERE EXTRACT(YEAR FROM f.to_date) = '9999';

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
--Current sales employees only
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS f ON
e.emp_no = f.emp_no
INNER JOIN departments AS d ON
d.dept_no = f.dept_no
WHERE d.dept_name = 'Sales' AND EXTRACT(YEAR FROM f.to_date) = '9999';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--current employees only
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS f ON
e.emp_no = f.emp_no
INNER JOIN departments AS d ON
d.dept_no = f.dept_no
WHERE d.dept_name IN ('Sales', 'Development') AND EXTRACT(YEAR FROM f.to_date) = '9999';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS freq_last_name
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;