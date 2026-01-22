with TRIP as (

    select
     RIDE_ID,
        RIDEABLE_TYPE,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
        start_station_id,
        start_station_name,
        END_STATION_ID,
        MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS,
    from {{ source('demo', 'BIKE') }}
limit 10


)

select
    *
from TRIP
