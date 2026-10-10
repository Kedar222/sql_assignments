 ---------------------------SQL----------------------------
-- DDL(DATA DEFINITION LANGUAGE) - CREATE, ALTER, DROP, TRUNCATE, RENAME
-- DML(DATA MANIPULATION LANGUAGE) - INSERT, UPDATE, MERGE, DELETE
-- DRL(DATA RETRIVAL LANGUAGE) - SELECT
-- DCL/TCL (DATA CONTROL LANGUAGE) - COMMIT, ROLLBACK
-- for single line comment 
/* multiple 
line 
comment*/

---------DATA TYPES IN PLSQL-----------------
/* CHARACTER DATATYPE
| Datatype          | Description                                 |
| ----------------- | ------------------------------------------- |
| CHAR(size)      | Fixed-length character data                 |
| VARCHAR2(size)  | Variable-length character data              |
| NCHAR(size)     | Fixed-length national character set         |
| NVARCHAR2(size) | Variable-length national character set      |
| LONG            | Variable-length character data (deprecated) |*/ 

/* NUMBER DATATYPE
| Datatype         | Description                         |
| ---------------- | ------------------------------------|
| NUMBER(p, s)   | General numeric datatype              |
| PLS_INTEGER    | Fastest integer type (good for loops) |
| BINARY_INTEGER | Older integer type                    |
| BINARY_FLOAT   | Single precision float                |
| BINARY_DOUBLE  | Double precision float                |*/

/* DATE DATATYPE
| Datatype                         | Description                         |
| -------------------------------- | ----------------------------------- |
| DATE                           | Stores date + time                  |
| TIMESTAMP                      | More precision (fractional seconds) |
| TIMESTAMP WITH TIME ZONE       | Timestamp + timezone                |
| TIMESTAMP WITH LOCAL TIME ZONE | Converted to DB timezone            |
| INTERVAL YEAR TO MONTH         | Time interval (Y, M)                |
| INTERVAL DAY TO SECOND         | Time interval (D, H, M, S)          |*/

/* LRGE OBJECT DATATYPE
| Datatype | Description                   |
| -------- | ----------------------------- |
| BLOB   | Binary large object           |
| CLOB   | Character large object        |
| NCLOB  | National character LOB        |
| BFILE  | Binary file stored outside DB |*/
 /* BOOLEAN
 | Datatype  | Description                                   |
| --------- | --------------------------------------------- |
| BOOLEAN | TRUE / FALSE / NULL (Only in PL/SQL, not SQL) |*/







CREATE TABLE customers (
  cust_id NUMBER,
  cust_name VARCHAR2(50),
  email VARCHAR2(50),
  city VARCHAR2(30),
  age NUMBER
);

INSERT INTO customers VALUES (1, 'Karan Mehta', 'karan@gmail.com', 'Mumbai', 28);
INSERT INTO customers VALUES (2, 'Sneha Kulkarni', 'sneha@gmail.com', 'Pune', 24);
INSERT INTO customers VALUES (3, 'Harsh Verma', 'harsh@gmail.com', 'Delhi', 32);
INSERT INTO customers VALUES (4, 'Priya Nair', 'priya@gmail.com', 'Bangalore', 29);
INSERT INTO customers VALUES (5, 'Anuj Gupta', 'anuj@gmail.com', 'Chennai', 26);
SELECT * FROM customers;    ----this is used to extract colums * means all colums, if you want you can extract particular colums as well

CREATE TABLE products (
  product_id NUMBER,
  product_name VARCHAR2(50),
  category VARCHAR2(30),
  price NUMBER(8,2),
  stock NUMBER
);

INSERT INTO products VALUES (101, 'Laptop', 'Electronics', 55000, 10);
INSERT INTO products VALUES (102, 'Chair', 'Furniture', 2500, 40);
INSERT INTO products VALUES (103, 'Mobile', 'Electronics', 30000, 25);
INSERT INTO products VALUES (104, 'Shoes', 'Fashion', 1500, 60);
INSERT INTO products VALUES (105, 'Watch', 'Accessories', 2000, 32);

SELECT * FROM products;


CREATE TABLE employees (
  emp_id NUMBER,
  name VARCHAR2(50),
  department VARCHAR2(30),
  salary NUMBER(10,2),
  join_year NUMBER
);

INSERT INTO employees VALUES (1, 'Rahul Sharma', 'IT', 55000, 2024);
INSERT INTO employees VALUES (2, 'Aditi Rao', 'HR', 48000, 2023);
INSERT INTO employees VALUES (3, 'Suresh Patil', 'Finance', 62000, 2024);
INSERT INTO employees VALUES (4, 'Neha Singh', 'Marketing', 50000, 2024);
INSERT INTO employees VALUES (5, 'Mohit Jain', 'IT', 70000, 2023);
SELECT * FROM employees;




CREATE TABLE orders (
  order_id NUMBER,
  cust_id NUMBER,
  product_id NUMBER,
  status VARCHAR2(20),
  quantity NUMBER
);

INSERT INTO orders VALUES (5001, 1, 101, 'delivered', 1);
INSERT INTO orders VALUES (5002, 2, 105, 'pending', 2);
INSERT INTO orders VALUES (5003, 3, 103, 'shipped', 1);
INSERT INTO orders VALUES (5004, 4, 102, 'delivered', 3);
INSERT INTO orders VALUES (5005, 5, 104, 'cancelled', 1);
SELECT * FROM orders;

---------------------------------------------------------------------------------------------

