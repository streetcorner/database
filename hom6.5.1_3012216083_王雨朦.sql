
/*Exercise6.5.1*/

-- a
insert into product values (c,1100,pc)
insert into pc values(1100,3.2,1024,180,2499);
-- b
insert into product
	(select maker,model+1100,type ='laptop'
	from product
	where type ='pc')
	
insert into laptop
	(select model+1100,speed,ram,hd,17,price+500
	from pc);


-- c
delete from pc
where hd<100;


-- d
delete from product
where type = 'laptop' and maker not in 
		(select distinct maker
		from product
		where type = 'printer');
		
delete from laptop
where maker not in 
	(select distinct maker
	from printer);
	
-- e
update product
set model = 'A'
where model = 'B';

-- f
update pc
set ram= ram*2 and hd= hd+60;

-- g
update laptop
set screen = screen + 1 and price = price - 100
where model in
		(select model
		from product
		where maker = 'B'and type = 'laptop');