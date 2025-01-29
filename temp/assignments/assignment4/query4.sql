-- Find the actor_id, first_name, and last_name of all actors who have never been in an Animation film. 
-- Order by the actor_id in ascending order.

-- Put your query for Q4 here

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
LEFT JOIN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Animation'
) AS anim ON a.actor_id = anim.actor_id
WHERE anim.actor_id IS NULL
ORDER BY a.actor_id;
