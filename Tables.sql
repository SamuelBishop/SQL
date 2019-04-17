/* DROPPING ALREADY EXISTING TABLES AT THE BEGINNING */
SET foreign_key_checks=0;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS WORKS_ON;
DROP TABLE IF EXISTS DEPT_LOCATIONS;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS DEPENDENT;



/* CREATION OF TABLES */

CREATE TABLE EMPLOYEE (
    Fname varchar(20),
    Minit char,
    Lname varchar(20),
    Ssn int unique not null,
    Bdate varchar(20),
    Address varchar(40),
    Sex char,
    Salary float,
    Super_ssn long,
    Dno int,
    /*Constraints can go at the bottom like this*/
    PRIMARY KEY (Ssn),
    FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE DEPARTMENT (
    Dname varchar(20),
    Dnumber int,
    Mgr_ssn long,
    Mgr_start_date varchar(20),
    /*Constraints*/
    PRIMARY KEY (Dnumber)
);

CREATE TABLE DEPT_LOCATIONS (
    Dnumber int,
    Dlocation varchar(20),
    /*Constraints*/
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE PROJECT (
    Pname varchar(20),
    Pnumber int,
    Plocation varchar(20),
    Dnum int,
    /*Constraints*/
    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON (
    Essn int,
    Pno int,
    Hours float,
    /*Constraints*/
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
);

CREATE TABLE DEPENDENT (
    Essn int,
    Dependent_name varchar(20),
    Sex char,
    Bdate varchar(20), /*MV*/
    Relationship varchar(20),
    /*Constraints*/
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
);



/* INSERTION OF DATA */

/* EMPLOYEE TABLE */
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', '30000', '333445555', '5');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '888665555', '5');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', '25000', '987654321', '4');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Barry, Bellaire, TX', 'F', '43000', '888665555', '4');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', '380000', '333445555', '5');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', '25000', '333445555', '5');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', '25000', '987654321', '4');
INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
Values ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', '550000', 'NULL', '1');

/* DEPARTMENT TABLE */
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Research', '5', '333445555', '1988-05-22');
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Administration', '4', '9876534321', '1995-01-01');
INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Headquarters', '1', '888665555', '1981-06-19');

/* DEPT_LOCATIONS TABLE */
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES ('1', 'Houston');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES ('4', 'Stafford');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES ('5', 'Bellaire');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES ('5', 'Sugarland');
INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES ('5', 'Houston');

