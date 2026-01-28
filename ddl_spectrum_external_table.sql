CREATE EXTERNAL TABLE spectrum_raw.orders (
  id BIGINT,
  customer_id INT,
  product_sku VARCHAR(50),
  ts TIMESTAMP,
  region VARCHAR(50),
  category VARCHAR(50),
  status VARCHAR(50),
  quantity INT,
  unit_price DOUBLE PRECISION,
  discount_rate DOUBLE PRECISION,
  extended_price DOUBLE PRECISION,
  optional_score DOUBLE PRECISION
  -- Note: Omitting blob_a, blob_b, blob_c to reduce I/O for this lab
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://csed516-shared-resources-au2025-sharedclassbucket-mc0zal7gjcmu/class08/raw/'
TABLE PROPERTIES ('compressionType'='gzip');
