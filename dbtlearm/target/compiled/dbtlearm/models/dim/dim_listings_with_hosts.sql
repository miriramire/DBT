WITH
l AS (
    SELECT *
    FROM airbnb.dev.dim_listings_cleansed
),
h AS (
    SELECT *
    FROM airbnb.dev.dim_hosts_cleansed
)
SELECT
    l.listing_id,
    l.listing_name,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM l
LEFT JOIN h 
ON h.host_id = l.host_id