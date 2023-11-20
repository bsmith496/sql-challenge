DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS sept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
	dept_no character varying(45) PRIMARY KEY,
	dept_name character varying(45) NOT NULL
);

CREATE TABLE titles (
	title_id character varying(45) PRIMARY KEY, 
	title character varying(45)
);

CREATE TABLE employees (
	emp_no character varying(45) PRIMARY KEY,
	emp_title_id character varying(45) NOT NULL,
	birth_date character varying(45) NOT NULL,
	first_name character varying(45) NOT NULL,
	last_name character varying(45) NOT NULL,
	sex character varying(45) NOT NULL,
	hire_date character varying(45) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

/* Primary key might need to just be foreign key */
CREATE TABLE salaries (
	emp_no character varying(45), 
	salary character varying(45),
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

/* Every employee is represented, might not need composite key */
CREATE TABLE dept_emp (
	emp_no character varying(45), 
	dept_no character varying(45),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no character varying(45),
	emp_no character varying(45),
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
	
	

