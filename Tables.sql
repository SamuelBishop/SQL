SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS WORKS_ON;
DROP TABLE IF EXISTS DEPT_LOCATIONS;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS DEPENDENT;
/* TABLES */
/* NOTE: We need the primary and foreign key constraints */
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
Values ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', '30000', '3334445555', '5');
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
VALUES ('5', 'Houston1');


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

/* SELECTING THE ENTIRE TABLE THINGIE */
select *
from EMPLOYEE;
#      DEPARTMENT, DEPT_LOCATIONS, PROJECT, WORKS_ON, DEPENDENT

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