# Creating Database and dropping if it exists
DROP DATABASE IF EXISTS crypto;

CREATE DATABASE IF NOT EXISTS crypto;

USE crypto; 

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

-- Insert more cryptocurrencies
INSERT INTO cryptocurrency (crypto_name, ticker, price) VALUES
('Bitcoin', 'BTC', 42356.75),
('Ethereum', 'ETH', 2235.50),
('Cardano', 'ADA', 0.58),
('Solana', 'SOL', 98.45),
('Ripple', 'XRP', 0.62),
('Polkadot', 'DOT', 7.25),
('Chainlink', 'LINK', 14.85),
('Avalanche', 'AVAX', 35.42),
('Polygon', 'MATIC', 0.85),
('Dogecoin', 'DOGE', 0.085);

-- Insert more users
INSERT INTO user (first_name, last_name, email, phone, created_at) VALUES
('John', 'Doe', 'john@example.com', '+1234567890', '2024-01-15 10:00:00'),
('Alice', 'Smith', 'alice@example.com', '+1987654321', '2024-01-16 11:30:00'),
('Bob', 'Johnson', 'bob@example.com', '+1122334455', '2024-01-17 09:15:00'),
('Emma', 'Wilson', 'emma@example.com', '+1234567891', '2024-01-18 14:20:00'),
('Michael', 'Brown', 'michael@example.com', '+1234567892', '2024-01-19 16:45:00'),
('Sarah', 'Davis', 'sarah@example.com', '+1234567893', '2024-01-20 08:30:00'),
('David', 'Martinez', 'david@example.com', '+1234567894', '2024-01-21 12:10:00'),
('Lisa', 'Anderson', 'lisa@example.com', '+1234567895', '2024-01-22 15:25:00'),
('James', 'Taylor', 'james@example.com', '+1234567896', '2024-01-23 09:40:00'),
('Emily', 'Thomas', 'emily@example.com', '+1234567897', '2024-01-24 11:55:00');

