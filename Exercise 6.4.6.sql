-- Exercise 6.4.6
-- a
select avg(speed)
from pc;
-- answer
/*
"avg(speed)"
"2.4846153809474063"
*/



-- b
select avg(speed)
from laptop
where price>1000;
-- answer
/*
"avg(speed)"
"1.9983333547910054"
*/



-- c
select avg(price)
from pc
where model in
	(select model
	from product
	where type='pc' and maker='A');
-- answer	
/*
"avg(price)"
"1195.666667"
*/



-- d
select avg(price)
from 
	(select price, model
	from pc
	union
	select price, model
	from laptop
	)R
where R.model in
	(
	select model
	from product
	where maker='D');
-- answer
/*
"avg(price)"
"730.000000"
*/



-- e
select speed, avg(price)
from pc
group by speed;
-- answer
/*
"speed"	"avg(price)"
"1.42"	"478.000000"
"1.86"	"959.000000"
"2"	"650.000000"
"2.1"	"995.000000"
"2.2"	"640.000000"
"2.66"	"2114.000000"
"2.8"	"689.333333"
"3.06"	"529.000000"
"3.2"	"839.500000"
*/



-- f
select maker, avg(screen)
from product join laptop on product.model=laptop.model
group by maker;
-- answer
/*
"maker"	"avg(screen)"
"A"	"15.233333269755045"
"B"	"13.300000190734863"
"E"	"17.5"
"F"	"14.75"
"G"	"15.399999618530273"
*/



-- g
select maker
from product join pc on product.model=pc.model
group by maker
having count(product.model)>=3;
-- answer
/*
"maker"
"A"
"B"
"D"
"E"
*/



-- h
select maker, max(price)
from product join pc on product.model=pc.model
group by maker
-- answer
/*
"maker"	"max(price)"
"A"	"2114.00"
"B"	"1049.00"
"C"	"510.00"
"D"	"770.00"
"E"	"959.00"
*/



-- i
select speed, avg(price)
from pc
where speed>2.0
group by speed;
-- answer
/*
"speed"	"avg(price)"
"2.1"	"995.000000"
"2.2"	"640.000000"
"2.66"	"2114.000000"
"2.8"	"689.333333"
"3.06"	"529.000000"
"3.2"	"839.500000"
*/