CREATE TABLE departments (
  dept_id NUMBER primary key,
  dept_name VARCHAR2(30),
  head VARCHAR2(50),
  total_employees NUMBER,
  location VARCHAR2(40)
);
DROP TABLE departments;
INSERT INTO departments VALUES (10, 'IT', 'Rahul Sharma', 25, 'Mumbai');
INSERT INTO departments VALUES (20, 'HR', 'Aditi Rao', 15, 'Pune');
INSERT INTO departments VALUES (30, 'Finance', 'Suresh Patil', 18, 'Delhi');
INSERT INTO departments VALUES (40, 'Marketing', 'Neha Singh', 20, 'Bangalore');
INSERT INTO departments VALUES (50, 'Operations', 'Mohit Jain', 30, 'Hyderabad');
SELECT * FROM departments;


DROP TABLE departments;             -- used for deleting table as well as structure
TRUNCATE TABLE departments;         -- used for deleting inputs but keeps the structure

ALTER TABLE departments             -- used for changing some things in the table, NO NEED OF SEMI-COLON AND THEN DO THE CHANGES
ADD contact_no NUMBER;              -- OR
ALTER TABLE departments 
ADD ( DOB DATE,
     email VARCHAR2(30)
     );       --- THIS IS USED TO ADD MULTIPLE COLUMNS
update departments 
set contact_no = 9876543210; -- TO SET CONTACT NO SAME FOR EVERYONE
-----------------------------------------------------------------------------------------------

DELETE FROM departments;    --GIVES SIMILAR RESULTS AS TRUNCATE I.E. DATA REMOVAL WITHOUT REMOVING STRUCTURE
--- DIFFERENCE BETWEEN DELETE AND TRUNCATE 
/| Feature                       | **DELETE*                                    | *TRUNCATE*                              |
| ----------------------------- | --------------------------------------------- | ----------------------------------------- |
| *Type*                      | DML (Data Manipulation Language)              | DDL (Data Definition Language)            |
| *Removes*                   | Specific rows or all rows                     | All rows only                             |
| *WHERE Clause*              | ✔ Yes, you can filter rows                    | ❌ No WHERE clause (removes everything)    |
| *Rollback*                  | ✔ YES, can be rolled back if in a transaction | ❌ NO, cannot be rolled back (auto-commit) |
| *Speed*                     | Slower                                        | Very fast                                 |
| *Space released*            | Not fully released immediately                | Fully released, resets storage            |
| *Triggers*                  | Fires DELETE triggers                         | Does NOT fire triggers                    |
| *AUTO_INCREMENT / Identity* | Does NOT reset value                          | Resets to initial value                   |
| *Locks*                     | Row-level locks                               | Table-level lock                          |
| *Used when*                 | You want selective delete                     | You want to clean a table quickly         |*/


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM HR.employees;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------CONSTRAINTS-----------------------------
-- PRIMARY KEY - VALUES SHOULD BE UNIQUE AND NOT NULL, DUPLICATE VALUES GIVE ERROR. EX- ID NUMBER PRIMARY KEY, OR PRIMARY KEY (NAME) OR NOT NULL UNIQUE
-- FOREIGN KEY
-- NOT NULL
-- UNIQUE - VALUES SHOULD BE UNIQUE AND ALSO NULL AND MULTIPLE NULLS(BEC NULL=NULL IS ALWAYS FALSE IN ORACLE) SAME AS PRIMARY BUT IT ALLOWS NULL
-- CHECK
ALTER TABLE departments
modify head not null

--FORIEGN KEY OR RELATIONAL DATABASE
CREATE TABLE STUD_INFOO
(
STUID NUMBER,
F_NAME VARCHAR2(20),
L_NAME VARCHAR2(20),
CITYS VARCHAR2(10),
PRIMARY KEY (STUID)
);
INSERT INTO STUD_INFOO VALUES(1001,'JAY','DESHMUKH','NANDED');
SELECT * FROM STUD_INFOO;

CREATE TABLE SME1
(
STUDENT_ID NUMBER NOT NULL,
SUB1 NUMBER,
SUB2 NUMBER,
SUB3 NUMBER,
SUB4 NUMBER,
FOREIGN KEY(STUDENT_ID) REFERENCES STUD_INFOO(STUID)
)
INSERT INTO SME1 VALUES(1001,56,69,85,44);
SELECT * FROM SME1;

----------------------CONSTRAINTS-----------------------------
-- PRIMARY KEY - VALUES SHOULD BE UNIQUE AND NOT NULL, DUPLICATE VALUES GIVE ERROR. EX- ID NUMBER PRIMARY KEY, OR PRIMARY KEY (NAME) OR NOT NULL UNIQUE
-- FOREIGN KEY
-- NOT NULL
-- UNIQUE - VALUES SHOULD BE UNIQUE AND ALSO NULL AND MULTIPLE NULLS(BEC NULL=NULL IS ALWAYS FALSE IN ORACLE) SAME AS PRIMARY BUT IT ALLOWS NULL
-- CHECK
ALTER TABLE departments
modify head not null

--FORIEGN KEY OR RELATIONAL DATABASE
CREATE TABLE STUD_INFOO
(
STUID NUMBER,
F_NAME VARCHAR2(20),
L_NAME VARCHAR2(20),
CITYS VARCHAR2(10),
PRIMARY KEY (STUID)
);
INSERT INTO STUD_INFOO VALUES(1001,'JAY','DESHMUKH','NANDED');
SELECT * FROM STUD_INFOO;

CREATE TABLE SME1
(
STUDENT_ID NUMBER NOT NULL,
SUB1 NUMBER,
SUB2 NUMBER,
SUB3 NUMBER,
SUB4 NUMBER,
FOREIGN KEY(STUDENT_ID) REFERENCES STUD_INFOO(STUID)
)
INSERT INTO SME1 VALUES(1001,56,69,85,44);
SELECT * FROM SME1;

--CHECK CONSTRAINT

CREATE TABLE employees (
    emp_id NUMBER,
    age NUMBER,
    salary NUMBER,
    CONSTRAINT chk_age CHECK (age >= 18),
    CONSTRAINT chk_salary CHECK (salary > 0)
);
--If the constraint is violated, Oracle throws an ORA-02290 error.
--Multiple CHECK constraints can be added to the same table.
--They ensure data integrity without needing triggers.

