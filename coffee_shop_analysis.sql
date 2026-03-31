
SELECT*
FROM  workspace.default.`coffee-shop`
LIMIT 15;
----------------------------------------------------------
----------------------------------------------------------
--l want to determine the time period covered by the dataset
SELECT
      MIN(transaction_date) AS start_date,
      MAX(transaction_date) AS end_date
      FROM workspace.default.`coffee-shop`;
----------------------------------------------------
----------------------------------------------------
      -- l want to identify how many stores are operating
      SELECT
            COUNT(DISTINCT store_id) AS total_stores
      FROM   workspace.default.`coffee-shop`;
----------------------------------------------------
----------------------------------------------------
--l want to list all store locations
SELECT DISTINCT store_location
FROM  workspace.default.`coffee-shop`; 
----------------------------------------------------
----------------------------------------------------
--l want to explore different product offerings
SELECT DISTINCT
      product_category
      product_type
FROM  workspace.default.`coffee-shop`; 
------------------------------------------------------
------------------------------------------------------
--l want to analyze the pricing range of products
SELECT
     MIN(unit_price) AS lowest_price,
     MAX(unit_price) AS highest_price
FROM  workspace.default.`coffee-shop`;
-----------------------------------------------------
-----------------------------------------------------
--l want to summarise key dataset metrics 
SELECT
     COUNT(*) AS total_rows,
     COUNT(DISTINCT transaction_id) AS total_transactions,
     COUNT(DISTINCT product_id) AS unique_products,
     COUNT(DISTINCT store_id) AS total_stores
FROM workspace.default.`coffee-shop`;
--------------------------------------------------------
--------------------------------------------------------
--l want to analyse daily sales performance
SELECT
    transaction_date,
    DAYNAME(transaction_date) AS day_of_week,
    COUNT(distinct transaction_id) AS total_sales,
    SUM(transaction_qty *unit_price) AS daily_revenue
FROM workspace.default.`coffee-shop`
GROUP BY  transaction_date, day_of_week
ORDER BY   transaction_date;
----------------------------------------------------------
----------------------------------------------------------
--l want to evaluate monthly revenue trends
SELECT
     MONTHNAME(transaction_date) AS month,
     SUM(transaction_qty * unit_price) AS revenue
FROM workspace.default.`coffee-shop`
GROUP BY MONTHNAME(transaction_date)
ORDER BY revenue DESC;



  