/* WORKS_ON TABLE */
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('123456789', '1', '32.5');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('123456789', '2', '7.5');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('666884444', '3', '40.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('453453453', '1', '20.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('453453453', '2', '20.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('333445555', '2', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('333445555', '3', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('333445555', '10', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('333445555', '20', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('999887777', '30', '30.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('999887777', '10', '10.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('987987987', '10', '35.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('987987987', '30', '5.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('987654321', '30', '20.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('987654321', '20', '15.0');
INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES ('888665555', '20', NULL);

/* PROJECT TABLE */
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('PRODUCTX', '1', 'Bellaire', '5');
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('PRODUCTY', '2', 'Sugarland', '5');
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('PRODUCTZ', '3', 'Houston', '5');
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('COMPUTERIZATION', '10', 'Stafford', '4');
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('REORGINIZATION', '20', 'Houston', '1');
INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES ('NEWBENEFITS', '30', 'Stafford', '4');

/* DEPENDENT TABLE */
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'daughter');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Theodore', 'M', '1983-10-25', 'son');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('333445555', 'Joy', 'F', '1958-05-03', 'spouse');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'spouse');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'son');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'daughter');
INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Elizabeth', 'F', '1967-05-05', 'spouse');



/* QUERIES */

/* DISPLAYING ALL INFORMATION FROM ALL TABLES */
select *
from EMPLOYEE;

select *
from DEPARTMENT;

select *
from DEPT_LOCATIONS;

select *
from PROJECT;

select *
from WORKS_ON;

select *
from DEPENDENT;

/* IMPLEMENTING THE SQL QUERIES IN EXERCISE 6.16 */

/* a) a. Retrieve the names of all employees in department 5 who work more than
   10 hours per week on the ProductX project. */
    select Fname, Minit, Lname
    from EMPLOYEE, DEPARTMENT, PROJECT, WORKS_ON
    where EMPLOYEE.Dno = DEPARTMENT.Dnumber and  PROJECT.Dnum = DEPARTMENT.Dnumber and WORKS_ON.Pno = PROJECT.Pnumber and WORKS_ON.Essn = EMPLOYEE.Ssn and
          DEPARTMENT.Dnumber = '5' and WORKS_ON.Hours > 10 and PROJECT.Pname = 'PRODUCTX';

/* b. List the names of all employees who have a dependent with the same first
    name as themselves. */
    select Fname, Minit, Lname
    from EMPLOYEE, DEPENDENT
    where EMPLOYEE.Ssn = DEPENDENT.Essn and
          EMPLOYEE.Fname = DEPENDENT.Dependent_name;

/* c. Find the names of all employees who are directly supervised by ‘Franklin
   Wong’. */
    select Fname, Minit, Lname
    from EMPLOYEE
    where EMPLOYEE.Super_ssn = (select Ssn
                                from EMPLOYEE
                                where EMPLOYEE.Fname = 'Franklin' and EMPLOYEE.Lname = 'Wong');

/* d. For each project, list the project name and the total hours per week (by all
   employees) spent on that project. */
    select Pname, SUM(Hours)
    from PROJECT, WORKS_ON
    where PROJECT.Pnumber = WORKS_ON.Pno
    group by Project.Pnumber;

/* e. Retrieve the names of all employees who work on every project. */
    select Fname, Minit, Lname
    from EMPLOYEE
    where NOT EXISTS (select Pnumber
                      from PROJECT
                      where NOT EXISTS(select *
                                       from WORKS_ON
                                       where PROJECT.Pnumber = WORKS_ON.Pno and EMPLOYEE.Ssn = WORKS_ON.Essn));

/* f. Retrieve the names of all employees who do not work on any project. */
    select Fname, Minit, Lname
    from EMPLOYEE
    where NOT EXISTS (select *
                      from WORKS_ON
                      where WORKS_ON.Essn = EMPLOYEE.Ssn);

/* g. For each department, retrieve the department name and the average salary of all
   employees working in that department. */
    select Dname, AVG(Salary)
    from DEPARTMENT, EMPLOYEE
    where DEPARTMENT.Dnumber = EMPLOYEE.Dno
    group by DEPARTMENT.Dname;

/* h. Retrieve the average salary of all female employees. */
    select AVG(Salary)
    from EMPLOYEE
    where EMPLOYEE.Sex = 'F';

/* i. Find the names and addresses of all employees who work on at least one project
   located in Houston but whose department has no location in
   Houston. */
    select Fname, Minit, Lname, Address
    from EMPLOYEE
    where exists(select *
                 from WORKS_ON, PROJECT
                 where EMPLOYEE.Ssn = WORKS_ON.Essn and WORKS_ON.Pno = PROJECT.Pnumber and PROJECT.Plocation = 'Houston')
                       and not exists(select *
                                      from DEPT_LOCATIONS
                                      where EMPLOYEE.Dno = DEPT_LOCATIONS.Dnumber and DEPT_LOCATIONS.Dlocation = 'Houston');


/* j. List the last names of all department managers who have no dependents. */
    select Lname
    from EMPLOYEE
    where exists(select *
                 from DEPARTMENT
                 where EMPLOYEE.Ssn = DEPARTMENT.Mgr_ssn) and
                 not exists(select *
                            from DEPENDENT
                            where EMPLOYEE.Ssn = DEPENDENT.Essn);



/* DROPPING EVERYTHING AT THE END */
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS WORKS_ON;
DROP TABLE IF EXISTS DEPT_LOCATIONS;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS DEPENDENT;
