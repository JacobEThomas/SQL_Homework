DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE employees (
    emp_no int NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    gender varchar(50) NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no varchar(50) NOT NULL,
    dept_name varchar(50) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar(50) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);

CREATE TABLE dept_manager (
    dept_no varchar(50) NOT NULL,
    emp_no int NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    from_date date NOT NULL,
    do_date date NOT NULL
);

CREATE TABLE titles (
    emp_no int NOT NULL,
    titles varchar(50) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_eo FOREIGN KEY(dept_eo)
REFERENCES Departments (Dept_No);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);