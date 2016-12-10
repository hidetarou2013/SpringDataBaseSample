DROP TABLE IF EXISTS spring_database.employees;
DROP TABLE IF EXISTS spring_database.departments;

/**********************************/
/* テーブル名: 部署テーブル */
/**********************************/
CREATE TABLE spring_database.departments(
		department_id                 		INT(2)		 NOT NULL COMMENT 'department_id',
		department_name               		VARCHAR(100)		 NOT NULL COMMENT 'department_name'
) COMMENT='部署テーブル';

/**********************************/
/* テーブル名: 従業員テーブル */
/**********************************/
CREATE TABLE spring_database.employees(
		employee_id                   		INT(5)		 NOT NULL AUTO_INCREMENT COMMENT 'employee_id',
		employee_name                 		VARCHAR(100)		 NOT NULL COMMENT 'employee_name',
		employee_phone                		VARCHAR(13)		 NOT NULL COMMENT 'employee_phone',
		employee_email                		VARCHAR(100)		 NOT NULL COMMENT 'employee_email',
		department_id                 		INT(2)		 NOT NULL COMMENT 'department_id'
) COMMENT='従業員テーブル';


ALTER TABLE spring_database.departments ADD CONSTRAINT IDX_departments_PK PRIMARY KEY (department_id);

ALTER TABLE spring_database.employees ADD CONSTRAINT IDX_employees_PK PRIMARY KEY (employee_id);
ALTER TABLE spring_database.employees ADD CONSTRAINT IDX_employees_FK0 FOREIGN KEY (department_id) REFERENCES spring_database.departments (department_id);