----------------------------------------DATE-------------------------------------------------------
SELECT SYSDATE FROM dual; -- FOR CHECKING CURRENT DATE AND TIME

CREATE TABLE employees_jay (
    emp_id NUMBER,
    name VARCHAR2(50),
    join_date DATE
);
INSERT INTO employees_jay 
(emp_id, name, join_date)
VALUES (1, 'Jay', TO_DATE('2025-12-10', 'YYYY-MM-DD')); --If you insert without using TO_DATE and write '10-12-2025', Oracle may give an error or wrong date — always use TO_DATE

INSERT INTO employees_jay (emp_id, name, join_date)
VALUES (2, 'Rohit', SYSDATE);

SELECT * FROM employees_jay;

--DATE formats--
--'DD/MM/YYYY'
--'YYYY-MM-DD'
--'DD-MON-YYYY' 
--If you put just YY it gives last two digits of the year

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MON/YYYY';  -- TO ALTER FORMAT

 

----------------------------------------------------------------------------DRL----------------------------------------------------------------------------------------------------

-- SAMPLE HR SCHEMA TABLES
SELECT * FROM HR.Employees;

SELECT * FROM HR.DEPARTMENTS;

SELECT * FROM HR.LOCATIONS;

SELECT * FROM HR.COUNTRIES;

SELECT * FROM HR.REGIONS;

DESC HR.EMPLOYEES; -- DOES NOT WORK IN PL SQL BUT IT IS USED TO CHECK THE CONSTRAINTS APPLIED ON A TABLE
-- TO CHECK CONSTRAINTS IN PLSQL CLICK ON LEFT SIDE CURRENT USERS > HR > FROM ALL THE FILES BELOW CHECK FOR TABLES > THEN DROPDOWN AND SELCT THE REQUIRED TABLE 
-- > RIGHT CLICK ON TABLE > DESCRIBE

---------------------------WHERE----------------------------------------------
SELECT * FROM HR.EMPLOYEES
where department_id = 90;   -- where clause is used for extracting certain rows based on condtions

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 90;   -- THIS CAN BE USED FOR EXTRAICTING PARTICULAR COLUMNS

DELETE FROM STUDENT
WHERE NAME = JAY;        -- WHERE CLAUSE CAN ALSO BE USED IN DELETE FUNCTION
COMMIT;         -- In Oracle SQL / PL-SQL, COMMIT is used to save permanent changes made during the current transaction.

UPDATE EMPLOYEE_DETAIL
SET EMPLOYEE_NAME = ANKITA
WHERE EMPLOYEE_ID = 1001 -- WHERE CLAUSE CAN ALSO BE USED IN UPDATE FUNCTION

SELECT ROWID FROM HR.EMPLOYEES; -- THIS IS A PSEUDO COLUMN MADE BY PLSQL FOR ALL ROWS AS ADDRESS OR UNIQUE IDENTIFICATION CODE IN 16 BIT OR HEXADECIMAL FORMAT

----------------------------OPERATORS----------------------------------------

SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID <> 90;    -----NOT EQUAL TO 90 OR != CAN ALSO BE USED

-- EXTRACT THOSE EMPLOYEES DETAILS WHOSE SALARY IS GREATER THAN 10000
SELECT * FROM HR.EMPLOYEES
WHERE SALARY > 10000;

-- EXTRACT THOSE EMPLOYEES DETAILS WHOSE DEPART ID IS 10, 60, 80
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (10,60,80); -- IF WE USE NOT IN THEN WE WILL GET ALL THE ROWS WHOSE DEPT ID IS NOT 10, 60, 80

-- FOR MULTIPLE CONDITIONS,AND
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 80
AND SALARY > 10000;      --BOTH THE CONDITIONS ARE FOLLOWED

-- OR
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 80
OR SALARY > 10000;       -- EITHER OF THE CONDITION IS FOLLOWED

--BETWEEN
SELECT * FROM HR.EMPLOYEES
WHERE HIRE_DATE BETWEEN 'TO_DATE('DD-MM-YYYY')01-01-05' AND 'TO_DATE('DD-MM-YYYY')31-12-06';         --USED FOR GETTING ALL ROWS BETWEEN TWO VALUES USE TO_DAT(FORMAT)

--- NULL
SELECT * FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;    -- NULL CAN NEVER BE USED WILL RELATIONAL OPERATORS LIKE =, !=, <, >. ONLY IS OR IS NOT CAN BE USED     

---- Homework--
1) Display only FIRST_NAME, LAST_NAME, and SALARY

SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM HR.EMPLOYEES;

----------------
2) List employees who work in department 90

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME 
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 90;

-----------------

3) Find employees with salary greater than 10,000

SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM HR.EMPLOYEES
WHERE SALARY > 10000;


-----------------------

4) Display employees hired after 01-JAN-2005

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE 
FROM HR.EMPLOYEES
WHERE HIRE_DATE > '01-JAN-2005';

---------------------------------

5)Sort employees by salary 

SELECT FIRST_NAME, LAST_NAME, SALARY 
FROM HR.EMPLOYEES
ORDER BY SALARY DESC;

----------------------------------------

---------------------------------------------------------------------------------------------------------------------------
---- FOR CREATING DIFFERENT TABLE USING SAME DATA WE USE FOLLOWING SYNTAX
CREATE TABLE hr_employees AS
SELECT * FROM hr.employees;      --- INSTEAD OF STAR WE CAN USE COLUMN NAME IF WE WANT PARTICULAR TABLES

SELECT * FROM hr_employees;


CREATE TABLE dd_employees AS
SELECT * FROM hr.employees
WHERE 1 = 1;                  ---we can add conditions to the table we create from existing one...
SELECT * FROM dd_employees;  

