select
    date_trunc('day', cl.timestamp) as date,
    cl.resource_id,
    sum(cl.quantity * coalesce(uom.conversion_rate, 1)) as quantity
from {{ source("chocolate-factory", "mes_complete_logs") }} cl
inner join
    {{ source("chocolate-factory", "erp_work_orders") }} wo on cl.work_order_id = wo.id
left join {{ ref("uom_conversions") }} uom on uom.product_id = wo.product_id
group by 1, 2
