with daily_weather as (

    select
        date(time) as daily_weather,
        weather,
        temp,
        pressure,
        humidity,
        clouds
    from {{ source('demo', 'WEATHER') }}

),

daily_weather_agg as (

   select
    daily_weather,
    weather,
    avg(temp) as avg_temp,
    avg(pressure) as avg_pressure,
    avg(humidity) as avg_humidity,
    avg(clouds) as avg_clouds
from daily_weather
    group by daily_weather, weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC)=1
)

select
    *
from daily_weather_agg

