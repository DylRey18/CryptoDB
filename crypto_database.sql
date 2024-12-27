# Creating Database and dropping if it exists
DROP DATABASE IF EXISTS playfield;

CREATE DATABASE IF NOT EXISTS playfield;

USE playfield; 

# Creating Tables for the schema
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

create table 

