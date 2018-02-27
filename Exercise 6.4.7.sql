-- Exercise 6.4.7
-- a
select count(class)
from classes
where type='bb';
/*result
"count(class)"
"6"
*/



-- b
select avg(numguns)
from classes
where type='bb';
g
/*result
"avg(numguns)"
"9.1667"
*/



-- c
select avg(numguns)
from classes join ships on classes.class=ships.class
where type='bb';
/*result
"avg(numguns)"
"9.0667"
*/



-- d
SELECT class, MIN(launched)
FROM ships
GROUP BY class;
/*result
"class"	"MIN(launched)"
"Iowa"	"1943-01-01"
"Kongo"	"1913-01-01"
"North Carolina"	"1941-01-01"
"Renown"	"1916-01-01"
"Revenge"	"1916-01-01"
"Tennessee"	"1920-01-01"
"Yamato"	"1941-01-01"
*/



-- e
select class, count(class)
from ships
where name in
	(select ship
	from outcomes
	where result='sunk'
	)
group by class;
/*result
"class"	"count(class)"
"Kongo"	"1"
*/