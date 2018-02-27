 Exercise 6.5.1
-- a
insert into product value('C', '1100', 'pc');
insert into pc value('1100', 3.2, 1024, 180, 2499);


-- b
insert into product
select maker, model+1100, 'laptop'
from product
where type='pc';

insert into laptop
select model+1100, speed, ram, hd, 17, price+500
from pc;


-- c
delete from pc
where hd<100;


-- d
delete
from laptop
where laptop.model in
(
	select model
	from product
	where maker not in
	(
		select distinct maker
		from product
		where type='printer'
	)
);

delete
from product
where type='laptop' and maker not in
(
	select R.maker
	from
	(
		select *
		from product
		where type='printer'
	)R
);


-- e
update product
set maker='A'
where maker='B';


-- f
update pc
set ram=2*ram and hd=hd+60;


-- g
update laptop
set laptop.screen=laptop.screen+1 and laptop.price=laptop.price-100
where model in
(
	select model
	from product
	where type='laptop' and maker='B'
);