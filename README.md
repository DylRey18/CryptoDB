# Cryptocurrency Portfolio Database

## Project Overview
This project is a cryptocurrency portfolio management system. It includes tables for storing information about users, cryptocurrencies, user wallets, and transactions.

## Database Schema
1. **cryptocurrency**: Stores information about various cryptocurrencies.
2. **user**: Stores user information.
3. **user_wallet**: Links users to their cryptocurrency wallets.
4. **transaction**: Stores transaction details for users.

## Setup Instructions
1. Run the SQL script to create the database and tables.
2. Insert sample data into the tables.
3. Use the SQL queries provided to interact with the database.

## Usage
- **Creating a new user**: Insert a new row into the `user` table.
- **Adding a new transaction**: Insert a new row into the `transaction` table.
- **Fetching user portfolio**: Query the `user_wallet` table to get the user's cryptocurrency holdings.

## Future Improvements
- Implement stored procedures for complex queries.
- Add a front-end interface to interact with the database.
- Enhance data validation and integrity checks.