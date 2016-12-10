SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS depaertments;




/* Create Tables */

CREATE TABLE depaertments
(
	department_id int(2) NOT NULL AUTO_INCREMENT,
	department_name varchar(100) NOT NULL,
	PRIMARY KEY (department_id)
);


CREATE TABLE Employees
(
	employee_id int(5) NOT NULL AUTO_INCREMENT,
	employee_name varchar(100) NOT NULL,
	employee_phone varchar(13) NOT NULL,
	employee_email varchar(100) NOT NULL,
	department_id int(2) NOT NULL,
	PRIMARY KEY (employee_id)
);



/* Create Foreign Keys */

ALTER TABLE Employees
	ADD FOREIGN KEY (department_id)
	REFERENCES depaertments (department_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



