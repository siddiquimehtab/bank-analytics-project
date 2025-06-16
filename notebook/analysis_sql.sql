-- Top 10 Most Active Accounts

SELECT
    t.account_id,
    a.account_type,
    a.open_date,
    a.balance,
    c.customer_id,
    c.name,
    c.age,
    c.city,
    c.risk_score,
    COUNT(*) AS total_tx
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
GROUP BY t.account_id
ORDER BY total_tx DESC
LIMIT 10;


-- Total Amount Spent per Customer

SELECT 
	SUM(t.amount) AS total_spent,
	t.account_id, 
	a.customer_id, a.account_type, a.open_date, a.balance,
	c.name, c.age, c.city, c.risk_score
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE t.type = 'debit'
GROUP BY t.account_id
ORDER BY total_spent DESC
LIMIT 10;

-- Fraud Rate by Transaction Type

SELECT t.type, COUNT(*) AS total_tx, 
       SUM(is_fraud) AS total_fraud,
       ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_rate_pct
FROM transactions t
GROUP BY t.type
ORDER BY fraud_rate_pct DESC;

-- Average Balance by Account Type

SELECT account_type, ROUND(AVG(balance), 2) AS avg_balance
FROM accounts
GROUP BY account_type;

-- Risk Level Segmentation

SELECT
  CASE
    WHEN risk_score >= 0.8 THEN 'High Risk'
    WHEN risk_score >= 0.5 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS risk_level,
  ROUND(AVG(age), 1) AS avg_age,
  COUNT(DISTINCT customer_id) AS num_customers
FROM customers
GROUP BY risk_level;
