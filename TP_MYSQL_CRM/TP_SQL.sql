CREATE DATABASE TP_MYSQL_CRM;


-- creat table orders

CREATE TABLE orders (
id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
type_presta VARCHAR(50) NOT NULL,
designation VARCHAR(50) NOT NULL,
client_id INT NOT NULL,
nb_days INT NOT NULL,
unit_price INT NOT NULL,
total_exclude_taxe INT NOT NULL,
total_with_taxe INT NOT NULL,
state INT NOT NULL);


-- Coorection mohamad amine

CREATE TABLE IF NOT EXISTS orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_presta VARCHAR(60),
    designation VARCHAR(60),
    client_id INT,
    nb_days INT,
    unit_price REAL,
    total_exclude_taxe REAL GENERATED ALWAYS AS (unit_price*nb_days) STORED ,
    total_with_taxe REAL ,
    state INT CHECK (state IN (0, 1, 2))
);
-- REAL comme FLOAT
ALTER TABLE orders CHANGE total_with_taxe total_with_taxe REAL GENERATED ALWAYS AS ((unit_price*nb_days)+0.2*(unit_price*nb_days)) STORED ;

-- MY FINAL TABLE orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	type_presta VARCHAR(50) NOT NULL,
	designation VARCHAR(50) NOT NULL,
	client_id INT NOT NULL,
	nb_days INT NOT NULL,
	unit_price REAL NOT NULL,
	total_exclude_taxe REAL GENERATED ALWAYS AS (unit_price*nb_days) STORED ,
    total_with_taxe REAL GENERATED ALWAYS AS ((unit_price*nb_days)+0.2*(unit_price*nb_days)) STORED,
    state INT CHECK (state IN (0, 1, 2)));

--FOREIGN KEY REFERENCES clients(id)

ALTER TABLE orders ADD FOREIGN KEY (client_id) REFERENCES clients(id);

-- Create table clients

CREATE TABLE clients ( 
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    company_name VARCHAR(50) NOT NULL, 
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, email VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL, address VARCHAR(50) NOT NULL,
    zip_code VARCHAR(50) NOT NULL, city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL, state int NOT NULL);


-- insertion au table orders

INSERT INTO orders (type_presta,designation,client_id,nb_days,unit_price,state)
VALUES

("Formation","Angular init",2,3,1200.0,0),
("Formation","React avancé",2,3,1000.0,2),
("Coaching","React Techlead",1,20,900.0,2),
("Coaching","Nest.js Techlead",1,50,800,1),
("Coaching","React Teachead",1,50,800,1),
("Coaching","Jakarta EE",2,3,1000.0,2),
("Coaching","Angular Techlead",2,3,1200.0,0);


-- insertion into table clients:

INSERT INTO clients (company_name,first_name,last_name,email,phone,address,zip_code,city,country,state)
VALUES
("Capgemini","Fabrice","Martin","martin@mail.com","06 56 85 84 33","abc","xyz","Nantes","France",0),
("M2I Formation","Julien","Lamard","lamard@mail.com","06 11 22 33 44","abc","xyz","Paris","France",1),
("ATOS","Jack","Ma","Ma@mail.com",'06 12 45 78 96','sdf',"zer","Lyon","France",0),
("Sopra Steria","Pett","David","David@mail.com","06 23 56 89 52","tyu","mlk","Lille","France",0);


-- join he two tables

select * from orders INNER JOIN clients ON orders.client_id=clients.id;


-- Afficher toutes les formations sollicités par le client M2i formation M2u information

-- Solution 1
 select company_name,type_presta,designation from orders INNER JOIN clients ON orders.client_id=clients.id WHERE type_presta="Formation";
-- Solution 2
select company_name,type_presta,designation from orders INNER JOIN clients ON orders.client_id=clients.id WHERE clients.id=2 AND type_presta="Formation";


