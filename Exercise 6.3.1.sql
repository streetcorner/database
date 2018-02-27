-- Exercise 2.4.1 
-- a
-- way 1
select maker
from product
where model in
	(select model
	from pc
	where speed>=3.0);

-- way 2
select maker
from product
where exists
	(select pc.model
	from pc
	where product.model=pc.model and pc.speed>=3.0);

-- answer
/*
"maker"
"B"
"B"
"E"
*/



-- b
-- way 1
select *
from printer
where price>=all
	(select price
	from printer);

-- way 2
select *
from printer
where not price<any
	(select price
	from printer);
	
-- answer
/*
"model"	"color"	"type"	"price"
"3003"	"10000000"	"laser"	"899.00"
*/



-- c
-- way 1
select *
from laptop
where speed<any
	(select speed
	from pc);

-- way 2
select *
from laptop
where not speed>all
	(select speed
	from pc);

-- answer
/*
"model"	"speed"	"ram"	"hd"	"screen"	"price"
"2001"	"2"	"2048"	"240"	"20.1"	"3673.00"
"2002"	"1.73"	"1024"	"80"	"17"	"949.00"
"2003"	"1.8"	"512"	"60"	"15.4"	"549.00"
"2004"	"2"	"512"	"60"	"13.3"	"1150.00"
"2005"	"2.16"	"1024"	"120"	"17"	"2500.00"
"2006"	"2"	"2048"	"80"	"15.4"	"1700.00"
"2007"	"1.83"	"1024"	"120"	"13.3"	"1429.00"
"2008"	"1.6"	"1024"	"120"	"15.4"	"900.00"
"2009"	"1.6"	"512"	"80"	"14.1"	"680.00"
"2010"	"2"	"2048"	"160"	"15.4"	"2300.00"
*/



-- d
-- way 1
select a1.model
from
	(SELECT model, price from pc
	union
	select model, price from laptop
	union
	select model, price from printer
	)a1
where a1.price>=all
	(select price from pc
	union
	select price from laptop
	union
	select price from printer);

-- way 2
select a1.model
from
	(SELECT model, price from pc
	union
	select model, price from laptop
	union
	select model, price from printer
	)a1
where not a1.price<any
	(select price from pc
	union
	select price from laptop
	union
	select price from printer);

-- answer
/*
"model"
"2001"
*/



-- e
-- way 1
select maker
from product
where model in
	(select model
	from printer
	where color=1 and price<=all
		(select price
		from printer
		where color=1)
	);

-- way 2
select maker
from product
where exists
	(select printer.model
	from printer
	where product.model=printer.model and color=1 and not price>any
		(select price
		from printer
		where color=1)
	);
-- answer
/*
"maker"
"E"
*/