use project_movie_database;
--  reading the data
select * from directors;
select * from movies;

-- a)	Can you get all data about movies?
select * from movies;

-- b)	How do you get all data about directors?
select * from directors;

-- c)	Check how many movies are present in IMDB.
select count(original_title) from movies ;

-- d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors where name in('James Cameron' , 'Luc Besson' , 'John Woo');

-- e)	Find all directors with name starting with Steven.
select name from directors where name like 'Steven%';

-- f)	Count female directors.
select count(gender) from directors where gender=1;

-- g)	Find the name of the 10th first women directors?
select name from directors where gender=1 order by name desc limit 10;

-- h)	What are the 3 most popular movies?
select original_title, popularity from movies order by popularity desc limit 3;

-- i)	What are the 3 most bankable movies?
select original_title, revenue  from movies order by revenue desc limit 3;

-- j)	What is the most awarded average vote since the January 1st, 2000?
select original_title, vote_average from movies where release_date between '2000-01-01' and '2023-01-01' order by vote_average desc ;

-- k)	Which movie(s) were directed by Brenda Chapman?
select directors.name, movies.original_title from movies 
join directors on movies.director_id = directors.id 
where name='Brenda Chapman'; 


-- l)	Whose director made the most movies?
select directors.name, count(movies.original_title) as count_movie from movies
join directors on movies.director_id = directors.id
group by directors.name order by count_movie desc;


-- m)	Whose director is the most bankable?
select directors.name, movies.revenue from movies
join directors on movies.director_id = directors.id
order by movies.revenue desc limit 1;