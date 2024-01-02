select p.id as product_id, p.product_name, wo.id, cl.quantity, p.uom
from mes_complete_logs as cl
inner join erp_work_orders as wo on cl.work_order_id = wo.id
inner join erp_products as p on wo.product_id = p.id
inner join mes_resources as r on cl.resource_id = r.id
inner join mes_operations as o on r.operation_id = o.id
inner join
    {{ ref("product_last_operation") }} as plo
    on o.operation_name = plo.operation_name
    and p.id = plo.product_id