CREATE TABLE stru_employees AS
SELECT * FROM hr.employees
WHERE 1 = 2;          --- this condition will give blank result as 1=2 is always fale

SELECT * FROM stru_employees;

--------------------------------------------------------------------------------------------------------------------------

--DATA DICTIONARY OR META DATA

SELECT * FROM all_constraints;    --- FOR CHECKING ALL THE CONSTRAINTS APPLIED ON ALL THE TABLES IN A SCHEMA....DATA DICTIONARY OR META DATA

SELECT * FROM all_constraints
WHERE OWNER = 'HR'
AND TABLE_NAME = 'EMPLOYEES';     ---- WE CAN APPLY CONDITIONING

SELECT * FROM all_TABLES          --- ALSO PART OF DATA DICTIONARY
WHERE OWNER ='SYS';
---------------------------------------------------------------------------------------------------------------------------

-- ORDER BY CLAUSE

SELECT * FROM hr.employees
order by employee_id;      --- sorting by ascending order based on employee id

SELECT * FROM hr.employees
order by employee_id desc;  ---sorting by ascending order based on employee id

SELECT * FROM hr.employees
order by salary;

SELECT * FROM hr.employees
order by salary, employee_id;  ---first it will sort based on salary and if salary is same then on employee id

SELECT * FROM hr.employees
WHERE DEPARTMENT_ID = 50
order by salary;

-----------------------------------------------------------------------------------------------------------------------------
-- DERIVED COLUMNS OR COLUMN OPERATIONS

SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME, SALARY FROM HR.EMPLOYEES;  ---WE USE ||''|| I.E. CONCATINATION FOR COMBINING TWO COLUNMS

SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME, SALARY FROM HR.EMPLOYEES;  ---FOR RENAMING A COLUMN WE USE AS


---FOR ADDING VALUES FROM TWO TABLES
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME, SALARY, COMMISSION_PCT, SALARY + COMMISSION_PCT AS TOTAL_SALARY FROM HR.EMPLOYEES;

---IF THE VALUES OF ANY COLUMN IS NULL THEN WE CAN MATHEMATICALLY ADJUST IT TO 0 OR ANY OTHER VALUE BY USING FOLLOWING SYNTAX
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS FULL_NAME, SALARY,NVL(COMMISSION_PCT,0), SALARY + NVL(COMMISSION_PCT,0) AS TOTAL_SALARY FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, NVL(COMMISSION_PCT,0), SALARY*NVL(COMMISSION_PCT,0)/100 AS TOTAL_COMMISSION FROM HR.EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, NVL(COMMISSION_PCT,0), SALARY*NVL(COMMISSION_PCT,0)/100 AS TOTAL_COMMISSION,
SALARY + SALARY*NVL(COMMISSION_PCT,0)/100 AS TOTAL_SALARY FROM HR.EMPLOYEES;


--ROWNUM AND ROWID

SELECT ROWNUM, ROWID, EMPLOYEE_ID, FIRST_NAME,Last_name, salary from hr.employees;

-- rownum is used after fetching the results i.e. it changes but rowid is a fixed number for every row
-- rownum can be used only with less than or equal to only 

select * from hr.employees
where rownum<=10; 

select * from hr.employees
where rownum<=10
order by salary desc;      -- this will apply two conditions first is rownum less than 10 and salary in desc oreder so we will get list of only 10 people extracted from above query 

select * from hr.employees
where salary >= 9000;

-----------------------------------------------------------------------------------------------------------------------------
--- LIKE OPERATOR

-- this operator is case sensetive
-- % and __ are the two wildcards used in like operator
-- can be used with AND & OR OPERATORS

--to fetch data frm the table based on first two or any letters from a column we use following syntax  
select * from hr.employees
where first_name like 'St%';   -- we wanted data of all the people whose first name started with st

select * from hr.employees
where first_name like '%en';   -- we wanted data of all the people whose first name ended with en

select * from hr.employees
where first_name like '%ven';

select * from hr.employees
where first_name like 'St__';  --we wanted data of all the people whose first name started with St but has four letters after it i.e. four underscores

select * from hr.employees
where first_name like 'S_';  -- after S five characters

select * from hr.employees       
where first_name like 'St%'
and first_name like '%en';      -- if we wanted to apply conditions from the front as well as the back we use and 

-------------------------------------------------------------------------------------------------------------------------------
-- DISTINCT
-- we use this to extract unique output without repeating a single name or number

select distinct first_name from hr.employees;

select department_id from hr.employees;  --this will show all the department ids of all the people repeatedly

select distinct department_id, JOB_ID from hr.employees; -- here department id appears only once.....here in output blank means null0


--FUNCTIONS

--functions help us manipulate data more effectively
--types
-- string function
-- date functions
-- numeric functions
-- aggregate functions
-- analytical functions

--------------------------------------------STRING FUNCTIONS---------------------------------------------------------------------

--ASCII()  ASCII function returns the numeric value of the first character of a string. different values for capital and small and even space

select ASCII('A') from dual;               --DUAL is a dummy table used to select expressions or system values without using an actual table.
                                           -- The DUAL table is a special one-row, one-column table provided by Oracle.
select chr(65) from dual;                  -- chr is reverse of ascii

select ASCII('a') from dual; 

select ASCII(' ') from dual;

select chr(32) from dual;

select first_name, ascii(first_name) from hr.employees;     --gives ascii numbers of first letters of the name


-- CONCAT()  The CONCAT function is used to join (combine) two strings into one string.

select concat('A','BC') from dual;

select first_name, last_name, concat(first_name,last_name) from hr.employees;   -- if we want to join two or more names we can use this function

select first_name, last_name, first_name||''||last_name from hr.employees;      -- if we want to join just two names we use this function


