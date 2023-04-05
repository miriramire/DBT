-- Incremental Materialization
{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}
WITH src_reviews AS (
    SELECt * FROM {{ ref('src_reviews')}}
)
SELECT
    -- It creates a unique identifier
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} as review_id,
    *
FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
  AND review_date > (SELECT MAX(review_date) FROM {{this}})
{% endif %}