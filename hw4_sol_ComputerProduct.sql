
-- Create the database first.

USE master;
GO

IF DB_ID('ComputerProduct') IS NOT NULL
DROP DATABASE ComputerProduct;
GO

CREATE DATABASE ComputerProduct;
GO

USE ComputerProduct;

-- Exercise 2.3.1

-- a) A schema for relation Product

CREATE TABLE Product (
    maker		VARCHAR(200),
	model		INT,
    type		CHAR(20),
    PRIMARY KEY (model)
);

-- b) A schema for relation PC

CREATE TABLE PC (
    model		INT,
	speed		FLOAT,
    ram			INT,
    hd			INT,
    price		DECIMAL(10, 2),
    PRIMARY KEY (model),
    FOREIGN KEY (model) REFERENCES Product(model)
);

-- Foreign key is not required now

-- c) A schema for relation Laptop

CREATE TABLE Laptop (
    model		INT,
	speed		FLOAT,
    ram			INT,
    hd			INT,
    screen		FLOAT,    price		DECIMAL(10, 2),
    PRIMARY KEY (model),
    FOREIGN KEY (model) REFERENCES Product(model)
);

-- d) A schema for relation Laptop

CREATE TABLE Printer (
    model		INT,
	color		BIT,		-- There is not BOOLEAN type in SQL Server.
    type		CHAR(20),
    price		DECIMAL(10, 2),
    PRIMARY KEY (model),
    FOREIGN KEY (model) REFERENCES Product(model)
);

-- Insert data values
INSERT INTO Product VALUES ('A', 1001, 'pc');
INSERT INTO Product VALUES ('A', 1002, 'pc');
INSERT INTO Product VALUES ('A', 1003, 'pc');
INSERT INTO Product VALUES ('A', 2004, 'laptop');
INSERT INTO Product VALUES ('A', 2005, 'laptop');
INSERT INTO Product VALUES ('A', 2006, 'laptop');
INSERT INTO Product VALUES ('B', 1004, 'pc');
INSERT INTO Product VALUES ('B', 1005, 'pc');
INSERT INTO Product VALUES ('B', 1006, 'pc');
INSERT INTO Product VALUES ('B', 2007, 'laptop');
INSERT INTO Product VALUES ('C', 1007, 'pc');
INSERT INTO Product VALUES ('D', 1008, 'pc');
INSERT INTO Product VALUES ('D', 1009, 'pc');
INSERT INTO Product VALUES ('D', 1010, 'pc');
INSERT INTO Product VALUES ('D', 3004, 'printer');
INSERT INTO Product VALUES ('D', 3005, 'printer');
INSERT INTO Product VALUES ('E', 1011, 'pc');
INSERT INTO Product VALUES ('E', 1012, 'pc');
INSERT INTO Product VALUES ('E', 1013, 'pc');
INSERT INTO Product VALUES ('E', 2001, 'laptop');
INSERT INTO Product VALUES ('E', 2002, 'laptop');
INSERT INTO Product VALUES ('E', 2003, 'laptop');
INSERT INTO Product VALUES ('E', 3001, 'printer');
INSERT INTO Product VALUES ('E', 3002, 'printer');
INSERT INTO Product VALUES ('E', 3003, 'printer');
INSERT INTO Product VALUES ('F', 2008, 'laptop');
INSERT INTO Product VALUES ('F', 2009, 'laptop');
INSERT INTO Product VALUES ('G', 2010, 'laptop');
INSERT INTO Product VALUES ('H', 3006, 'printer');
INSERT INTO Product VALUES ('H', 3007, 'printer');


INSERT INTO PC VALUES (1001, 2.66, 1024, 250, 2114);
INSERT INTO PC VALUES (1002, 2.10, 512,  250, 995);
INSERT INTO PC VALUES (1003, 1.42, 512,  80,  478);
INSERT INTO PC VALUES (1004, 2.80, 1024, 250, 649);
INSERT INTO PC VALUES (1005, 3.20, 512,  250, 630);
INSERT INTO PC VALUES (1006, 3.20, 1024, 320, 1049);
INSERT INTO PC VALUES (1007, 2.20, 1024, 200, 510);
INSERT INTO PC VALUES (1008, 2.20, 2048, 250, 770);
INSERT INTO PC VALUES (1009, 2.00, 1024, 250, 650);
INSERT INTO PC VALUES (1010, 2.80, 2048, 300, 770);
INSERT INTO PC VALUES (1011, 1.86, 2048, 160, 959);
INSERT INTO PC VALUES (1012, 2.80, 1024, 190, 649);
INSERT INTO PC VALUES (1013, 3.06, 512,  80,  529);


INSERT INTO Laptop VALUES (2001, 2.00, 2048, 240, 20.1, 3673);
INSERT INTO Laptop VALUES (2002, 1.73, 1024, 80,  17.0, 949);
INSERT INTO Laptop VALUES (2003, 1.80, 512,  60,  15.4, 549);
INSERT INTO Laptop VALUES (2004, 2.00, 512,  60,  13.3, 1150);
INSERT INTO Laptop VALUES (2005, 2.16, 1024, 120, 17.0, 2500);
INSERT INTO Laptop VALUES (2006, 2.00, 2048, 80,  15.4, 1700);
INSERT INTO Laptop VALUES (2007, 1.83, 1024, 120, 13.3, 1429);
INSERT INTO Laptop VALUES (2008, 1.60, 1024, 120, 15.4, 900);
INSERT INTO Laptop VALUES (2009, 1.60, 512,  80,  14.1, 680);
INSERT INTO Laptop VALUES (2010, 2.00, 2048, 160, 15.4, 2300);