-- INITCAP() The INITCAP function converts the first letter of each word to uppercase and the remaining letters to lowercase.

select initcap('abc') from dual;

select employee_id, first_name, last_name, email, initcap(email) from hr.employees;


-- UPPER() The UPPER function converts all characters in a string to uppercase.

select upper('abc') from dual;

select employee_id, first_name, last_name, upper(last_name) from hr.employees;


-- LOWER() The LOWER function converts all characters in a string to lowercase.

select lower('ABC') from dual;

select employee_id, first_name, last_name, lower(last_name) from hr.employees;


-- LENGTH() LENGTH function returns the total number of characters in a string.

select length('abc') from dual;

select employee_id, first_name, length(first_name) from hr.employees;


-- INSTR() The INSTR function is used to find the position of a character or substring within a string.

select instr('These is a string','is') from dual;       -- the i from is is starting from 6th position

select instr('This is a string','a') from dual;

select instr('This is a playlist','p') from dual;

select instr('This is a playlist',' ') from dual;

select instr('This is a playlist','is',1,1) from dual;      -- here 1 means position of 1st is and counting will start from left to right

select instr('This is a playlist','is',1,2) from dual;      -- here 2 means position of 2nd is 

select instr('This is a playlist','is',1,3) from dual;      -- here 3 means position of 3rd is 

select instr('This is a playlist','is',-1) from dual;        -- here counting will start from right to left so it will check position of first 'is' starting from right s0 16 


-- SUBSTR() The SUBSTR function is used to extract a part of a string from a given position of a string.

select substr('Oracle substring',1) from dual;     -- this gives full string as it is because we mentioned starting position but not how many haracters to extract

select substr('Oracle substring',1,6) from dual;   -- this gives oracle because we gave 1,6 so starting from and 6 characters to the right including 1st character
 
select substr('Oracle substring',3,8) from dual;   -- acle sub

select substr('Oracle substring',-16,8) from dual;  -- -16 is same position as 1 and 8 characters to the right

select substr('Oracle substring',-8,8) from dual;

--ex-  find what email this person is using => rahul.bhujbal369@gmail.com

select length('rahul.bhujbal369@gmail.com') from dual;    -- total 26 char

select instr('rahul.bhujbal369@gmail.com','@') from dual;

select substr('rahul.bhujbal369@gmail.com',18,10) from dual;


--LPAD() The LPAD function is used to pad (add characters) on the LEFT side of a string until it reaches a specified length.

select lpad('ABC',5,'*') from dual; 

select lpad('ABC',5,'+') from dual; 

select employee_id, first_name, lpad(first_name,10,'*') from hr.employees;


--RPAD() The RPAD function is used to pad (add characters) on the RIGHT side of a string until it reaches a specified length.

select rpad('ABC',5,'*') from dual; 

select rpad('ABC',5,'+') from dual; 

select employee_id, first_name, rpad(first_name,10,'*') from hr.employees;


-- LTRIM() The LTRIM function is used to remove characters from the LEFT side of a string.

select ltrim('  ABC') from dual;      -- it removes unwanted spaces from the left. this is used for data cleaning


-- RTRIM() The RTRIM function is used to remove characters from the RIGHT side of a string.

select rtrim('ABC    ') from dual;      -- it removes unwanted spaces from the right. this is used for data cleaning


--TRIM() The TRIM function is used to remove unwanted characters (usually spaces) from left and right of a string.

select trim('   ABC is abc    ') from dual;      -- between spaces are not removed.


-- REPLACE() The REPLACE function is used to replace a sequence of characters in a string with another string.

select replace('This is a test','is','IS') from dual;    --both 'is' are replaced by 'IS'


--REGEXP_REPLACE() it is used to replace characters by positioning 

select REGEXP_REPLACE('This is a test','is','IS',1,2) from dual;  


--TRANSLATE() The TRANSLATE function is used to replace multiple characters in a string in a one-to-one mapping.

select translate('This is a test','is','IS') from dual;  --here all the characters having i and s are converted in I and S

ascii(first_name) from hr.employees
select * from first_name


SELECT 'A-B-C-D',SUBSTR('A-B-C-D', 1, INSTR('A-B-C-D', '-', 1, 2) - 1)
       || '/'
       || SUBSTR('A-B-C-D', INSTR('A-B-C-D', '-', 1, 2) + 1) AS result
FROM DUAL;

---------------------------------------------------NUMERICAL FUNCTIONS-------------------------------------------------

-- ABS() The ABS (Absolute) function returns the absolute (positive) value of a number.It removes the negative sign if present.

select abs(-10) from dual;


-- CEIL() The CEIL (Ceiling) function returns the smallest integer greater than or equal to a given number. In simple words, it rounds a number UP.

select ceil(12.34), ceil(10.10), ceil(-10.55) from dual;


-- FLOOR() The FLOOR function returns the largest integer less than or equal to a given number. In simple words, it rounds a number DOWN.

select floor(12.34), floor(10.10), floor(-10.55) from dual;


-- ROUND() The ROUND function is used to round a number to the nearest value based on precision.

select ROUND(12.45), round(12.55), round(12.50) from dual;     --values including .50 and more will show result greater nearest number

select round(12.6789,2) from dual;    --- we used 2 to round the decimal values into just two valuse so 12.6789=> 12.68


-- TRUNC() The TRUNC (Truncate) function is used to remove the decimal part of a number without rounding.

select trunc(12.6789,2) from dual;


-- MOD() The MOD function returns the remainder after dividing one number by another.

select mod(18,5) from dual;

select * from hr.employees
where mod(employee_id,2)=0;     -- for even employee id

-- POWER() The POWER function is used to raise a number to a specified power (exponent).

select power(2,3) from dual;


-- SQRT() The SQRT function returns the square root of a given number.

