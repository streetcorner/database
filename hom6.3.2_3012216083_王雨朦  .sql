
/*Exercise6.3.2*/

-- a
SELECT country
FROM Classes
WHERE numGuns >=all
	(select numGuns
	from classes);

SELECT country
FROM Classes
WHERE not numGuns < any
	(select numGuns
	from classes);
	
-- b
SELECT class
FROM Ships
WHERE name in
	(select ship
	from outcomes
	where result = 'sunk');
	
SELECT class
FROM Ships
WHERE exists
	(select ship
	from outcomes
	where result = 'sunk' and ship = name);

-- c
SELECT name
FROM ships
WHERE class in
	(select class
	from classes
	where bore = 16);
	
SELECT name
FROM ships
WHERE exists
	(select class
	from classes
	where bore = 16 and classes.class = ships.class);

-- d
SELECT battle
FROM outcomes
WHERE ship in
	(SELECT name
	from ships
	where class = 'Kongo');
	
SELECT battle
FROM outcomes
WHERE exists
	(SELECT name
	from ships
	where class = 'Kongo' and ships.name = outcomes.ship);