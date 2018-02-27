
/*Exercise6.4.6*/

-- a
SELECT avg(speed)
FROM Pc;
/*result
"avg(speed)"
2.4846153809474
*/

-- b
select avg(speed)
from laptop
where price>1000.00;
/*result
"avg(speed)"
1.998333354791
*/
-- c
select avg(price)
from pc
where model in
	(select model
	from product
	where maker = 'A' and type = 'pc') ;
/*result
"avg(price)"
"1195.666667"
*/

-- d
SELECT avg(price)
FROM 
	(select model,price from pc
		union
  	select model,price from laptop
	)aaa
WHERE aaa.model in 
 	(select model
	 from product
	 where maker = 'D')
;
/*result
"avg(price)"
"730.000000"
*/

-- e
SELECT speed,avg(price)
FROM PC 
group by speed;
/*result
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
select maker,avg(screen)
from product join laptop on product.model = laptop.model
group by maker;
/*result
"maker"	"avg(screen)"
"A"	"15.233333269755045"
"B"	"13.300000190734863"
"E"	"17.5"
"F"	"14.75"
"G"	"15.399999618530273"
*/

-- g
select maker
from product
where type = 'pc'
group by maker
having count(model)>=3;
/*result
"maker"
"A"
"B"
"D"
"E"
*/

select maker,max（price）
from product join pc on pc.model = product.model
group by maker;
"maker"	"max(price)"
"A"	"2114.00"
"B"	"1049.00"
"C"	"510.00"
"D"	"770.00"
"E"	"959.00"
*/

-- i
select speed,avg(price)
from pc
where speed >2.0
group by speed;
 
/*result
"speed"	"avg(price)"
"2.1"	"995.000000"
"2.2"	"640.000000"
"2.66"	"2114.000000"
"2.8"	"689.333333"
"3.06"	"529.000000"
"3.2"	"839.500000"
*/