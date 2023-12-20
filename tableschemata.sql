CREATE SCHEMA sql_challenge_table_schemata_isummers;

CREATE TABLE sql_challenge_table_schemata_isummers.titles (
    title_id CHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR(50)
);

CREATE TABLE sql_challenge_table_schemata_isummers.departments (
    dept_no CHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE sql_challenge_table_schemata_isummers.employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id CHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1),
    hire_date DATE NOT NULL
);

CREATE TABLE sql_challenge_table_schemata_isummers.dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES sql_challenge_table_schemata_isummers.employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES sql_challenge_table_schemata_isummers.departments(dept_no)
);

CREATE TABLE sql_challenge_table_schemata_isummers.dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES sql_challenge_table_schemata_isummers.departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES sql_challenge_table_schemata_isummers.employees(emp_no)
);

CREATE TABLE sql_challenge_table_schemata_isummers.salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES sql_challenge_table_schemata_isummers.employees(emp_no)
);
