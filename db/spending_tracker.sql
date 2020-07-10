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