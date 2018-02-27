
/*Exercise6.5.1*/

-- a
insert into ships values(Nelson,Nelson,1942-01-01)
insert into ships values(Rodney,Nelson,1942-01-01)
insert into classes values(Nelson,bb,Gt. Britain,9,16,34000);

-- b
insert into ships values(Vittorio Veneto,Vittorio Veneto,1940-01-01)
insert into ships values(Italia,Vittorio Veneto,1940-01-01)
insert into ships values(Roma,Vittorio Veneto,1942-01-01)
insert into classes values(Vittorio Veneto,bb,Italy,9,15,41000);

-- c
delete from ships
where name in
	(select ship 
	from outcomes 
	where result = 'sunk');

-- d
update classes
set bore = bore*2.5 and displacement = displacement /1.1;
	
-- e
delete from ships
where class in 
	(select class
	form ships
	group by class
	having count(name)<3);
	
delete from classes
where class in
	(select class 
	from ships
	group by class
	having count(name)<3); 
