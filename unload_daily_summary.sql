UNLOAD (
    'SELECT 
        DATE(ts) as order_date,
        category,
        COUNT(*) as order_count,
        SUM(extended_price) as daily_revenue,
        AVG(discount_rate) as avg_discount,
        CASE 
            WHEN SUM(extended_price) > 25000000 THEN ''high''
            WHEN SUM(extended_price) < 700000 THEN ''low''
            ELSE ''normal''
        END as revenue_flag
    FROM optimized_orders
    GROUP BY DATE(ts), category
    ORDER BY order_date, category'
)
TO 's3://au2025-csed516-vaishver/lab08/redshift_lab/daily_summary/'
IAM_ROLE 'arn:aws:iam::917777418654:role/LabRole'
FORMAT AS PARQUET
PARTITION BY (revenue_flag)
ALLOWOVERWRITE;