select sqrt(14566) from dual;
select round(sqrt(14566))from dual;
select trunc(sqrt(14566),2)from dual;


--------------------------------------------------DATE FUNCTIONS-------------------------------------------------------------------------

select to_date('22-Dec-2025','DD-Mon-YYYY') from dual;          --ideal syntax for mentioning date
-- we need to specify format and for time 10:20:30 => HH12:MI:SS , 15:20:30 => HH24:MI:SS


-- SYSDATE is a built-in function that returns the current date and time of the database server.

select sysdate from dual;


-- CURRENT_DATE eturns the current date and time based on the user’s session time zone.

select current_date from dual;

select sysdate, current_date from dual;


-- ADD_MONTHS() The ADD_MONTHS function is used to add or subtract

select sysdate, add_months(sysdate,1) from dual;     -- sys date means current database time and 1 means we added one added one more month i.e 12-25=> 1-26 

select employee_id, first_name, salary, hire_date, add_months(hire_date,1) from hr.employees;

select employee_id, first_name, salary, hire_date, add_months(hire_date,-18) from hr.employees;


-- EXTRACT() The EXTRACT function is used to retrieve specific parts (year, month, day, hour, etc.) from a DATE

select extract(year from to_date('31-Dec-1999','DD-Mon-YYYY')) from dual;

select extract(year from to_date('31-Dec-1999 15:30:20','DD-Mon-YYYY HH24:MI:SS')) from dual;

select extract(day from to_date('31-Dec-1999 15:30:20','DD-Mon-YYYY HH24:MI:SS')) from dual;

-- extract hire month of employees

select employee_id, first_name, hire_date, extract(month from to_date(hire_date,'DD-Mon-YYYY')) from hr.employees;

-- extract name of employees hired in 3 rd month

select employee_id, first_name, hire_date, extract(month from to_date(hire_date,'DD-Mon-YYYY')) from hr.employees
where extract(month from to_date(hire_date,'DD-Mon-YYYY')) = 3;

--or

select employee_id, first_name, hire_date from hr.employees
where extract(month from to_date(hire_date,'DD-Mon-YYYY')) = 3;

--or

select employee_id, first_name, hire_date from hr.employees
where extract(month from hire_date) = 3;


-- LAST_DAY() The LAST_DAY function returns the last date of the month for a given date.

select last_day(sysdate) from dual;

select last_day(to_date('12-2-13','DD-MM-YYYY')) from dual;

select employee_id, first_name, hire_date, last_day(hire_date) from hr.employees;

-- if iw ant to find first day of the next month

select last_day(sysdate)+1 from dual;


-- NEXT_DAY The NEXT_DAY function returns the date of the next or upcoming specified weekday after a given date. 

-- IF TODAY IS SUNDAY THEN THIS FUNCTION WILL GIVE DATE OF NEXT SUNDAY
-- but for monday it will give tomorrows date i.e. upcoming day

select next_day(sysdate,'tuesday') from dual;  

select next_day(date '2001-01-04','sunday') from dual;              -- upcoming sunday after 4 jan 2001 (YYYY-MM-DD format)

select next_day(to_date('04-01-2001','DD-MM-YYYY'),'sunday') from dual;  -- if we want our date format use to_date and specify format


-- TO_CHAR() The TO_CHAR function converts DATE or NUMBER values into a formatted string. 

-- It is more flexible than to_date

select sysdate, to_char(sysdate,'DD-MON-YY') from dual;

select sysdate, to_char(sysdate,'YYYY-MM-DAY') from dual;   

select sysdate, to_date(sysdate,'YYYY-MM-DAY') from dual;   --- this will not run because to_date is not flexible as it does not corresponds with database formats



rahul.bhujbal369@gmail.com

select INSTR('rahul.bhujbal369@gmail.com','@',-1),
substr('rahul.bhujbal369@gmail.com',17,10)
from dual;

select substr('rahul.bhujbal369@gmail.com',
instr('rahul.bhujbal369@gmail.com','@')+1)
from dual;

----------------------------------SALE CUSTOMER ORDER----------------------------
-- SALESPEOPLE

create table salespeople (
  snum_pk number(4),
  sname varchar2(10),
  city varchar2(10),
  comm number(5,2)
);
select * from salespeople;

insert into salespeople values(1001,'Peel','London',0.12);
insert into salespeople values(1002,'Serres','San Jose',0.13);
insert into salespeople values(1004,'Monika','London',0.11);
insert into salespeople values(1007,'Rifkin','Barcelona',0.15);
insert into salespeople values(1003,'Axelrod','New York',0.10);
insert into salespeople values(1005,'Franc','London',0.26);

--CUSTOMERS

create table customers(
 cnum_pk number(4),
 cname varchar2(10),
 city varchar2(10),
 rating number(3),
 snum_fk number(4)
);

select * from customers;

insert into customers values(2001,'Hoffman','London',100,1001);
insert into customers values(2002,'Giovanni','Rome',200,1003);
insert into customers values(2003,'Liu','San Jose',200,1002);
insert into customers values(2004,'Grass','Berlin',300,1002);
insert into customers values(2006,'Clemens','London',100,1001);
insert into customers values(2008,'Cisneros','San Jose',300,1007);
insert into customers values(2007,'Pereira','Rome',100,1004);

--ORDERS

create table orders(
onum_pk number(4),
amt number(10,2),
odate date,
cnum_fk number(4),
snum_fk number(4)
);

select * from orders;

