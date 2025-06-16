
# 💳 Bank Customer Analytics & Fraud Insights Project

### 🔍 End-to-End Data Modeling, Analysis, and Interactive Visualization in Python

---

## 🧠 Overview

This project simulates a **financial data analytics platform** for a bank using mock customer, account, and transaction data. The goal is to:

- Analyze customer spending patterns  
- Profile risk levels  
- Detect and visualize fraudulent behavior  
- Build interactive dashboards using Python (Plotly)

The pipeline covers everything from **data generation → database design → data cleaning → SQL analytics → Python visualization**.


---

## 🧰 Technologies Used

| Tool / Library       | Purpose                            |
|----------------------|------------------------------------|
| MySQL Workbench      | Schema design & relational storage |
| Pandas, NumPy        | Data wrangling                     |
| Matplotlib, Seaborn  | Statistical visualization          |
| Plotly               | Interactive dashboards             |
| Jupyter Notebook     | Analytical workflows               |
| SQL                  | Business queries                   |
| GitHub               | Project hosting & documentation    |

---

## 🧱 Database Schema

The data model follows a classic normalized structure:

```
customers ───< accounts ───< transactions
```

Each `customer` can hold multiple `accounts`, and each `account` can have many `transactions`.

---

## 📊 Visual Analytics

### 🔟 Top 10 Customers by Total Debit Spend

> Displays top spending customers based on debit transaction volume.

---

### 🏦 Total Debit Spend by Account Type

> Debit transactions are well distributed across savings, investment, and checking accounts.

---

## 🚨 Fraud Pattern Analysis

Key questions answered:

- **Which transaction types have the highest fraud rate?**
- **Which cities experience more fraud?**
- **Does customer `risk_score` align with actual fraud behavior?**
- **What account types are most vulnerable?**

All answers are visualized using interactive **Plotly** charts for deeper insights.

---

## 🧪 Sample SQL Queries

### Top Spenders

```sql
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
```

### Fraud Rate by Transaction Type

```sql
SELECT t.type, COUNT(*) AS total_tx, 
       SUM(is_fraud) AS total_fraud,
       ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_rate_pct
FROM transactions t
GROUP BY t.type
ORDER BY fraud_rate_pct DESC;
```

---

## ✅ Project Highlights

- Designed a relational schema for banking systems
- Inserted and validated mock data in MySQL
- Cleaned and engineered features in Python
- Created fully interactive charts using Plotly
- Used SQL to drive business insights and fraud analytics

---

## 📂 Folder Structure

```
📁 Bank_Analytics_Project/
│
├── data/                    # Raw & cleaned CSV files
├── notebooks/               # Jupyter analysis notebooks
├── dashboard/               # Visualizations (PNG/HTML)
├── sql/                     # Schema & business queries

```

---

## 💼 Use Cases

- Data analyst or data scientist portfolio
- Banking or fintech interview projects
- Fraud detection modeling baseline
- Business intelligence reporting demo

---

## 🔄 Future Improvements

- Build a fraud **prediction model** using classification
- Add a **Power BI** or **Streamlit** frontend
- Integrate **real-time alerting** via API

---
