CREATE DATABASE employee_directory;
\c employee_directory;

--
-- Table structure for table employee
--

CREATE TABLE employee (
  id serial NOT NULL,
  first_name varchar(45) NULL,
  last_name varchar(45) NULL,
  email varchar(45) NULL,
  CONSTRAINT employee_pkey PRIMARY KEY (id)
);

--
-- Data for table employee
--

INSERT INTO employee
	(first_name, last_name, email)
	VALUES 
	('Leslie','Andrews','leslie@luv2code.com'),
	('Emma','Baumgarten','emma@luv2code.com'),
	('Avani','Gupta','avani@luv2code.com'),
	('Yuri','Petrov','yuri@luv2code.com'),
	('Juan','Vega','juan@luv2code.com');