insert into orders values(3001,18.69,to_date('03-Oct-96 12:30','DD-Mon-YY HH24:MI'),2008,1007);
insert into orders values(3003,767.19,to_date('03-Oct-96 13:45','DD-Mon-YY HH24:MI'),2001,1001);
insert into orders values(3002,1900.10,to_date('03-Oct-96 12:05','DD-Mon-YY HH24:MI'),2007,1004);
insert into orders values(3005,5160.45,to_date('03-Oct-96 14:00','DD-Mon-YY HH24:MI'),2003,1002);
insert into orders values(3006,1098.16,to_date('03-Oct-96 13:37','DD-Mon-YY HH24:MI'),2008,1007);
insert into orders values(3009,1713.23,to_date('04-Oct-96 15:21','DD-Mon-YY HH24:MI'),2002,1003);
insert into orders values(3007,75.75,to_date('04-Oct-96 16:02','DD-Mon-YY HH24:MI'),2002,1003);
insert into orders values(3008,4723.00,to_date('05-Oct-96 12:07','DD-Mon-YY HH24:MI'),2006,1001);
insert into orders values(3010,1309.95,to_date('06-Oct-96 13:12','DD-Mon-YY HH24:MI'),2004,1002);
insert into orders values(3011,9891.88,to_date('06-Oct-96 13:09','DD-Mon-YY HH24:MI'),2006,1001);
insert into orders values(3012,3455.78,to_date('04-Oct-96 15:21','DD-Mon-YY HH24:MI'),2002,1003);
insert into orders values(3013,1245.98,to_date('04-Oct-96 16:32','DD-Mon-YY HH24:MI'),2002,1003);
insert into orders values(3014,3721.53,to_date('05-Oct-96 12:45','DD-Mon-YY HH24:MI'),2006,1001);
insert into orders values(3015,734.50,to_date('06-Oct-96 13:16','DD-Mon-YY HH24:MI'),2004,1002);
insert into orders values(3016,1729.67,to_date('06-Oct-96 13:07','DD-Mon-YY HH24:MI'),2006,1001);



-------------------------------------EMPLOYEE AND INCENTIVE-------------------------------------

-- EMPLOYEE

create table employee(
emp_id number(1),
first_name varchar2(20),
last_name varchar2(20),
salary number(10),
joining_date date,
department varchar2(15)
);

select * from employee;

insert into employee values(1,'John','Abraham',1000000,to_date('01-JAN-13','DD-MON-YY'),'Banking');
insert into employee values(2,'Michael','Clarke',800000,to_date('01-JAN-13','DD-MON-YY'),'Insurance');
insert into employee values(3,'Roy','Thomas',700000,to_date('01-FEB-13','DD-MON-YY'),'Banking');
insert into employee values(4,'Tom','Jose',600000,to_date('01-FEB-13','DD-MON-YY'),'Insurance');
insert into employee values(5,'Jerry','Pinto',650000,to_date('01-FEB-13','DD-MON-YY'),'Insurance');
insert into employee values(6,'Philip','Mathew',750000,to_date('01-JAN-13','DD-MON-YY'),'Services');

-- INCENTIVES

create table incentives(
 employee_ref_id number(2),
 incentive_date DATE,
 incentive_amount number(5)
);

select * from incentives;

insert into incentives values(1,to_date('01-Feb-13','DD-Mon-YY'),5000);
insert into incentives values(2,to_date('01-Feb-13','DD-Mon-YY'),3000);
insert into incentives values(3,to_date('01-Feb-13','DD-Mon-YY)'),4000);
insert into incentives values(1,to_date('01-Jan-13','DD-Mon-YY'),4500);
insert into incentives values(2,to_date('01-Jan-13','DD-Mon-YY'),3500); 


select* from hr.employees;

select employee_id, first_name, trim(first_name)
from hr.employees;

select instr ('This is a test','is')+4,
replace ('This is a test', 'is','IS')
from dual;

select 'A-B-C-D', instr('A-B-C-D', '-', 1, 2), SUBSTR ('A-B-C-D', 1,4) || ' --'
FROM DUAL;


select 'A-B-C-D', INSTR ('A-B-C-D', '-', 1,2), SUBSTR('A-B-C-D', 1, 3) || '/', INSTR('A-B-C-D', '-', 1, 2), SUBSTR ('A-B-C-D', 4 +1) from dual;

4A-B/4C-D

select floor(10.05), floor(10), ceil (10.40) from dual; 


select TRUNC(25.678,8) from dual;
       

----------------------------------------------------------AGGREGATE FUNCTIONS-----------------------------------------------------------------

-- AVG()
-- COUNT()
-- MAX()
-- MIN()
-- SUM()


--AVG() The AVG function is an aggregate function used to calculate the average (mean) of numeric values in a column.

select * from hr.employees;
select avg(salary) from hr.employees;


-- MIN() The MIN function is an aggregate function used to return the smallest (minimum) value in a column.

select min(salary) from hr.employees;

select * from hr.employees   ---alternateive
order by salary;


-- MAX() The MAX function is an aggregate function used to return the largest (maximum) value in a column.

select max(salary) from hr.employees;

select * from hr.employees
order by salary desc;


--SUM() The SUM function is an aggregate function used to calculate the total of numeric values in a column.

select sum(salary) from hr.employees;


-- COUNT() The COUNT function is an aggregate function used to return the number of rows.

select count(*) from hr.employees;      --when used with * it gives all the rows including null boxes

select count(commission_pct) from hr.employees;  -- it will not count rows with null boxes

select count(department_id) from hr.employees
where department_id = 100;                       -- total no. of employees from department 100

-- if you want total no. of employees from all the departments individually at the same time use group by.(department wise count)

-- GROUP BY The GROUP BY clause is used to group rows that have the same values in one or more columns and apply aggregate functions on each group.

select count(*) from hr.employees
group by department_id;

select department_id, count(*),sum(salary) from hr.employees
group by department_id;

select department_id, count(*),sum(salary), round(avg(salary),2) from hr.employees
group by department_id;

select department_id,salary, count(*),sum(salary), round(avg(salary),2) from hr.employees
group by department_id;                                                                     -- it will not show result

