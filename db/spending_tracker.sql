DROP TABLE merchants;

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