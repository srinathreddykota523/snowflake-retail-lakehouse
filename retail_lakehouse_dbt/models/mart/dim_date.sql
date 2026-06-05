with date_spine as (

    select

        dateadd(
            day,
            seq4(),
            '2016-01-01'
        ) as date_day

    from table(
        generator(rowcount => 5000)
    )

)

select

    row_number() over(
        order by date_day
    ) as date_key,

    date_day,

    year(date_day) as year,

    quarter(date_day) as quarter,

    month(date_day) as month,

    day(date_day) as day

from date_spine