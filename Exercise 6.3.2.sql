-- Exercise 6.3.2
-- a
-- way 1
select country
from classes
where numguns >= all
	(select numguns
	from classes);
	
-- way 2	
select country
from classes
where not numguns < any
	(select numguns
	from classes);

-- answer
/*
"country"
"USA"
*/	



-- b
-- way 1
select class
from ships
where name in
	(select ship as name
	from outcomes
	where result='sunk');
	
-- way 2
select class
from ships
where exists
	(select ship
	from outcomes
	where result='sunk' and outcomes.ship=ships.name);
-- answer
/*
"class"
"Kongo"
*/



-- c
-- way 1
select name
from ships
where class in
	(select class
	from classes
	where bore=16);
-- way 2
select name
from ships
where exists
	(select class
	from classes
	where classes.class=ships.class and bore=16);
-- answer
/*
"name"
"Iowa"
"Missouri"
"New Jersey"
"Wisconsin"
"North Carolina"
"Washington"
*/



-- d
-- way 1
select battle
from outcomes
where ship in
	(select name
	from ships
	where class='Kongo');
-- way 2
select battle
from outcomes
where exists
	(select name
	from ships
	where outcomes.ship=ships.name and class='Kongo');
-- answer
/*
"battle"
"Guadalcanal"
*/