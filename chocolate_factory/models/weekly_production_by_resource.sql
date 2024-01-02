select date_trunc('week', cl.date) as date, cl.resource_id, sum(cl.quantity) as quantity
from {{ ref("daily_production_by_resource") }} cl
group by 1, 2
