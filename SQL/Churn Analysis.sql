SELECT * 
FROM customer_churn_table
LIMIT 10;

SELECT COUNT(*) 
FROM customer_churn_table;

SELECT COUNT(*) AS total_customers
FROM customer_churn_table;

SELECT COUNT(*) AS churned_customers
FROM customer_churn_table
WHERE churn_label = 'Yes';

SELECT 
ROUND(
100.0 * SUM(CASE WHEN churn_label='Yes' THEN 1 ELSE 0 END)/COUNT(*),
2
) AS churn_rate
FROM customer_churn_table;

SELECT 
gender,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn_label='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn_table
GROUP BY gender;

SELECT 
contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn_label='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn_table
GROUP BY contract
ORDER BY churn_count DESC;

SELECT 
payment_method,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn_label='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn_table
GROUP BY payment_method
ORDER BY churn_count DESC;

SELECT 
internet_service,
COUNT(*) AS customers,
SUM(CASE WHEN churn_label='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM customer_churn_table
GROUP BY internet_service
ORDER BY churn_customers DESC;

SELECT 
churn_label,
ROUND(AVG(monthly_charges),2) AS avg_monthly_charges
FROM customer_churn_table
GROUP BY churn_label;

SELECT 
churn,
ROUND(AVG(tenure),2) AS avg_tenure
FROM customer_churn
GROUP BY churn;

SELECT 
senior_citizen,
COUNT(*) AS customers,
SUM(CASE WHEN churn_label='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn_table
GROUP BY senior_citizen;

SELECT 
customerid,
contract,
monthlycharges,
tenure
FROM customer_churn
WHERE churn='Yes'
ORDER BY monthlycharges DESC
LIMIT 15;

SELECT 
techsupport,
COUNT(*) AS customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn
GROUP BY techsupport;

SELECT 
onlinesecurity,
COUNT(*) AS customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churn_count
FROM customer_churn
GROUP BY onlinesecurity;

SELECT 
paymentmethod,
COUNT(*) AS churn_customers
FROM customer_churn
WHERE churn='Yes'
GROUP BY paymentmethod
ORDER BY churn_customers DESC
LIMIT 5;

SELECT
CASE
WHEN monthlycharges < 35 THEN 'Low'
WHEN monthlycharges BETWEEN 35 AND 70 THEN 'Medium'
ELSE 'High'
END AS customer_segment,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY customer_segment;
