with CTE as (

    select
    distinct
        start_station_id,
        start_station_name,
        start_lat,
        start_lng
    from {{ ref('stg_bike') }}
limit 10

)

select
    *
from CTE