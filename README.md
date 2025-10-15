# Walmart-Drone-Analytics
# 🚀 Walmart Drone Delivery — Strategic Insights Dashboard

![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-Analytics-336791?style=for-the-badge&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-Data%20Processing-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-Data%20Prep-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## 📊 Project Overview

The **Walmart Drone Delivery — Strategic Insights Dashboard** analyzes the operational efficiency and profitability of Walmart’s drone delivery initiative.  
It combines **SQL-driven analytics**, **Power BI visualization**, and **scenario simulations** to uncover key insights on:

- 🚁 Drone vs Ground delivery performance  
- 💰 Profitability across product categories and states  
- 🌦️ Weather impact on delivery efficiency  
- 📈 Profit growth projections through fleet expansion  

---

## 🧠 Key Insights

| Metric | Insight |
|--------|----------|
| **Drone Share** | Drones account for **53.6%** of total deliveries |
| **Profit** | Achieved **$2.6M** baseline profit with potential **+4.1% uplift** from 30% fleet expansion |
| **Customer Satisfaction** | Average score of **4.49 / 5**, with highest in Texas |
| **Operational Efficiency** | Drone deliveries are **35% faster** than ground |
| **Success Rate** | 97.6% delivery success achieved under varying weather conditions |

---

## 🧩 Tech Stack

<div align="center">

| Tool | Purpose |
|------|----------|
| 🐬 **MySQL / SQL Server** | Data cleaning, aggregation & KPIs |
| 📊 **Power BI** | Dashboard visualization & scenario simulation |
| 🐍 **Python (Pandas, NumPy)** | Data preprocessing (optional) |
| 🧾 **Excel** | Dataset preparation & schema validation |

</div>

---

## 🏗️ Data Model

**Table:** `walmart_v4`  
Contains delivery-level data across regions and weather conditions.

| Column | Description |
|---------|-------------|
| `Order_ID` | Unique order identifier |
| `State`, `City` | Delivery region |
| `Product_Category` | Household, Apparel, Grocery, etc. |
| `Delivery_Type` | Drone / Ground |
| `Feature_Type` | Express / Standard |
| `Distance_km` | Delivery distance |
| `Order_Value_USD` | Customer order value |
| `Revenue_USD` | Total revenue earned |
| `Cost_USD` | Operational cost |
| `Profit_USD` | Revenue – Cost |
| `Delivery_Time_Min` | Delivery completion time |
| `Success` | Binary delivery success (0/1) |
| `Satisfaction_Score` | Customer feedback rating |
| `Weather` | Delivery condition |

---

## 🧮 SQL Logic (Highlights)

```sql
-- Profit by Product Category
SELECT 
    Product_Category,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD
FROM walmart_v4
GROUP BY Product_Category
ORDER BY Total_Profit_USD DESC;

-- Delivery Performance by Feature Type
SELECT 
    Delivery_Type, Feature_Type,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD,
    ROUND(AVG(Delivery_Time_Min), 2) AS Avg_Delivery_Time
FROM walmart_v4
GROUP BY Delivery_Type, Feature_Type;
