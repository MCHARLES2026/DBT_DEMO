with CTE as (
    select
        try_to_timestamp(replace(started_at, '"', '')) as started_at,
        date(try_to_timestamp(replace(started_at, '"', ''))) as date_started_at,
        hour(try_to_timestamp(replace(started_at, '"', ''))) as hour_started_at,
        dayname(try_to_timestamp(replace(started_at, '"', ''))) as dayname,

        case
            when dayname(try_to_timestamp(replace(started_at, '"', ''))) in ('Sat', 'Sun') then 'WEEKEND'
            else 'BUSINESSDAY'
        end as day_type,

        {{ get_season("replace(started_at, '\"', '')") }} as season_of_year
    from {{ ref('stg_bike') }}
    where started_at <> 'STARTED_AT'
)

select
    *
from CTE