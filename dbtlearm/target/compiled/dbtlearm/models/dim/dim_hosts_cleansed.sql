-- Change Tables for views

WITH  __dbt__cte__src_host as (
WITH raw_hosts AS(
	SELECT * FROM airbnb.raw.raw_hosts
)
SELECT
	id AS host_id,
    name AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
	raw_hosts
),src_hosts AS(
    SELECT * FROM  __dbt__cte__src_host
)
SELECT
    host_id,
    NVL(
        host_name, 
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
	src_hosts