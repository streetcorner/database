
-- Create the database first.

USE master;
GO

IF DB_ID('ShipBattle') IS NOT NULL
DROP DATABASE ShipBattle;
GO

CREATE DATABASE ShipBattle;
GO

USE ShipBattle;

-- Exercise 2.3.2

-- a) A schema for relation Classes

CREATE TABLE Classes (
    class		VARCHAR(200),
	type		CHAR(2),	-- 'bb' for battleship or 'bc' for battlecruiser
    country		CHAR(20),
    numGuns		SMALLINT,
    bore		FLOAT,
    displacement BIGINT,
    PRIMARY KEY (class)
);

-- b) A schema for relation Ships

CREATE TABLE Ships (
    name		VARCHAR(200),
	class		VARCHAR(200),
    launched	DATE,
    PRIMARY KEY (name),
    FOREIGN KEY (class) REFERENCES Classes(class)
);

-- Foreign key is not required now

-- c) A schema for relation Battles

CREATE TABLE Battles (
    name		VARCHAR(300),
	date		DATE,
    PRIMARY KEY (name)
);

-- d) A schema for relation Outcomes

CREATE TABLE Outcomes (
    ship		VARCHAR(200),
	battle		VARCHAR(300),
    result		CHAR(20),
    PRIMARY KEY (ship, battle)
);

-- Insert data values
INSERT INTO Classes VALUES ('Bismarck', 'bb', 'Germany', 8, 15, 42000);
INSERT INTO Classes VALUES ('Iowa', 'bb', 'USA', 9, 16, 46000);
INSERT INTO Classes VALUES ('Kongo', 'bc', 'Japan', 8, 14, 32000);
INSERT INTO Classes VALUES ('North Carolina', 'bb', 'USA', 9, 16, 37000);
INSERT INTO Classes VALUES ('Renown', 'bc', 'Gt. Britain', 6, 15, 32000);
INSERT INTO Classes VALUES ('Revenge', 'bb', 'Gt. Britain', 8, 15, 29000);
INSERT INTO Classes VALUES ('Tennessee', 'bb', 'USA', 12, 14, 32000);
INSERT INTO Classes VALUES ('Yamato', 'bb', 'Japan', 9, 18, 65000);

INSERT INTO Ships VALUES ('California', 'Tennessee', '1921-01-01');
INSERT INTO Ships VALUES ('Haruna', 'Kongo', '1915-01-01');
INSERT INTO Ships VALUES ('Hiei', 'Kongo', '1914-01-01');
INSERT INTO Ships VALUES ('Iowa', 'Iowa', '1943-01-01');
INSERT INTO Ships VALUES ('Kirishima', 'Kongo', '1915-01-01');
INSERT INTO Ships VALUES ('Kongo', 'Kongo', '1913-01-01');
INSERT INTO Ships VALUES ('Missouri', 'Iowa', '1943-01-01');
INSERT INTO Ships VALUES ('Musashi', 'Yamato', '1942-01-01');
INSERT INTO Ships VALUES ('New Jersey', 'Iowa', '1943-01-01');
INSERT INTO Ships VALUES ('North Carolina', 'North Carolina', '1941-01-01');
INSERT INTO Ships VALUES ('Ramillies', 'Revenge', '1917-01-01');
INSERT INTO Ships VALUES ('Renown', 'Renown', '1916-01-01');
INSERT INTO Ships VALUES ('Repulse', 'Renown', '1916-01-01');
INSERT INTO Ships VALUES ('Resolution', 'Revenge', '1916-01-01');
INSERT INTO Ships VALUES ('Revenge', 'Revenge', '1916-01-01');
INSERT INTO Ships VALUES ('Royal Oak', 'Revenge', '1916-01-01');
INSERT INTO Ships VALUES ('Royal Sovereign', 'Revenge', '1916-01-01');
INSERT INTO Ships VALUES ('Tennessee', 'Tennessee', '1920-01-01');
INSERT INTO Ships VALUES ('Washington', 'North Carolina', '1941-01-01');
INSERT INTO Ships VALUES ('Wisconsin', 'Iowa', '1944-01-01');
INSERT INTO Ships VALUES ('Yamato', 'Yamato', '1941-01-01');

INSERT INTO Battles VALUES ('Denmark Strait', '1941-05-24');
INSERT INTO Battles VALUES ('Guadalcanal', '1942-11-15');
INSERT INTO Battles VALUES ('North Cape', '1943-12-26');
INSERT INTO Battles VALUES ('Surigao Strait', '1944-10-25');

