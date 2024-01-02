-- models/daily_yield_by_resource_test.sql
-- Test to ensure that yield_rate is never greater than 100
select * from {{ ref("daily_yield_by_resource") }} where "yield_rate (%)" > 100
