-- employee number, last name, first name, gender, and salary:
SELECT e.emp_no, last_name, first_name, gender, salary
FROM employees e
	INNER JOIN salaries s
	ON e.emp_no = s.emp_no
ORDER BY e.emp_no

-- employees who were hired in 1986:
SELECT emp_no
FROM employees
WHERE date_part('year', hire_date) = 1986
ORDER BY emp_no

-- manager of each department // with info:
SELECT
	dm.dept_no,
	dept_name,
	dm.emp_no,
	last_name,
	first_name,
	from_date,
	to_date
FROM dept_manager dm
	INNER JOIN departments d
		ON dm.dept_no = d.dept_no
	INNER JOIN employees e
		ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no, dept_name, dm.emp_no

-- department of each employee // with info
SELECT
	de.emp_no,
	last_name,
	first_name,
	dept_name
FROM dept_emp de
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	INNER JOIN employees e
		ON de.emp_no = e.emp_no
ORDER BY de.emp_no

-- all employees whose first name is "Hercules" and last names begin with "B.":
SELECT emp_no, last_name, first_name
FROM employees
WHERe first_name = 'Hercules' AND LEFT(last_name, 1) = 'B'
ORDER BY emp_no

-- employees in the Sales department // with into:
SELECT
	de.emp_no,
	last_name,
	first_name,
	dept_name
FROM dept_emp de
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	INNER JOIN employees e
		ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales'		
ORDER BY de.emp_no

-- employees in the Sales and Development departments // with info:
SELECT
	de.emp_no,
	last_name,
	first_name,
	dept_name
FROM dept_emp de
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
	INNER JOIN employees e
		ON de.emp_no = e.emp_no
WHERE dept_name IN ('Sales', 'Development')
ORDER BY de.emp_no

-- frequency count of employee last names:
SELECT last_name, COUNT(*) as ECount
FROM employees
GROUP BY last_name
ORDER BY ECount DESC