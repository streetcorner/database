 Exercise 6.5.2
-- a
insert into classes value('Nelson', 'bb', 'British', 9, 16, 34000);
insert into ships value('Nelson', 'Nelson', '1927-01-01');
insert into ships value('Rodney', 'Nelson', '1927-01-01');


-- b
insert into classes value('Vittorio Veneto', 'bb', 'Italian', 9, 15, 41000);
insert into ships value('Vittorio Veneto', 'Vittorio Veneto', '1940-01-01');
insert into ships value('Italian', 'Vittorio Veneto', '1940-01-01');
insert into ships value('Roma', 'Vittorio Veneto', '1942-01-01');


-- c
delete ships, outcomes
from ships, outcomes
where ships.name=outcomes.ship and outcomes.result='sunk';


-- d
update classes
set bore=bore*2.5 and displacement=displacement*1.1;


-- e
delete
from classes
where class in
(
	select class
	from ships
	group by ships.class
	having count(ships.class)<3
);

delete
from ships
where class in
(
	select R.class
	from
	(
		select *
		from ships
	)R
	group by R.class
	having count(R.class)<3
);