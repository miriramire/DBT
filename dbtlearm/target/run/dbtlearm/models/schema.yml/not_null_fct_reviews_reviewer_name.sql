select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select reviewer_name
from airbnb.dev.fct_reviews
where reviewer_name is null



      
    ) dbt_internal_test