
-- Create the database first.

USE master;
GO

IF DB_ID('MoviesDB') IS NOT NULL
DROP DATABASE MoviesDB;
GO

CREATE DATABASE MoviesDB;
GO

USE MoviesDB;

CREATE TABLE Movies (
    title		CHAR(100),
	year		INT,
    length		INT,
    genre		CHAR(10),
    studioName	CHAR(30),
    producerC	INT,
    PRIMARY KEY (title, year)
);

CREATE TABLE MovieStar (
    name		CHAR(30),
	address		VARCHAR(255),
    gender		CHAR(1),
    birthdate	CHAR(10),
    PRIMARY KEY (name)
);

CREATE TABLE StarsIn (
    movieTitle	CHAR(100),
    movieYear	INT,
    starName	CHAR(30),
	PRIMARY KEY (movieTitle, movieYear, starName)
);

CREATE TABLE MovieExec (
    name		CHAR(30),
    address		VARCHAR(255),
    cert		INT		PRIMARY KEY,
    netWorth	INT
);

CREATE TABLE Studio (
    name		CHAR(50)	PRIMARY KEY,
    address		VARCHAR(255),
    presC		INT
);

INSERT INTO Movies VALUES ('Logan''s run', 1976, NULL, 'sciFi', 'MGM', 123);
INSERT INTO Movies VALUES ('Star Wars', 1977, 124, 'sciFi', 'Fox', 555);
INSERT INTO Movies VALUES ('Empire Strikes Back', 1980, 111, 'fantasy', 'Fox', 555);
INSERT INTO Movies VALUES ('Star Trek', 1979, 132, 'sciFi', 'Paramount', 345);
INSERT INTO Movies VALUES ('Star Trek: Nemesis', 2002, 116, 'sciFi', 'Paramount', 345);
INSERT INTO Movies VALUES ('Terms of Endearment', 1983, 132, 'romance', 'MGM', 123);
INSERT INTO Movies VALUES ('The Usual Suspects', 1995, 106, 'crime', 'MGM', 456);
INSERT INTO Movies VALUES ('Gone With the Wind', 1938, 238, 'drama', 'MGM', 123);
INSERT INTO Movies VALUES ('Wayne''s World', 1992, 95, 'comedy', 'Paramount', 123);
INSERT INTO Movies VALUES ('King Kong', 2005, 187, 'drama', 'Universal', 789);
INSERT INTO Movies VALUES ('King Kong', 1976, 134, 'drama', 'Paramount', 666);
INSERT INTO Movies VALUES ('King Kong', 1933, 100, 'drama', 'Universal', 345);
INSERT INTO Movies VALUES ('Pretty Woman', 1990, 119, 'comedy', 'Disney', 999);

INSERT INTO MovieStar VALUES ('Jane Fonda', 'Turner Av.', 'F', '1977-07-07');
INSERT INTO MovieStar VALUES ('Alec Baldwin', 'Baldwin Av.', 'M', '1977-06-07');
INSERT INTO MovieStar VALUES ('Kim Basinger', 'Baldwin Av.', 'F', '1979-05-07');
INSERT INTO MovieStar VALUES ('Harrison Ford', 'Beverly Hills', 'M', '1977-07-07');
INSERT INTO MovieStar VALUES ('Carrie Fisher', '123 Maple St.', 'F', '1999-09-09');
INSERT INTO MovieStar VALUES ('Mark Hamill', '456 Oak Rd.', 'M', '1988-08-08');
INSERT INTO MovieStar VALUES ('Debra Winger', 'A way', 'F', '1978-05-06');
INSERT INTO MovieStar VALUES ('Jack Nicholson', 'X path', 'M', '1949-05-05');
INSERT INTO MovieStar VALUES ('Kevin Spacey', 'New York Av.', 'F', '1937-12-21');

INSERT INTO StarsIn VALUES ('Star Wars', 1977, 'Carrie Fisher');
INSERT INTO StarsIn VALUES ('Star Wars', 1977, 'Mark Hamill');
INSERT INTO StarsIn VALUES ('Star Wars', 1977, 'Harrison Ford');
INSERT INTO StarsIn VALUES ('Empire Strikes Back', 1980, 'Harrison Ford');
INSERT INTO StarsIn VALUES ('The Usual Suspects', 1995, 'Kevin Spacey');
INSERT INTO StarsIn VALUES ('Terms of Endearment', 1983, 'Debra Winger');
INSERT INTO StarsIn VALUES ('Terms of Endearment', 1983, 'Jack Nicholson');

