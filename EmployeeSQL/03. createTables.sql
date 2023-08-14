--Drop Tables if Existing--------------------------------------------------------------------------
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Creating Tables----------------------------------------------------------------------------------

--Step01 create table------------------------------------------------------------------------------
CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
--Step02 import related csv file using pgAdmin "tables > Import/Export and so on..."
--Step03 view table
SELECT * FROM titles;

--Step04 create table------------------------------------------------------------------------------
CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);
--Step05 import related csv file using pgAdmin "tables > Import/Export and so on..."
--Step06 view table
SELECT * FROM departments;


--Step07 create table------------------------------------------------------------------------------
CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,     -- [MM-DD-YYYY] 10character max
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

--Step08 import related csv file using pgAdmin "tables > Import/Export and so on..."
--Step09 view table
SELECT * FROM employees;


--Step10 create table------------------------------------------------------------------------------
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INTEGER   NOT NULL
);
--Step11 import related csv file using pgAdmin "tables > Import/Export and so on..."
--Step12 view table
SELECT * FROM dept_manager;


--Step13 create table------------------------------------------------------------------------------
CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);
--Step14 import related csv file using pgAdmin "tables > Import/Export and so on..."
--Step15 view table
SELECT * FROM salaries;


--Step14 create table------------------------------------------------------------------------------
CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL
);
--Step15 import related csv file using pgAdmin "tables > Import/Export and so on..."
--Step16 view table
SELECT * FROM dept_emp;


--Step17 assign fk with reference to another table-------------------------------------------------
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

