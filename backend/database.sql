DROP DATABASE IF EXISTS pizzeria_management;

CREATE DATABASE pizzeria_management;

USE pizzeria_management;

CREATE TABLE PRODUCTS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    PRICE FLOAT(6,2) NOT NULL
);

CREATE TABLE CLIENTS (
    CPF VARCHAR(14) PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    TELEPHONE VARCHAR(14) NOT NULL,
    CELLPHONE VARCHAR(15) NOT NULL,
    ADDRESS VARCHAR(75) NOT NULL,
    NEIGHBORHOOD VARCHAR(75) NOT NULL,
    CITY VARCHAR(75) NOT NULL,
    ZIPCODE VARCHAR(9) NOT NULL,
    NUMBER INT NOT NULL,
    INFO VARCHAR(75)
);

CREATE TABLE ORDERS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DATE DATETIME NOT NULL,
    STATUS VARCHAR(15) NOT NULL,
    CLIENT VARCHAR(14) NOT NULL,

    FOREIGN KEY(CLIENT)
        REFERENCES CLIENTS(CPF)
);

CREATE TABLE PRODUCTS_ORDERS(
    ID_PRODUCT INT,
    ID_ORDER INT,
    AMOUNT INT NOT NULL,

    PRIMARY KEY (ID_PRODUCT, ID_ORDER),

    FOREIGN KEY(ID_PRODUCT)
        REFERENCES PRODUCTS(ID),

    FOREIGN KEY(ID_ORDER)
        REFERENCES ORDERS(ID)
);

CREATE TABLE USERS(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL UNIQUE,
    PASSWORD VARCHAR(40) NOT NULL
);

INSERT INTO PRODUCTS VALUES (1, 'Pizza 4 Queijos', 20.5);
INSERT INTO PRODUCTS VALUES (2, 'Pizza Calabresa', 22.5);
INSERT INTO PRODUCTS VALUES (3, 'Pizza Margherita', 18);
INSERT INTO PRODUCTS VALUES (4, 'Pizza à moda da casa', 25);
INSERT INTO PRODUCTS VALUES (5, 'Coca-Cola 500ml', 8.5);
INSERT INTO PRODUCTS VALUES (6, 'Guaraná 500ml', 7.5);

INSERT INTO CLIENTS VALUES ('111.111.111-11', 'Roberto Luiz Debarba', '(47) 3034-4331', '(47) 99944-5511', 'Rua Egito', 'Nações', 'Timbó', '89120-000' , 143, '');
INSERT INTO CLIENTS VALUES ('222.222.222-22', 'Matheus Adriano Pereira', '(47) 3322-7431', '(47) 99176-9834', 'Rua John Lennon', 'Centro', 'Blumenau', '89120-000', 56, '');
INSERT INTO CLIENTS VALUES ('333.333.333-33', 'Matheus Eduardo Hoeltgebaum Pereira', '(47) 3089-4331', '(47) 99887-0921', 'Rua Uruguai', 'Centro', 'Blumenau', '89120-000', 133, '');

INSERT INTO ORDERS VALUES (1, '2017/02/05', 'PENDING', '111.111.111-11');
INSERT INTO ORDERS VALUES (2, '2017/03/05', 'DONE', '222.222.222-22');
INSERT INTO ORDERS VALUES (3, '2017/04/10', 'DONE', '111.111.111-11');
INSERT INTO ORDERS VALUES (4, '2017/04/07', 'CANCELED', '333.333.333-33');
INSERT INTO ORDERS VALUES (5, '2017/03/11', 'PENDING', '333.333.333-33');
INSERT INTO ORDERS VALUES (6, '2017/04/11', 'DONE', '222.222.222-22');

INSERT INTO PRODUCTS_ORDERS VALUES (1, 1, 1);
INSERT INTO PRODUCTS_ORDERS VALUES (2, 1, 5);
INSERT INTO PRODUCTS_ORDERS VALUES (5, 1, 11);
INSERT INTO PRODUCTS_ORDERS VALUES (6, 2, 6);
INSERT INTO PRODUCTS_ORDERS VALUES (3, 3, 4);
INSERT INTO PRODUCTS_ORDERS VALUES (4, 3, 3);
INSERT INTO PRODUCTS_ORDERS VALUES (6, 4, 9);
INSERT INTO PRODUCTS_ORDERS VALUES (1, 5, 7);
INSERT INTO PRODUCTS_ORDERS VALUES (6, 5, 9);
INSERT INTO PRODUCTS_ORDERS VALUES (5, 6, 10);

INSERT INTO USERS VALUES (1, 'admin1', SHA1('senha'));
INSERT INTO USERS VALUES (2, 'admin2', SHA1('senha'));
INSERT INTO USERS VALUES (3, 'user1', SHA1('senha'));
INSERT INTO USERS VALUES (4, 'user2', SHA1('senha'));
