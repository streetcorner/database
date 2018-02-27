
/*
exercise6.2.2*/
-- Create the database first.

CREATE DATABASE ComputerProduct;

USE ComputerProduct;


CREATE TABLE Product (
    maker		VARCHAR(200),
	model		INT,
    type		CHAR(20),
    PRIMARY KEY (model)
);


CREATE TABLE PC (
    model		INT,
	speed		FLOAT,
    ram			INT,
    hd			INT,
    price		DECIMAL(10, 2),
    PRIMARY KEY (model),
    FOREIGN KEY (model) REFERENCES Product(model)
);


CREATE TABLE Laptop (
    model		INT,
	speed		FLOAT,
    ram			INT,
    hd			INT,
    screen		FLOAT,    price		DECIMAL(10, 2),
    PRIMARY KEY (model),
    FOREIGN KEY (model) REFERENCES Product(model)
);

CREATE TABLE Printer (
    model		INT,
	color		BIT,		-- There is not BOOLEAN type in SQL Server.
    type		CHAR(20),
    price		DECIMAL(10, 2),
    PRIMARY KEY (model),
    FOREIGN KEY (model) REFERENCES Product(model)
);

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

-- SELECT * FROM Product;
-- SELECT * FROM PC;
-- SELECT * FROM Laptop;
-- SELECT * FROM Printer;

-- a
SELECT maker,speed
FROM Product,Laptop
WHERE Product.model = Laptop.model AND hd >= 30;
/*result
maker   speed
E        2
E			1.73
E			1.8
A			2
A			2.16
A			2
B			1.83
F			1.6
F			1.6
G			2
*/

-- b
(SELECT Product.model,price
FROM Product,PC
WHERE maker ='B' AND Product.model = PC.model)
	UNION
(SELECT Product.model,price
FROM Product,Laptop
WHERE maker ='B' AND Product.model = Laptop.model)
	UNION
(SELECT Product.model,price
FROM Product,Printer
WHERE maker ='B' AND Product.model = Printer.model);
/*result
model    price
1004     649.00
1005		630.00
1006	   1049.00
2007		1429.00
*/

-- c
SELECT DISTINCT maker
 FROM Product
 WHERE type = 'laptop' AND maker NOT IN 
	(SELECT maker
	 FROM Product
	 WHERE type = 'pc');
/*result
maker
F
G
*/

-- d
SELECT DISTINCT pc1.hd
FROM PC pc1,PC pc2
WHERE pc1.hd = pc2.hd AND pc1.model <>pc2.model;
/*result
hd
250
80
*/

-- e
SELECT pc1.model,pc2.model
FROM PC pc1,PC pc2
WHERE pc1.speed = pc2.speed AND pc1.ram = pc2.ram AND pc1.model < pc2.model;
/*result
model    model
1004     1012
*/
