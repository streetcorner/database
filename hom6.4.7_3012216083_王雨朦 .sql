
/*Exercise6.5.1*/

-- a
SELECT count(class)
FROM classes
where type = 'bb';
/*result
"count(class)"
"6"
*/

-- b
select avg(numguns)
from classes
where type ='bb';

-- c
select avg(numGuns)
from classes join ships on classes.class = ships.class
where type ='bb';


-- d
SELECT class,MIN(launched)
FROM ships
group by class;



-- e
SELECT class,count(name)
FROM ships
where name in
	(select ship
	from outcomes
	where result ='sunk')
group by class;
