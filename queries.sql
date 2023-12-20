# 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex, salary
FROM sql_challenge_table_schemata_isummers.employees
JOIN sql_challenge_table_schemata_isummers.salaries ON employees.emp_no = salaries.emp_no;

# 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM sql_challenge_table_schemata_isummers.employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

# 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.emp_no AS manager_emp_no, e.last_name AS manager_last_name, e.first_name AS manager_first_name,
       d.dept_no, d.dept_name, de.emp_no AS employee_emp_no, e.last_name AS employee_last_name, e.first_name AS employee_first_name
FROM sql_challenge_table_schemata_isummers.dept_manager dm
JOIN sql_challenge_table_schemata_isummers.departments d ON dm.dept_no = d.dept_no
JOIN sql_challenge_table_schemata_isummers.dept_emp de ON d.dept_no = de.dept_no
JOIN sql_challenge_table_schemata_isummers.employees e ON de.emp_no = e.emp_no;

# 4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no
FROM sql_challenge_table_schemata_isummers.employees e
JOIN sql_challenge_table_schemata_isummers.dept_emp de ON e.emp_no = de.emp_no
JOIN sql_challenge_table_schemata_isummers.departments d ON de.dept_no = d.dept_no;

# 5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM sql_challenge_table_schemata_isummers.employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

# 6 List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM sql_challenge_table_schemata_isummers.employees e
JOIN sql_challenge_table_schemata_isummers.dept_emp de ON e.emp_no = de.emp_no
JOIN sql_challenge_table_schemata_isummers.departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

#7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM sql_challenge_table_schemata_isummers.employees e
JOIN sql_challenge_table_schemata_isummers.dept_emp de ON e.emp_no = de.emp_no
JOIN sql_challenge_table_schemata_isummers.departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

# 8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM sql_challenge_table_schemata_isummers.employees
GROUP BY last_name
ORDER BY frequency DESC;
