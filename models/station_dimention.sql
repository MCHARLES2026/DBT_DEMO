with CTE as (

    select
    distinct
        start_station_id,
        start_station_name,
        start_lat,
        start_lng
    from {{ source('demo', 'BIKE') }}
limit 10

)

select
    *
from CTE