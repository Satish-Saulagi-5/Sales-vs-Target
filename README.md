# Sales-vs-Target
Sales Target vs Actual Performance Dashboard using MySQL and Power BI. Visualizes total sales achieved against target, regional sales distribution, and employee-level sales contributions from the Northwind database.
# 📊 Sales Target Dashboard

This project demonstrates **sales performance analysis** using SQL queries and a dashboard visualization.

---

## 📂 Project Overview
- **Objective:** Track employee sales against assigned targets.  
- **Database:** Northwind sample database.  
- **SQL Script:** `SalesTarget.sql` creates a view to calculate sales vs. targets for each employee.  
- **Visualization:** Dashboard contains:  
  - **Gauge Chart:** Total sales achieved vs. overall target.  
  - **Pie Chart:** Sales distribution by regions.  
  - **Employee Matrix:** Employee-wise performance view.

---

## 🗄️ SQL View: `sales_target`

The SQL script builds a view to calculate employee performance.

```sql
CREATE VIEW northwind.sales_target AS
SELECT 
    s.employeeId AS employeeId,
    SUM(o.quantity * o.unitPrice) AS total,
    t.targetAmount AS tAmount,
    ROUND(SUM(((o.quantity * o.unitPrice) / t.targetAmount) * 100), 2) AS percente
FROM northwind.salesorder s
JOIN northwind.orderdetail o ON s.orderId = o.orderId
JOIN northwind.target t ON s.employeeId = t.employeeId
GROUP BY s.employeeId, tAmount
ORDER BY percente DESC;

## Project Files  

- `SalesTargetPerformance.sql` → MySQL query used for preparing sales target vs actual performance data  
- `SalesTargetDashboard.png` → Power BI dashboard screenshot (see preview below)  

## Dashboard Preview  
See `SalesTargetDashboard.png` in this repository for the Power BI dashboard screenshot.

 


