# Creating Database and dropping if it exists
DROP DATABASE IF EXISTS playfield;

CREATE DATABASE IF NOT EXISTS playfield;

USE playfield; 

# Creating Tables for the schema
create table cryptocurrency (
	crypto_id INT primary key auto_increment not null,
    crypto_name varchar(50) NOT NULL,
    ticker varchar(50) NOT NULL,
    price decimal(18,8) NOT NULL
) ;

create table user (
	user_id int primary key auto_increment not null,
    first_name varchar(50) not null,
    last_name varchar(50),
    email varchar(50),
    phone varchar(50),
    created_at datetime
);

create table user_wallet(
	wallet_id int primary key auto_increment not null,
    user_id int not null,
    crypto_id int not null,
    wallet_addr varchar(100) not null,
    value decimal(18,8) not null,
    foreign key (user_id) references user (user_id) on delete no action,
    foreign key (crypto_id) references cryptocurrency (crypto_id) on delete no action
);

create table transaction(
	transaction_id int primary key auto_increment not null,
    user_id int not null,
    crypto_id int not null,
    amount decimal(18,8) not null,
    price_at_tx decimal(18,8) not null,
    tx_hash varchar(100) not null,
    tx_type varchar(10) not null,
    tx_status varchar(20) not null,
    foreign key (user_id) references user (user_id) on delete no action,
    foreign key (crypto_id) references cryptocurrency (crypto_id) on delete no action
);