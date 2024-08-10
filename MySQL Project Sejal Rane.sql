Create database project;
Use project;
select *from master_data_csv;
select count(*) from master_data_csv;

SELECT 
`Weekday/Weekend`,
    COUNT(*) AS total_orders,
    SUM(`olist_order_payments_dataset.payment_value`) AS total_payment,
    AVG(`olist_order_payments_dataset.payment_value`) AS avg_payment
FROM 
    project.master_data_csv
GROUP BY 
  `Weekday/Weekend`;
  

  SELECT 
 CAST(`olist_order_reviews_dataset.review_score` AS CHAR) AS Row_Labels, 
 COUNT(*) AS Credit_Card
FROM 
 master_data_csv
WHERE
 `olist_order_payments_dataset.payment_type` = 'credit_card'
GROUP BY 
 `olist_order_reviews_dataset.review_score`
UNION ALL
SELECT 
 'Blank' AS Row_Labels, 
 COUNT(`olist_order_reviews_dataset.review_score` ) AS Credit_Card
FROM 
 master_data_csv
WHERE 
 `olist_order_payments_dataset.payment_type` = 'credit_card' AND 
`olist_order_reviews_dataset.review_score`='';
   
   SELECT 
 avg(datediff(STR_TO_DATE(`olist_orders_dataset.order_delivered_customer_date`,'%d-%m-%Y'), 
STR_TO_DATE(`olist_orders_dataset.order_purchase_timestamp`, '%d-%m-%Y'))) AS avg_delivery_days
FROM 
 master_data_csv
WHERE 
 `olist_products_dataset.product_category_name` = 'pet_shop';
    
    
    SELECT 
    AVG(`olist_order_items_dataset.price`) AS avg_price,
    AVG(`olist_order_payments_dataset.payment_value`) AS avg_payment_value
FROM 
    project.master_data_csv
WHERE 
    customer_city = 'sao paulo' ;
    
    SELECT CAST(`olist_order_reviews_dataset.review_score` AS CHAR) AS 'Row_Label', 
AVG(datediff(STR_TO_DATE(`olist_orders_dataset.order_delivered_customer_date`,'%d-%m-%Y'), 
STR_TO_DATE(`olist_orders_dataset.order_purchase_timestamp`, '%d-%m-%Y'))) AS 'Average of 
Shipping Days' 
FROM 
 master_data_csv
WHERE 
 `olist_orders_dataset.order_delivered_customer_date` IS NOT NULL
 AND `olist_orders_dataset.order_purchase_timestamp` IS NOT NULL
GROUP BY 
 `olist_order_reviews_dataset.review_score`
UNION ALL
SELECT 'Grand Total' AS 'Row_Label', 
AVG(datediff(STR_TO_DATE(`olist_orders_dataset.order_delivered_customer_date`,'%d-%m-%Y'), 
STR_TO_DATE( `olist_orders_dataset.order_purchase_timestamp`, '%d-%m-%Y'))) AS 'Average of 
Shipping Days' 
FROM 
 master_data_csv
WHERE 
 `olist_orders_dataset.order_delivered_customer_date` IS NOT NULL
 AND `olist_orders_dataset.order_purchase_timestamp` IS NOT NULL
ORDER BY 
 Row_Label;
  