-- models/daily_yield_by_resource_test.sql
-- Test to ensure that yield_rate is never greater than 100
SELECT
  *
FROM {{ ref('daily_yield_by_resource') }}
WHERE "yield_rate (%)" > 100
