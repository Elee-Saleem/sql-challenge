-- 1
-- List the employee number, last name, first name, sex, and salary of each employee 

SELECT Employees.emp_no,
Employees.first_name, Employees.last_name, Employees.sex,
 Salaries.salary
FROM Employees
JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

-- 2
-- List the first name, last name, and hire date for the employees who were hired in 1986 

SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- 3
-- List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT Dept_Manager.dept_no, Departments.dept_name, Employees.emp_no, Employees.first_name, Employees.last_name
FROM Dept_Manager
JOIN Employees ON Dept_Manager.emp_no = Employees.emp_no
JOIN Departments ON Dept_Manager.dept_no = Departments.dept_no ;

-- 4
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT Departments.dept_no, Employees.emp_no, Employees.first_name, Employees.last_name, Departments.dept_name
FROM Employees
JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no;

-- 5
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name,sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6
-- List each employee in the Sales department, including their employee number, last name, and first name .
SELECT Employees.emp_no, Employees.first_name, Employees.last_name
FROM Employees
JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales';

-- 7 
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Departments.dept_name
FROM Employees
JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales' or Departments.dept_name = 'Development' ;

-- 8
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Frequency counts"
FROM Employees
GROUP BY last_name
ORDER BY "Frequency counts" DESC;

