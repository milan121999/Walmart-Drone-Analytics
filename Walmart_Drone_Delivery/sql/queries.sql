-- ============================================================
-- Walmart Drone Delivery — Strategic Insights SQL Script
-- Database: walmart_database
-- Table: walmart_v4
-- ============================================================

USE walmart_database;

-- Basic Overview — Total Orders & Core Stats
SELECT 
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Delivery_Time_Min), 2) AS Avg_Delivery_Time_Min,
    ROUND(SUM(CASE WHEN Delivery_Type = 'Drone' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Drone_Share_Percent,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD,
    ROUND(AVG(Success) * 100, 2) AS Success_Rate_Percent,
    ROUND(AVG(Satisfaction_Score), 2) AS Avg_Customer_Satisfaction
FROM walmart_v4;

-- Delivery Performance by Feature Type (Express vs Standard)
SELECT 
    Delivery_Type,
    Feature_Type,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD,
    ROUND(AVG(Delivery_Time_Min), 2) AS Avg_Delivery_Time_Min
FROM walmart_v4
GROUP BY Delivery_Type, Feature_Type
ORDER BY Total_Profit_USD DESC;

-- Profit by Product Category
SELECT 
    Product_Category,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD
FROM walmart_v4
GROUP BY Product_Category
ORDER BY Total_Profit_USD DESC;

-- Expansion Readiness by State
SELECT 
    State,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD,
    ROUND(AVG(Success) * 100, 2) AS Avg_Success_Rate,
    ROUND(AVG(Satisfaction_Score), 2) AS Avg_Satisfaction
FROM walmart_v4
GROUP BY State
ORDER BY Total_Profit_USD DESC;

-- Weather Impact on Delivery Efficiency
SELECT 
    Weather,
    Delivery_Type,
    ROUND(AVG(Delivery_Time_Min), 2) AS Avg_Delivery_Time_Min
FROM walmart_v4
GROUP BY Weather, Delivery_Type
ORDER BY Avg_Delivery_Time_Min;

-- Profit Contribution by Drone Share (for Scatter Plot)
SELECT 
    ROUND(SUM(CASE WHEN Delivery_Type = 'Drone' THEN Profit_USD ELSE 0 END), 2) AS Drone_Profit_USD,
    ROUND(SUM(CASE WHEN Delivery_Type = 'Ground' THEN Profit_USD ELSE 0 END), 2) AS Ground_Profit_USD,
    ROUND(SUM(CASE WHEN Delivery_Type = 'Drone' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Drone_Share_Percent
FROM walmart_v4;

-- Delivery Distance vs Time Analysis
SELECT 
    Delivery_Type,
    ROUND(AVG(Distance_km), 2) AS Avg_Distance_km,
    ROUND(AVG(Delivery_Time_Min), 2) AS Avg_Delivery_Time_Min
FROM walmart_v4
GROUP BY Delivery_Type;

-- Profit Sensitivity - Drone vs Ground (State Level)
SELECT 
    State,
    Delivery_Type,
    ROUND(SUM(Profit_USD), 2) AS Total_Profit_USD,
    ROUND(AVG(Delivery_Time_Min), 2) AS Avg_Delivery_Time_Min,
    ROUND(AVG(Success) * 100, 2) AS Avg_Success_Rate
FROM walmart_v4
GROUP BY State, Delivery_Type
ORDER BY State, Delivery_Type;

-- Customer Satisfaction by Product Category
SELECT 
    Product_Category,
    ROUND(AVG(Satisfaction_Score), 2) AS Avg_Satisfaction_Score
FROM walmart_v4
GROUP BY Product_Category
ORDER BY Avg_Satisfaction_Score DESC;