INSERT INTO Printer VALUES (3001, 1, 'ink-jet', 90);
INSERT INTO Printer VALUES (3002, 0, 'laser', 239);
INSERT INTO Printer VALUES (3003, 1, 'laser', 899);
INSERT INTO Printer VALUES (3004, 1, 'ink-jet', 120);
INSERT INTO Printer VALUES (3005, 0, 'laser', 120);
INSERT INTO Printer VALUES (3006, 1, 'ink-jet', 100);
INSERT INTO Printer VALUES (3007, 1, 'laser', 200);


SELECT * FROM Product;
SELECT * FROM PC;
SELECT * FROM Laptop;
SELECT * FROM Printer;


-- Exercise 6.1.3

-- a) Find the model number, speed, and hard-disk size for all PC's whose price is under $1000

SELECT model, speed, hd
FROM PC
WHERE price < 1000;

/*
model       speed                  hd
----------- ---------------------- -----------
1002        2.1                    250
1003        1.42                   80
1004        2.8                    250
1005        3.2                    250
1007        2.2                    200
1008        2.2                    250
1009        2                      250
1010        2.8                    300
1011        1.86                   160
1012        2.8                    190
1013        3.06                   80

(11 行受影响)
*/

-- b) Do the same as (a), but rename the speed column gigahertz and the hd column gigabytes

SELECT model, speed AS gigahertz, hd AS gigabytes
FROM PC
WHERE price < 1000;

/*
model       gigahertz              gigabytes
----------- ---------------------- -----------
1002        2.1                    250
1003        1.42                   80
1004        2.8                    250
1005        3.2                    250
1007        2.2                    200
1008        2.2                    250
1009        2                      250
1010        2.8                    300
1011        1.86                   160
1012        2.8                    190
1013        3.06                   80

(11 行受影响)
*/

-- c) Find the manufacturers of printers

SELECT maker
FROM Product
WHERE TYPE = 'printer';

/*
maker
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
E
E
E
D
D
H
H

(7 行受影响)
*/

-- d) Find the model number, memory size, and screen size for laptops costing more than $1500

SELECT model, ram, screen
FROM Laptop
WHERE price > 1500;

/*
model       ram         screen
----------- ----------- ----------------------
2001        2048        20.1
2005        1024        17
2006        2048        15.4
2010        2048        15.4

(4 行受影响)
*/

-- e) Find all the tuples in the Printer relation for color printers. Remember that color
--    is a boolean-valued attribute.

SELECT *
FROM Printer
WHERE color = 1;	-- SQL Server does not support BOOLEAN type, it provide BIT instead.

/*
model       color type                 price
----------- ----- -------------------- ---------------------------------------
3001        1     ink-jet              90.00
3003        1     laser                899.00
3004        1     ink-jet              120.00
3006        1     ink-jet              100.00
3007        1     laser                200.00

(5 行受影响)
*/

-- f) Find the model number and hard-disk size for those PC's that have a speed of 3.2 and a price
--    less than $2000

SELECT model, hd
FROM PC
WHERE speed = 3.2 AND price < 2000;

/*
model       hd
----------- -----------
1005        250
1006        320

(2 行受影响)
*/



-- Exercise 6.2.2

-- a) Give the manufacturer and speed of laptops with a hard disk of at least thirty gigabytes.

SELECT maker, speed
FROM Laptop, Product
WHERE Laptop.model = Product.model AND hd >= 30;

/*
maker                                                                                                                                                                                                    speed
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------
E                                                                                                                                                                                                        2
E                                                                                                                                                                                                        1.73
E                                                                                                                                                                                                        1.8
A                                                                                                                                                                                                        2
A                                                                                                                                                                                                        2.16
A                                                                                                                                                                                                        2
B                                                                                                                                                                                                        1.83
F                                                                                                                                                                                                        1.6
F                                                                                                                                                                                                        1.6
G                                                                                                                                                                                                        2

(10 行受影响)
*/

-- b) Find the model number and price of all products (of any type) made by manufacturer B.

SELECT Product.model, price
FROM Product, PC
WHERE Product.model = PC.model AND
	  maker = 'B'
UNION
SELECT Product.model, price
FROM Product, Laptop
WHERE Product.model = Laptop.model AND
	  maker = 'B'
UNION
SELECT Product.model, price
FROM Product, Printer
WHERE Product.model = Printer.model AND
	  maker = 'B'

/*
model       price
----------- ---------------------------------------
1004        649.00
1005        630.00
1006        1049.00
2007        1429.00

(4 行受影响)
*/

-- c) Find those manufacturers that sell Laptops, but not PC's

SELECT maker
FROM Product
WHERE type = 'laptop'
EXCEPT
SELECT maker
FROM Product
WHERE type = 'pc'

/*
maker
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
F
G

(2 行受影响)
*/


-- d) Find those hard-disk sizes that occur in two or more PC's.

SELECT DISTINCT PC1.hd
FROM PC PC1, PC PC2
WHERE PC1.hd =PC2.hd AND PC1.model < PC2.model;

/*
hd
-----------
80
250

(2 行受影响)
*/


-- e) Find those pairs of PC models that have both the same speed and RAM. 
--    A pair should be listed only once; e.g., list (i,j) but not (j,i)

SELECT PC1.model, PC2.model
FROM PC PC1, PC PC2
WHERE PC1.speed = PC2.speed AND PC1.ram = PC2.ram AND PC1.model < PC2.model;

/*
model       model
----------- -----------
1004        1012

(1 行受影响)
*/

