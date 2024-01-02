select *
from
    (
        select
            product_id,
            operation_name,
            sequence,
            rank() over (partition by product_id order by sequence desc) as rank
        from erp_routes
    ) as a
where a.rank = 1
