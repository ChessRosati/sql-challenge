CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" VARCHAR   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" VARCHAR   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
	"hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL,
    "salary" VARCHAR   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


SELECT * FROM employees;

-- Question #1
SELECT salary, salaries.emp_no, first_name, last_name, sex  FROM salaries, employees WHERE  salaries.emp_no = employees.emp_no

-- Question #2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'

-- Question #3
SELECT dept_manager.emp_no, dept_manager.dept_no, dept_name, first_name, last_name  FROM departments, employees, dept_manager WHERE  dept_manager.emp_no = employees.emp_no and dept_manager.dept_no = departments.dept_no

-- Question #4
SELECT employees.emp_no, dept_name, first_name, last_name  FROM departments, employees, dept_emp WHERE  dept_emp.emp_no = employees.emp_no and dept_emp.dept_no = departments.dept_no

-- Question #5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%'

-- Question #6
SELECT employees.emp_no, dept_name, first_name, last_name  FROM departments, employees, dept_emp WHERE  dept_emp.emp_no = employees.emp_no and dept_emp.dept_no = departments.dept_no and dept_name = 'Sales'

-- Question #7
SELECT employees.emp_no, dept_name, first_name, last_name  FROM departments, employees, dept_emp WHERE  dept_emp.emp_no = employees.emp_no and dept_emp.dept_no = departments.dept_no and dept_name IN ('Sales', 'Development')

-- Question #8
SELECT last_name, COUNT(*) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC