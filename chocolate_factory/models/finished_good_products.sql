select p.* from erp_products p
inner join {{ref('final_production_by_product')}} fpbp on p.id = fpbp.product_id