select department_id,salary, count(*),sum(salary), round(avg(salary),2) from hr.employees
group by department_id, salary;

select job_id, count(*) from hr.employees
group by job_id;

-- HAVING The HAVING clause is used to filter groups created by the GROUP BY clause. It works only with aggregate functions.

select department_id, count(*) as total from hr.employees
group by department_id
having count(*) > 5;               -- since we cannnot use where with count or any other aggreagte function, we have to use having clause

-- where fliter conditions can be applied on columns and having can be applied on aggregate functions

select department_id, count(*) as total from hr.employees
where department_id in (10,20,30,40,50)
group by department_id; 

select department_id, count(*) as total from hr.employees
where department_id in (10,20,30,40,50)
group by department_id
having count(*) > 5; 


---------------------------------------------SPECIAL FUNCTIONS----------------------------------------------------------------

--NVL() The NVL function is used to replace NULL values with a specified value.

select nvl(100,200) from dual;            -- if first parameter is not null then it will display first paramater

select nvl(null,200) from dual;           -- if first parameter is null then it will replace by second value

select employee_id, first_name, salary, nvl(commission_pct,0) from hr.employees;         -- it will replace all blank values with zero

select employee_id, first_name, salary, nvl(commission_pct,0), department_id, nvl(to_char(department_id),'NA')
 from hr.employees;                                 --it will replace all blank or null values with NA. since dept id is number we have to conert it into char


-- NVL2() The NVL2 function checks whether a value is NULL or NOT NULL and returns different results accordingly.

select nvl2(10,20,30) from dual;          -- it will replace first parameter with second only if first parameter is not null otherwise third

select nvl2(null,20,30) from dual;        -- since first value is null it will be replaced by third value

-- increase commission pct of employees by 0.5% if null and 1% if not null

select employee_id, first_name, commission_pct, nvl2(commission_pct,1,0.5) from hr.employees; 


--NULLIF() The NULLIF function compares two expressions and returns NULL if they are equal; otherwise, it returns the first expression.

select nullif(100,100) from dual;

select nullif(100,10) from dual;

select nullif(100, null) from dual;

select EMPLOYEE_ID, SALARY,
RANK() OVER (ORDER BY SALARY) as ranks 
from HR.employees;

SELECT EMPLOYEE_ID,
       SALARY,
       RANK() OVER (ORDER BY SALARY)
        AS ranks
FROM HR.employees
where salary <25000;


select EMPLOYEE_ID,
       SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY) AS RANKS
       FROM HR.EMPLOYEES;

 select power(50,5) from dual;
 
select sysdate, ADD_MONTHS (hire_dates, 1) FROM DUAL;

select sysdate, current_date from dual;

select extract (MONTH from to_date('11-APR-2002', 'DD-MON-YYYY')) as years from dual;

select employee_id, first_name, last_name, hire_date,
extract (MONTH FROM to_date(hire_date,'DD-MM-YYYY '))
from hr.employees
where extract (month from to_date (HIRE_DATE,'DD-MM-YYYY')) = 2;


select * from hr.employees;

select first_name, hire_date, last_day(hire_date) from hr.employees;

select last_day(sysdate + 10) from dual;

create table price(
ST_ID number ,
ST_salary number
);

insert into price values (1,100);
insert into price values (2,200);
insert into price values (3,300);

select to_char(ST_ID) as st_id , ST_salary
from price
union all
select 'sum', sum(ST_salary)
from price;

select * from hr.employees e
where department_id in(select department_id from hr.departments d
where department_name = 'IT');


select employee_id, first_name, hire_date dob, sysdate- hire_date,
21900-(sysdate-hire_date),
extract(year from (sysdate)) - extract (year from (hire_date))
from hr.employees;

select employee_id, first_name, last_name, hire_date,
trunc (sysdate- hire_date) as total_days,
trunc (months_between(sysdate, hire_date)) as total_months,
trunc (months_between(sysdate, hire_date)/12) as total_years,
trunc(21900 - (sysdate - hire_date)) as days_left,
trunc (add_months(sysdate,(21900 - (sysdate - hire_date))/12)) as retirement_date
from hr.employees;

SELECT employee_id,
       first_name,
       hire_date,
       trunc(SYSDATE - hire_date) AS total_days,
       trunc(MONTHS_BETWEEN(SYSDATE, hire_date)) AS total_months,
       trunc(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS total_years
FROM hr.employees;

select * from hr.employees;


select employee_id, first_name, Last_name,SALARY,
case
  when salary >= 10000 THEN 'Hight salary'
  when salary BETWEEN 5000 and 9999 THEN 'medium salary'
  when salary > 500  THEN 'low salary'
    else 'not specified'
    end as compare_salary
  from hr.employees;


select e.*from hr.employees e
Inner join hr.departments d
on e.department_id = d.department_ID
where d.department_name = 'IT';


select * from hr.employees;

 select * from (select first_name, last_name, salary,
  rank() over(order by salary desc) rnk,
  dense_rank() over(order by salary desc ) dens
  from hr.employees)
  --where dens = 2;


select *
from hr.employees e
full join hr.departments d
on e.department_id = d.department_id




----------------self join

select * from hr.employees;

select e.first_name,e.last_name,e.salary
from hr.employees e
inner join hr.employees m
on e.salary = m.salary
and e.employee_id <> m.employee_id
where e.salary = 17000


-------------------self join


select * from hr.employees;

select e1.employee_id, e1.first_name as emp_name, m1.manager_id, m1.first_name as manager_name 
from hr.employees e1 , hr. employees m1
where e1.employee_id = m1.manager_id;


select to_char(employee_id) as emp_id, salary from hr.employees
where employee_id in (101,102,103)

union all

select to_char ('sum'), sum(select salary from hr.employees
 where employee_id in 101, 102, 103);


emp id   salary
101        700


sum        total



