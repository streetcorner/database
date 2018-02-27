
/*
exercise6.1.4*/
-- Create the database first.

CREATE DATABASE ShipBattle;

USE ShipBattle;
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
    name		VARCHAR(200),
	date		DATE,
    PRIMARY KEY (name)
);

-- d) A schema for relation Outcomes

CREATE TABLE Outcomes (
    ship		VARCHAR(200),
	battle		VARCHAR(200),
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

-- SELECT * FROM Classes;
-- SELECT * FROM Ships;
-- SELECT * FROM Battles;
-- SELECT * FROM Outcomes;

-- a
SELECT class,country
FROM Classes
WHERE numGuns >= 10;
/*result
class         country
Tennessee     USA
*/

-- b
SELECT name AS shipname
FROM Ships
WHERE launched < '1918-01-01';
/*result
shipname
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
*/

-- c
SELECT ship,battle
FROM Outcomes
WHERE result = 'sunk';
/*result
ship               battle
Arizona          Pearl Harbor
Bismarck         Denmark Strait
Fuso             Surigao Strait
Hood             Denmark Strait
Kirishima        Guadalcanal
Scharnhorst      North Cape
Yamashito        Surigao Strait
*/

-- d
SELECT name
FROM Ships
WHERE name = class;
/*result
name
Iowa
Kongo
North Carolina
Renown
Revenge
Tennessee
Yamato
*/

-- e
(SELECT ship
FROM Outcomes
WHERE ship LIKE 'R%')
	UNION
(SELECT name AS ship
FROM Ships
WHERE name LIKE 'R%');
/*result
ship
Rodney
Ramillies
Renown
Repulse
Resolution
Royal Oak
Royal Sovereign
*/

-- f
(SELECT ship
FROM Outcomes
WHERE ship LIKE '% % %')
	UNION
(SELECT name AS ship
FROM Ships
WHERE name LIKE '% % %');
/*result
ship
Duke of York
King George V
Prince of Wales
*/
