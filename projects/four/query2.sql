-- For each category of film, find the name of the category (as "category_name") and the count of films (as "number_of_films") that MAE HOFFMAN has stared in within that category. 
-- Order by the category name in descending order. 
-- (Note: your query should return every category even if MAE has been in no films in that category--i.e., her count is 0 for "number_of_films" for that respective "category_name").

-- Put query for Q2 here

SELECT 
    c.name AS category_name, 
    SUM(CASE WHEN a.first_name = 'MAE' AND a.last_name = 'HOFFMAN' THEN 1 ELSE 0 END) AS number_of_films
FROM 
    category c
LEFT JOIN 
    film_category fc ON c.category_id = fc.category_id
LEFT JOIN 
    film f ON fc.film_id = f.film_id
LEFT JOIN 
    film_actor fa ON f.film_id = fa.film_id
LEFT JOIN 
    actor a ON fa.actor_id = a.actor_id
GROUP BY 
    c.category_id, 
    c.name
ORDER BY 
    category_name DESC;