INSERT INTO MovieExec VALUES ('George Lucas', 'Oak Rd.', 555, 200000000);
INSERT INTO MovieExec VALUES ('Ted Turner', 'Turner Av.', 333, 125000000);
INSERT INTO MovieExec VALUES ('Stephen Spielberg', '123 ET road', 222, 100000000);
INSERT INTO MovieExec VALUES ('Merv Griffin', 'Riot Rd.', 199, 112000000);
INSERT INTO MovieExec VALUES ('Calvin Coolidge', 'Fast Lane', 123, 20000000);
INSERT INTO MovieExec VALUES ('Garry Marshall', 'First Street', 999, 50000000);
INSERT INTO MovieExec VALUES ('J.J. Abrams', 'High Road', 345, 45000000);
INSERT INTO MovieExec VALUES ('Bryan Singer', 'Downtown', 456, 70000000);
INSERT INTO MovieExec VALUES ('George Roy Hill', 'Baldwin Av.', 789, 20000000);
INSERT INTO MovieExec VALUES ('Dino De Laurentiis', ' Beverly Hills', 666, 120000000);

INSERT INTO Studio VALUES ('MGM','MGM Boulevard', 123);
INSERT INTO Studio VALUES ('Fox', 'Hollywood', 555);
INSERT INTO Studio VALUES ('Disney', 'Buena Vista', 999);
INSERT INTO Studio VALUES ('Paramount', 'Hollywood', 345);
INSERT INTO Studio VALUES ('Universal', 'Hollywood', 789);

SELECT * FROM Movies;
SELECT * FROM MovieStar;
SELECT * FROM StarsIn;
SELECT * FROM MovieExec;
SELECT * FROM Studio;



-- Exercise 6.1.2

-- a) Find the address of MGM studios.

SELECT address
FROM Studio
WHERE name = 'MGM';


-- b) Find Sandra Bullock's birthdate.

SELECT birthdate
FROM MovieStar
WHERE name = 'Sandra Bullock';


-- c) Find all the stars that appeared either in a movie made in 1980 or a movie with "Love" in the title.

SELECT starName
FROM StarsIn
WHERE movieYear = 1980 OR movieTitle LIKE '%Love%';

-- However, above query will also return words that have the substring Love e.g.
-- Lover. Below query will only return movies that have title containing the word
-- Love.
SELECT starName
FROM StarsIn
WHERE movieYear = 1980
	OR movieTitle LIKE 'Love %'
	OR movieTitle LIKE '% Love %'
	OR movieTitle LIKE '% Love'
	OR movieTitle = 'Love';


-- d) Find all executives worth at least $10,000,000

SELECT name
FROM MovieExec
WHERE netWorth >= 10000000;


-- e) Find all the stars who either are male or live in Malibu (have string Malibu as a part of their address).

SELECT name
FROM MovieStar
WHERE gender = 'M' OR address LIKE '% Malibu %';



-- Exercise 6.2.1

-- a) Who were the male stars in Titanic?
SELECT M.name
FROM StarsIn S, MovieStar M
WHERE S.starName = M.name AND S.movieTitle = 'Titanic' AND M.gender = 'M';


-- b) Which stars appeared in movies produced by MGM in 1995
SELECT S.starName
FROM Movies M, Studio T, StarsIn S 
WHERE M.year = 1995 AND T.name ='MGM' AND
	  S.movieTitle = M.title AND
	  M.studioName = T.name;


-- c) Who is the president of MGM studios?
SELECT M.name
FROM MovieExec M, Studio S
WHERE M.cert = S.presC AND S.name = 'MGM';


-- d) Which movies are longer than Gone With the Wind?
SELECT M1.title 
FROM Movies M1, Movies M2
WHERE M1.length > M2.length AND M2.title = 'Gone With the Wind';


-- e) Which executives are worth more than Merv Griffin?
SELECT R1.name
FROM MovieExec R1, MovieExec R2
WHERE R1.netWorth > R2.netWorth AND R2.name = 'Merv Griffin';
