/*Exercise6.3.1*/

-- a
SELECT DISTINCT maker
FROM Product
WHERE model in
	(SELECT model
	FROM pc
	WHERE speed >= 3.0
	);
	
SELECT DISTINCT maker
FROM Product
WHERE EXISTS
	(SELECT model
	FROM pc
	WHERE speed >= 3.0 AND pc.model = product.model
	);

-- b
SELECT *
FROM Printer
WHERE price >= ALL
	(SELECT price
	FROM Printer 
	);
	
SELECT *
FROM Printer
WHERE not price < any
	(SELECT price
	FROM Printer 
	);
	
-- c
SELECT *
FROM LAPTOP
WHERE speed < ALL
	(SELECT speed
	FROM Pc 
	);

SELECT *
FROM laptop
WHERE not speed > any
	(SELECT speed
	FROM Pc 
	);
	
-- d

SELECT aaa.model
FROM 
		(SELECT price,model FROM pc
			union
		SELECT price,model FROM printer
			union
		SELECT price,model FROM laptop
		 )aaa
WHERE aaa.price >= all
		(SELECT price FROM pc
			union
		SELECT price FROM printer
			union
		SELECT price FROM laptop
		 );
		 
SELECT aaa.model
FROM 
		(SELECT price,model FROM pc
			union
		SELECT price,model FROM printer
			union
		SELECT price,model FROM laptop
		 )aaa
WHERE not aaa.price < any
		(SELECT price FROM pc
			union
		SELECT price FROM printer
			union
		SELECT price FROM laptop
		 );	

-- e
select maker
from product 
where model in
	(select model
	from printer
	where color = 1 and price <= all
									(select price
									from printer
									where color = 1)
);

select maker
from product 
where exists
	(select model
	from printer
	where product.model = printer.model and not price > any
									(select price
									from printer
									where color = 1)
);
