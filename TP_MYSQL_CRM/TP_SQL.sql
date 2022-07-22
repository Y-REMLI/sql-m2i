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