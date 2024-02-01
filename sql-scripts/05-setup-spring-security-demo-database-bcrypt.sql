\c employee_directory;

DROP TABLE authorities;
DROP TABLE users;

--
-- Table structure for table users
--

CREATE TABLE users (
  username varchar(50) NOT NULL,
  password char(68) NOT NULL,
  enabled smallint NOT NULL,
  CONSTRAINT user_pkey PRIMARY KEY (username)
);

--
-- Inserting data for table users
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: https://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO users
(username, password, enabled) 
VALUES 
('john','{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q',1),
('mary','{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q',1),
('susan','{bcrypt}$2a$10$qeS0HEh7urweMojsnwNAR.vcXJeXR1UcMRZ2WcGQl9YeuspUdgF.q',1);


--
-- Table structure for table authorities
--

CREATE TABLE authorities (
  username varchar(50) NOT NULL,
  authority varchar(50) NOT NULL,
  CONSTRAINT authorities4_idx_1 UNIQUE (username, authority),
  CONSTRAINT authorities4_ibfk_1 FOREIGN KEY (username) REFERENCES users (username)
);

--
-- Inserting data for table authorities
--

INSERT INTO authorities
(username, authority)
VALUES 
('john','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('susan','ROLE_EMPLOYEE'),
('susan','ROLE_MANAGER'),
('susan','ROLE_ADMIN');
