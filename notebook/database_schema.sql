CREATE SCHEMA bank;
USE bank;

-- Create tables with relationships

CREATE TABLE customers (
    customer_id VARCHAR(255) PRIMARY KEY,
    name TEXT(255),
    age INTEGER,
    city TEXT(255),
    risk_score REAL
);

CREATE TABLE accounts (
    account_id VARCHAR(255) PRIMARY KEY,
    customer_id VARCHAR(255),
    account_type TEXT(255),
    open_date DATE,
    balance REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id VARCHAR(255) PRIMARY KEY,
    account_id VARCHAR(255),
    timestamp VARCHAR(255),
    amount REAL,
    type VARCHAR(255),
    is_fraud INTEGER,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

