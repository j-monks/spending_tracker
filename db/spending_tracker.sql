DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;
DROP TABLE users;

CREATE TABLE merchants
(
    id SERIAL primary key,
    name VARCHAR(255) not null,
    isdeleted INT,
    isactive INT 
);

CREATE TABLE categories
(
    id SERIAL primary key,
    name VARCHAR(255) not null,
    isdeleted INT,
    isactive INT
);

CREATE TABLE transactions
(
    id SERIAL primary key,
    merchant_id INT REFERENCES merchants(id),
    category_id INT REFERENCES categories(id),
    amount decimal(18,2),
    created_at TIMESTAMP
);

