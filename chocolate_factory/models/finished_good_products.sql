select distinct p.*
from {{ source("chocolate-factory", "erp_products") }} as p
inner join {{ ref("final_production_by_product") }} as fpbp on p.id = fpbp.product_id