-- Insert more user wallets
INSERT INTO user_wallet (user_id, crypto_id, wallet_addr, value) VALUES
-- John's wallets
(1, 1, 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 0.5),
(1, 2, '0x71C7656EC7ab88b098defB751B7401B5f6d8976F', 4.2),
(1, 5, 'rxaddr1234567', 1000.0),
-- Alice's wallets
(2, 1, 'bc1qabc2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 0.75),
(2, 3, 'addr1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 1000.0),
(2, 6, 'dot1234567', 150.0),
-- Bob's wallets
(3, 2, '0x82D7656EC7ab88b098defB751B7401B5f6d8976F', 10.5),
(3, 4, 'SOL123456789abcdef', 25.0),
(3, 7, 'link987654', 200.0),
-- Emma's wallets
(4, 1, 'bc1qdef3kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 1.2),
(4, 2, '0x93E7656EC7ab88b098defB751B7401B5f6d8976F', 15.0),
(4, 8, 'avax123456', 45.0),
-- Michael's wallets
(5, 3, 'addr1qzz2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 2500.0),
(5, 4, 'SOL987654321abcdef', 100.0),
(5, 9, 'matic123456', 3000.0),
-- Sarah's wallets
(6, 2, '0x64F7656EC7ab88b098defB751B7401B5f6d8976F', 7.5),
(6, 5, 'rxaddr7654321', 5000.0),
(6, 10, 'doge123456', 10000.0),
-- David's wallets
(7, 1, 'bc1qghi4kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 0.3),
(7, 6, 'dot7654321', 200.0),
(7, 7, 'link123456', 150.0),
-- Lisa's wallets
(8, 3, 'addr1qww2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh', 3000.0),
(8, 8, 'avax987654', 60.0),
(8, 9, 'matic987654', 4000.0),
-- James's wallets
(9, 4, 'SOL456789abcdef', 75.0),
(9, 7, 'link456789', 300.0),
(9, 10, 'doge987654', 15000.0),
-- Emily's wallets
(10, 2, '0x45E7656EC7ab88b098defB751B7401B5f6d8976F', 5.0),
(10, 5, 'rxaddr4567890', 3000.0),
(10, 8, 'avax456789', 30.0);

-- Insert transactions with type and status
INSERT INTO transaction (user_id, crypto_id, amount, price_at_tx, tx_hash, tx_type, tx_status) VALUES
-- John's transactions
(1, 1, 0.2, 40000.00, 'tx_hash_btc_1', 'BUY', 'COMPLETED'),
(1, 1, 0.3, 41000.00, 'tx_hash_btc_2', 'BUY', 'COMPLETED'),
(1, 2, 2.0, 2000.00, 'tx_hash_eth_1', 'BUY', 'COMPLETED'),
(1, 2, 2.2, 2100.00, 'tx_hash_eth_2', 'SELL', 'COMPLETED'),
(1, 5, 1000.0, 0.60, 'tx_hash_xrp_1', 'BUY', 'COMPLETED'),

-- Alice's transactions
(2, 1, 0.75, 39000.00, 'tx_hash_btc_3', 'BUY', 'COMPLETED'),
(2, 3, 500.0, 0.55, 'tx_hash_ada_1', 'BUY', 'COMPLETED'),
(2, 3, 500.0, 0.57, 'tx_hash_ada_2', 'BUY', 'COMPLETED'),
(2, 6, 150.0, 7.00, 'tx_hash_dot_1', 'BUY', 'PENDING'),

-- Bob's transactions
(3, 2, 5.5, 2150.00, 'tx_hash_eth_3', 'BUY', 'COMPLETED'),
(3, 2, 5.0, 2200.00, 'tx_hash_eth_4', 'SELL', 'COMPLETED'),
(3, 4, 25.0, 95.00, 'tx_hash_sol_1', 'BUY', 'COMPLETED'),
(3, 7, 200.0, 14.50, 'tx_hash_link_1', 'BUY', 'FAILED'),

-- Emma's transactions
(4, 1, 0.7, 42000.00, 'tx_hash_btc_4', 'BUY', 'COMPLETED'),
(4, 1, 0.5, 42500.00, 'tx_hash_btc_5', 'SELL', 'COMPLETED'),
(4, 2, 15.0, 2220.00, 'tx_hash_eth_5', 'BUY', 'PENDING'),
(4, 8, 45.0, 34.80, 'tx_hash_avax_1', 'BUY', 'COMPLETED'),

-- Michael's transactions
(5, 3, 1500.0, 0.56, 'tx_hash_ada_3', 'BUY', 'COMPLETED'),
(5, 3, 1000.0, 0.58, 'tx_hash_ada_4', 'SELL', 'COMPLETED'),
(5, 4, 100.0, 97.50, 'tx_hash_sol_2', 'BUY', 'COMPLETED'),
(5, 9, 3000.0, 0.82, 'tx_hash_matic_1', 'BUY', 'COMPLETED'),

-- Sarah's transactions
(6, 2, 7.5, 2230.00, 'tx_hash_eth_6', 'BUY', 'COMPLETED'),
(6, 5, 2500.0, 0.61, 'tx_hash_xrp_2', 'BUY', 'COMPLETED'),
(6, 5, 2500.0, 0.62, 'tx_hash_xrp_3', 'SELL', 'PENDING'),
(6, 10, 10000.0, 0.082, 'tx_hash_doge_1', 'BUY', 'COMPLETED'),

-- David's transactions
(7, 1, 0.3, 41500.00, 'tx_hash_btc_6', 'BUY', 'COMPLETED'),
(7, 6, 100.0, 7.15, 'tx_hash_dot_2', 'BUY', 'COMPLETED'),
(7, 6, 100.0, 7.20, 'tx_hash_dot_3', 'SELL', 'FAILED'),
(7, 7, 150.0, 14.75, 'tx_hash_link_2', 'BUY', 'COMPLETED'),

-- Lisa's transactions
(8, 3, 1500.0, 0.57, 'tx_hash_ada_5', 'BUY', 'COMPLETED'),
(8, 3, 1500.0, 0.58, 'tx_hash_ada_6', 'SELL', 'COMPLETED'),
(8, 8, 60.0, 35.00, 'tx_hash_avax_2', 'BUY', 'COMPLETED'),
(8, 9, 4000.0, 0.84, 'tx_hash_matic_2', 'BUY', 'PENDING'),

-- James's transactions
(9, 4, 75.0, 98.00, 'tx_hash_sol_3', 'BUY', 'COMPLETED'),
(9, 7, 300.0, 14.80, 'tx_hash_link_3', 'BUY', 'COMPLETED'),
(9, 10, 15000.0, 0.083, 'tx_hash_doge_2', 'SELL', 'COMPLETED'),

-- Emily's transactions
(10, 2, 5.0, 2225.00, 'tx_hash_eth_7', 'BUY', 'COMPLETED'),
(10, 5, 1500.0, 0.61, 'tx_hash_xrp_4', 'BUY', 'COMPLETED'),
(10, 5, 1500.0, 0.62, 'tx_hash_xrp_5', 'SELL', 'COMPLETED'),
(10, 8, 30.0, 35.30, 'tx_hash_avax_3', 'BUY', 'PENDING');