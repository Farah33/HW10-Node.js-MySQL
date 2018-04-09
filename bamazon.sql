DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
  itemID INTEGER(10) AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(300) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price INTEGER(10) NOT NULL,
  stock_quantity INTEGER(10) NOT NULL,
  PRIMARY KEY (itemID)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) 
values ('Vizo', 'Electronics', 500, 3),
		('iPhone X', 'Electronics', 900, 10),
        ('office chair', 'Office Supplies', 330, 100),
		('Books', 'Office Supplies', 10, 20000),
		('Calculator', 'office suplies', 120, 500),
		('Washing machine', 'Household', 1200, 200),
		('perfumes', 'Accesory', 250, 200),
		('Dresses', 'Clothing', 400, 450),
		('shoes', 'INC', 220, 500),
		('Car Seat', 'EvenFlo', 350, 400);
        


CREATE TABLE orders (
  order_id INTEGER(11) AUTO_INCREMENT NOT NULL,
  itemID INTEGER(11) NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  quantity INTEGER(11) NOT NULL,
  total_price INTEGER(11) NOT NULL,
  remaining_stock INTEGER(11) NOT NULL,
  PRIMARY KEY (order_id)
);

CREATE TABLE inventory_log (
  log_id INTEGER(11) AUTO_INCREMENT NOT NULL,
 itemID INTEGER(11) NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  current_stock INTEGER(11) NOT NULL,
  quantity_added INTEGER(11) NOT NULL,
  updated_stock INTEGER(11) NOT NULL,
  PRIMARY KEY (log_id)
);