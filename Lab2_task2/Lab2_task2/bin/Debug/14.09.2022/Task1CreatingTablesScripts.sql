/*
Подготовьте DDL-скрипты создания объектов для приведённой модели: 
создание таблиц,первичных, уникальных, внешних ключей и т.д.
*/
USE BankOperations;
CREATE TABLE IF NOT EXISTS clients
( 
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
    name VARCHAR(1000),
    place_of_birth VARCHAR(1000),
    date_of_birth DATE,
    address VARCHAR(1000),
    passport VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS tarifs
(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    cost FLOAT(10,2)
);
CREATE TABLE IF NOT EXISTS product_type
(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    begin_date DATE,
    end_date DATE,
    tarif_ref INT(10) UNSIGNED NOT NULL,
    FOREIGN KEY(tarif_ref)
    REFERENCES tarifs(id)
);
CREATE TABLE IF NOT EXISTS products
(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
    product_type_id INT(10) UNSIGNED NOT NULL,
    name VARCHAR(100),
    client_ref INT(10) UNSIGNED NOT NULL,
    open_date DATE,
    close_date DATE,
    FOREIGN KEY(product_type_id)
    REFERENCES product_type(id),
    FOREIGN KEY(client_ref)
    REFERENCES clients(id)
);
CREATE TABLE IF NOT EXISTS accounts
(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(100),
	saldo FLOAT(10,2),
    client_ref INT(10) UNSIGNED NOT NULL,
    open_date DATE,
    close_date DATE,
    product_ref INT(10) UNSIGNED NOT NULL,
    acc_num VARCHAR(25),
    FOREIGN KEY(client_ref)
    REFERENCES clients(id),
    FOREIGN KEY(product_ref)
    REFERENCES products(id)
);
CREATE TABLE IF NOT EXISTS records
(
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY,
    dt TINYINT(1),
    sum FLOAT(10,2),
    acc_ref INT(10) UNSIGNED NOT NULL,
    oper_date DATE,
    FOREIGN KEY(acc_ref)
    REFERENCES accounts(id)
);