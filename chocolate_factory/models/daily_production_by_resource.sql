select
    date_trunc('day', cl.timestamp) as date,
    cl.resource_id,
    sum(cl.quantity) as quantity
from mes_complete_logs cl
group by 1, 2
