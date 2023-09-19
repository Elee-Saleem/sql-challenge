
--
-- Name: GenderEnum; Type: TYPE; Schema: public; Owner: postgres
-- Create GenderEnum so that only valid genders can be entered

CREATE TYPE GenderEnum AS ENUM (
   'M','F'
);

ALTER TYPE GenderEnum OWNER TO postgres;


-- Create a new table named titles with title id as primary key and title.
CREATE TABLE "Titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

-- Create a new table named Employees with emp_no as primary key and emp_title_id as foreign key.
CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" GenderEnum DEFAULT 'M'::GenderEnum,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
    ),
    FOREIGN KEY ("emp_title_id") REFERENCES "Titles" ("title_id")
);

-- Create a new table named Salaries with emp_no as primary key and salary column.
CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
    ),
    FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no")
);

-- Create a new table named Departments with dept_no as primary key and dept_name column.
CREATE TABLE "Departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
    )
);

-- Create a new table named Dept_Manager with dept_no and emp_no as composite primary key.
CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "dept_no","emp_no"
    ),
    FOREIGN KEY ("dept_no") REFERENCES "Departments" ("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no")
);


-- Create a new table named Dept_Emp with dept_no and emp_no as composite primary key.
CREATE TABLE "Dept_Emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "emp_no","dept_no"
    ),
    FOREIGN KEY ("dept_no") REFERENCES "Departments" ("dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES "Employees" ("emp_no")
);

