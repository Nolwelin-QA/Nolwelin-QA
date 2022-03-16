CREATE TABLE employees(
			 employees_id SERIAL PRIMARY KEY,
             employee_name VARCHAR(50) NOT NULL);
 

INSERT INTO employees (employee_name)
VALUES ('Alexandr Ivanov'),
       ('Danil Petrov'),
       ('Ivan Danilov'),
       ('Petr Alexandrov'),
       ('Oleg Nikitin'),
       ('Alexey Popov'),
       ('Ivan Ivanov'),
       ('Petr Petrov'),
       ('Nikita Nikitin'),
       ('Olga Petrova'),
       ('Anna Danilova'),
       ('Elena Alexandrova'),
       ('Lilia Nikitina'),
       ('Alexandra Popova'),
       ('Iwona Ivanova'),
       ('Milana Lenina'),
       ('Polina Olgina'),
       ('Jane Pope'),
       ('Renat Larin'),
       ('Egor Igorev'),
       ('Igor Olenin'),
       ('Dan Perov'),
       ('Van Dane'),
       ('Pole Lex'),
       ('Ol Tin'),
       ('Aley V'),
       ('Ann I'),
       ('P P'),
       ('Nike Niky'),
       ('Oge Pi'),
       ('Nam Dan'),
       ('Elena Nikitina'),
       ('Lilia Popova'),
       ('Alexandra Ivanova'),
       ('Iwona Lenina'),
       ('Milana Olgina'),
       ('Polina O'),
       ('Jane K'),
       ('Renat Igorev'),
       ('Egor Renatov'),
       ('Igor Egorov'),
       ('Lilia Nikitina'),
       ('Alexandra Popova'),
       ('Anna Ivanova'),
       ('Lena Lenina'),
       ('P'),
       ('Katerina U'),
       ('Renat Larin'),
       ('Petr Igorev'),
       ('Sergey Olenin'),
       ('Dania Petrov'),
       ('V Aliev'),
       ('Petr Lenin'),
       ('Sergey T'),
       ('Andrey V'),
       ('Olga I'),
       ('Tamara F'),
       ('Sveta L'),
       ('Liza D'),
       ('Katerina Danilova'),
       ('Tatiana Nikitina'),
       ('Natalia Popova'),
       ('Olesia Ivanova'),
       ('Inna Lenina'),
       ('Nina Olgina'),
       ('Polina Kiselova'),
       ('Julia Kostina'),
       ('Ivan Igorev'),
       ('Petr Renatov'),
       ('Igor Petrov');
       
      
CREATE TABLE salary(
             salary_id SERIAL PRIMARY KEY,
             monthly_salary INT NOT NULL);
            
            
DO $$
  BEGIN
    FOR n IN 10..25 LOOP
	INSERT INTO salary(monthly_salary) VALUES(n*100);
	END LOOP;
   END;
   $$;
  
	   
CREATE TABLE employee_salary(
             employee_salary_id SERIAL PRIMARY KEY,
             employees_id INT NOT NULL UNIQUE,
             salary_id INT NOT NULL,
             FOREIGN KEY(employees_id)
             REFERENCES employees(employees_id)
             ON DELETE CASCADE,
             FOREIGN KEY(salary_id)
             REFERENCES salary(salary_id));
            
	    	        
DO $$
  BEGIN
    FOR n IN 1..30 LOOP
	INSERT INTO employee_salary(employees_id, salary_id) VALUES(n+FLOOR(n/2), CEILING(n/2)+1);
	END LOOP;
   END;
   $$;	  
  
	    
DO $$
  BEGIN
    FOR n IN 1..10 LOOP
	INSERT INTO employee_salary(employees_id, salary_id) VALUES(n*70+1, CEILING(n/2)+1);
	END LOOP;
   END;
   $$;	 
  
  
CREATE TABLE roles(
	roles_id SERIAL PRIMARY KEY,
	role_name INT NOT NULL UNIQUE);


ALTER TABLE roles 
ALTER COLUMN role_name TYPE VARCHAR(30);


INSERT INTO roles(role_name)
VALUES ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');

     
CREATE TABLE roles_employee(
       roles_employee_id SERIAL PRIMARY KEY,
       employees_id INT NOT NULL UNIQUE,
       roles_id INT NOT NULL,
       FOREIGN KEY(employees_id)
       REFERENCES employees(employees_id)
       ON DELETE CASCADE,
       FOREIGN KEY(roles_id)
       REFERENCES roles(roles_id));   
           
DO $$
  BEGIN
    FOR n IN 1..40 LOOP
	INSERT INTO roles_employee(employees_id, roles_id) VALUES(n+FLOOR(n/3), CEILING(n/3)+1);
	END LOOP;
   END;
   $$;	         
      