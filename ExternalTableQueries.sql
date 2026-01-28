-- Count rows (will scan all S3 files)
SELECT COUNT(*) FROM spectrum_raw.orders;

-- Spot-check sample data
SELECT id, customer_id, product_sku, ts, category, region, extended_price
FROM spectrum_raw.orders
LIMIT 10;

-- Check date range coverage
SELECT
  MIN(ts) as earliest_order,
  MAX(ts) as latest_order,
  COUNT(DISTINCT DATE_TRUNC('month', ts)) as month_count
FROM spectrum_raw.orders;
