\c employee_directory;

DROP TABLE users CASCADE;
DROP TABLE roles CASCADE;

--
-- Table structure for table users
--

CREATE TABLE users (
  id serial NOT NULL,
  username varchar(50) NOT NULL,
  password char(60) NOT NULL,
  enabled boolean NOT NULL,  
  first_name varchar(64) NOT NULL,
  last_name varchar(64) NOT NULL,
  email varchar(64) NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (id)
);

--
-- Dumping data for table users
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO users
(username, password, enabled, first_name, last_name, email)
VALUES 
('john','$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',true,'John', 'Doe', 'john@luv2code.com'),
('mary','$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',true,'Mary', 'Smith', 'mary@luv2code.com'),
('susan','$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',true,'Susan', 'Public', 'susan@luv2code.com');


--
-- Table structure for table roles
--

CREATE TABLE roles (
  id serial NOT NULL,
  name varchar(50) NULL,
  CONSTRAINT roles_pkey PRIMARY KEY (id)
);

--
-- Dumping data for table roles
--

INSERT INTO roles (name)
VALUES 
('ROLE_EMPLOYEE'),('ROLE_MANAGER'),('ROLE_ADMIN');

--
-- Table structure for table users_roles
--

DROP TABLE IF EXISTS users_roles;

CREATE TABLE users_roles (
  user_id int NOT NULL,
  role_id int NOT NULL,
  
  CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id),
  
  CONSTRAINT FK_USER_05 FOREIGN KEY (user_id) 
  REFERENCES users (id) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT FK_ROLE FOREIGN KEY (role_id) 
  REFERENCES roles (id) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
);

--
-- Dumping data for table users_roles
--

INSERT INTO users_roles
(user_id,role_id)
VALUES 
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3);
