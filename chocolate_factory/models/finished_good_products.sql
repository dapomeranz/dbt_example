select distinct p.*
from erp_products as p
inner join {{ ref("final_production_by_product") }} as fpbp on p.id = fpbp.product_id
