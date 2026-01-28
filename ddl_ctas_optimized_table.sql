CREATE TABLE optimized_orders
DISTSTYLE AUTO
SORTKEY(ts, category, region)
AS
SELECT
  id,
  customer_id,
  product_sku,
  ts,
  region,
  category,
  status,
  quantity,
  unit_price,
  discount_rate,
  extended_price,
  optional_score
FROM spectrum_raw.orders;
