with CTE AS (
    select 
    t.* ,
    w.*
    from {{ ref('trips_dimention') }} t
    left join {{ ref('daily_weather') }} w
    on t.trip_date=w.daily_weather
)

select 
*
 from CTE