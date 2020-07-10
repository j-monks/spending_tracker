DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE categories;

CREATE TABLE merchants
(
    id SERIAL primary key,
    name VARCHAR(255) not null
);

CREATE TABLE categories
(
    id SERIAL primary key,
    name VARCHAR(255) not null
);

CREATE TABLE transactions
(
    id SERIAL primary key,
    merchant_id INT REFERENCES merchants(id),
    category_id INT REFERENCES categories(id),
    amount decimal(18,2)
);