INSERT INTO Outcomes VALUES ('Arizona', 'Pearl Harbor', 'sunk');
INSERT INTO Outcomes VALUES ('Bismarck', 'Denmark Strait', 'sunk');
INSERT INTO Outcomes VALUES ('California', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Duke of York', 'North Cape', 'ok');
INSERT INTO Outcomes VALUES ('Fuso', 'Surigao Strait', 'sunk');
INSERT INTO Outcomes VALUES ('Hood', 'Denmark Strait', 'sunk');
INSERT INTO Outcomes VALUES ('King George V', 'Denmark Strait', 'ok');
INSERT INTO Outcomes VALUES ('Kirishima', 'Guadalcanal', 'sunk');
INSERT INTO Outcomes VALUES ('Prince of Wales', 'Denmark Strait', 'damaged');
INSERT INTO Outcomes VALUES ('Rodney', 'Denmark Strait', 'ok');
INSERT INTO Outcomes VALUES ('Scharnhorst', 'North Cape', 'sunk');
INSERT INTO Outcomes VALUES ('South Dakota', 'Guadalcanal', 'damaged');
INSERT INTO Outcomes VALUES ('Tennessee', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Washington', 'Guadalcanal', 'ok');
INSERT INTO Outcomes VALUES ('West Virginia', 'Surigao Strait', 'ok');
INSERT INTO Outcomes VALUES ('Yamashito', 'Surigao Strait', 'sunk');


SELECT * FROM Classes;
SELECT * FROM Ships;
SELECT * FROM Battles;
SELECT * FROM Outcomes;


-- Exercise 6.1.4

-- a) Find the class name and country for all classes with at least 10 guns.

SELECT class, country
FROM Classes
WHERE numGuns >= 10;

/*
class                                                                                                                                                                                                    country
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------
Tennessee                                                                                                                                                                                                USA                 

(1 行受影响)
*/

-- b) Find the names of all ships launched prior to 1918, but call the resulting column shipName

SELECT name AS shipName
FROM Ships
WHERE launched < '1918-01-01' ;

/*
shipName
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Haruna
Hiei
Kirishima
Kongo
Ramillies
Renown
Repulse
Resolution
Revenge
Royal Oak
Royal Sovereign

(11 行受影响)
*/

-- c) Find the names of ships sunk in battle and the name of the battle in which they were sunk.

SELECT ship, battle
FROM Outcomes
WHERE result = 'sunk';

/*
ship                                                                                                                                                                                                     battle
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Arizona                                                                                                                                                                                                  Pearl Harbor
Bismarck                                                                                                                                                                                                 Denmark Strait
Fuso                                                                                                                                                                                                     Surigao Strait
Hood                                                                                                                                                                                                     Denmark Strait
Kirishima                                                                                                                                                                                                Guadalcanal
Scharnhorst                                                                                                                                                                                              North Cape
Yamashito                                                                                                                                                                                                Surigao Strait

(7 行受影响)
*/

-- d) Find all ships that have the same name as their class.

SELECT name
FROM Ships
WHERE name = class;

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Iowa
Kongo
North Carolina
Renown
Revenge
Tennessee
Yamato

(7 行受影响)
*/

-- e) Find the names of all ships that begin with the letter "R".

SELECT name
FROM Ships
WHERE name LIKE 'R%';

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Ramillies
Renown
Repulse
Resolution
Revenge
Royal Oak
Royal Sovereign

(7 行受影响)
*/

-- Note: As mentioned in exercise 2.4.3, there are some dangling pointers and to
-- retrieve all ships a UNION of Ships and Outcomes is required.
-- Below query returns 8 rows including ship named Rodney.

SELECT name
FROM Ships
WHERE name LIKE 'R%'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE 'R%';

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Ramillies
Renown
Repulse
Resolution
Revenge
Rodney
Royal Oak
Royal Sovereign

(8 行受影响)
*/

-- f) Find the names of all ships whose name consists of three or more words (e.g., King George V).

SELECT name
FROM Ships
WHERE name LIKE '_% _% _%';

-- Only using a filter like '% % %' will incorrectly match name such as ' a b '
-- since % can match any sequence of 0 or more characters.

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(0 行受影响)
*/

-- Note: As in (e), UNION with results from Outcomes.

SELECT name
FROM Ships
WHERE name LIKE '_% _% _%'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE '_% _% _%';

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Duke of York
King George V
Prince of Wales

(3 行受影响)
*/


-- Exercise 6.2.3

-- a) Find the ships heavier than 35,000 tons.

SELECT Ships.name
FROM Ships, Classes
WHERE Ships.class = Classes.class AND Classes.displacement > 35000;

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Iowa
Missouri
Musashi
New Jersey
North Carolina
Washington
Wisconsin
Yamato

(8 行受影响)
*/

-- b) List the name, displacement, and the number of guns of the ships engaged in the battle of Guadalcanal.

SELECT S.name, C.displacement, C.numGuns
FROM Outcomes O, Ships S, Classes C
WHERE O.battle = 'Guadalcanal' AND O.ship = S.name AND S.class = C.class;

/*
name                                                                                                                                                                                                     displacement         numGuns
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------- -------
Kirishima                                                                                                                                                                                                32000                8
Washington                                                                                                                                                                                               37000                9

(2 行受影响)
*/

-- Note:South Dakota was also engaged in battle of Guadalcanal but not chosen since
-- it is not in Ships table(Hence, no information regarding it's Class is
-- available).

-- c) List all the ships mentioned in the database. (Remember that all these ships may
--    not appear in the Ships relation.)

SELECT name
FROM Ships
UNION
SELECT ship
FROM Outcomes;

/*
name
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Arizona
Bismarck
California
Duke of York
Fuso
Haruna
Hiei
Hood
Iowa
King George V
Kirishima
Kongo
Missouri
Musashi
New Jersey
North Carolina
Prince of Wales
Ramillies
Renown
Repulse
Resolution
Revenge
Rodney
Royal Oak
Royal Sovereign
Scharnhorst
South Dakota
Tennessee
Washington
West Virginia
Wisconsin
Yamashito
Yamato

(33 行受影响)
*/


-- d) Find those countries that have both battleships and battlecruisers.

SELECT country
FROM Classes
WHERE type = 'bb'
INTERSECT
SELECT country
FROM Classes
WHERE type = 'bc'

/*
country
--------------------
Gt. Britain         
Japan               

(2 行受影响)
*/
