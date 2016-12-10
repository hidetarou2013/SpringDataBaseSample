SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;




/* Create Tables */

CREATE TABLE departments
(
	department_id int(2) NOT NULL,
	department_name varchar(100) NOT NULL,
	PRIMARY KEY (department_id)
);


CREATE TABLE employees
(
	employee_id int(5) NOT NULL AUTO_INCREMENT,
	employee_name varchar(100) NOT NULL,
	employee_phone varchar(13) NOT NULL,
	employee_email varchar(100) NOT NULL,
	department_id int(2) NOT NULL,
	PRIMARY KEY (employee_id)
);



/* Create Foreign Keys */

ALTER TABLE employees
	ADD FOREIGN KEY (department_id)
	REFERENCES departments (department_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



