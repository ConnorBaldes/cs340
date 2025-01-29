-- Find the title (as "film_title") of all films which feature both RALPH CRUZ and WILL WILSON. 
-- Order the results by film_title in ascending order.

-- Put your query for Q5 here.

SELECT f.title AS film_title
FROM film f
JOIN film_actor fa1 ON f.film_id = fa1.film_id
JOIN actor a1 ON fa1.actor_id = a1.actor_id
JOIN film_actor fa2 ON f.film_id = fa2.film_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id
WHERE (a1.first_name = 'RALPH' AND a1.last_name = 'CRUZ') AND (a2.first_name = 'WILL' AND a2.last_name = 'WILSON')
ORDER BY f.title ASC;
