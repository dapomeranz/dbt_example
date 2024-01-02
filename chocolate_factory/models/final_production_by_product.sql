select
  p.id as product_id,
  p.product_name,
  wo.id,
  cl.quantity,
  p.uom
from
  mes_complete_logs cl
  inner join erp_work_orders wo on cl.work_order_id = wo.id
  inner join erp_products p on wo.product_id = p.id
  inner join mes_resources r on cl.resource_id = r.id
  inner join mes_operations o on r.operation_id = o.id
  inner join {{ref('product_last_operation')}} plo on o.operation_name = plo.operation_name
  and p.id = plo.product_id
