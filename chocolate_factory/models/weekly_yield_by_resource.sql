select
    p.date,
    p.resource_id,
    p.quantity - coalesce(s.quantity, 0) as net_yield,
    p.quantity as gross_production,
    s.quantity as gross_scrap,
    round(
        coalesce((p.quantity - coalesce(s.quantity, 0)) / p.quantity, 1) * 100
    ) as "yield_rate (%)"
from {{ ref("weekly_production_by_resource") }} p
left join
    {{ ref("weekly_scrap_by_resource") }} s
    on p.resource_id = s.resource_id
    and p.date = s.date
