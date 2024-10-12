create database blinkit;
use blinkit;

CREATE TABLE Blinkit_Grocery (
    Item_Identifier VARCHAR(50),
    Item_Weight FLOAT,
    Item_Fat_Content VARCHAR(50),
    Item_Visibility FLOAT,
    Item_Type VARCHAR(50),
    Item_MRP FLOAT,
    Outlet_Identifier VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Size VARCHAR(50),
    Outlet_Location_Type VARCHAR(50),
    Outlet_Type VARCHAR(50),
    Item_Outlet_Sales FLOAT
);


select * from blinkit_grocery;

-- Top 10 Selling Items by Total Sales:
SELECT 
    Item_Identifier, round(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM
    blinkit_grocery
GROUP BY Item_Identifier
ORDER BY total_sales DESC
LIMIT 10; 

-- Sales by Outlet Type:
SELECT 
    Outlet_Type, ROUND(AVG(Item_Outlet_Sales), 2) AS Avg_Sales
FROM
    blinkit_grocery
GROUP BY Outlet_Type;

-- Sales Performance by Outlet Location:
SELECT 
    Outlet_Location_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Avg_Sales
FROM
    blinkit_grocery
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type; 

--  Distribution of Fat Content:
SELECT 
    Item_Fat_Content, COUNT(*) AS Total_Item
FROM
    blinkit_grocery
GROUP BY Item_Fat_Content;

-- Impact of Outlet Age on Sales: 
SELECT 
    (YEAR(CURRENT_DATE()) - Outlet_Establishment_Year) AS Outlet_Age,
    ROUND(AVG(Item_Outlet_Sales), 2) AS Avg_Sales
FROM
    blinkit_grocery
GROUP BY Outlet_Age
ORDER BY Outlet_Age;

--  Top Selling Item Types by Total Sales:
SELECT 
    Item_Type, ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM
    blinkit_grocery
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- Average MRP by Item Type: 
SELECT 
    Item_Type, ROUND(AVG(Item_MRP), 2) AS Avg_MRP
FROM
    blinkit_grocery
GROUP BY Item_Type
ORDER BY Avg_MRP DESC;

 --  Key Performance Indicators (KPIs):
 -- Total Sales: 
 SELECT 
    ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM
    blinkit_grocery;

--  Average MRP:
SELECT 
    ROUND(AVG(Item_MRP), 2) AS Avg_MRP
FROM
    blinkit_grocery;

-- Number of Unique Items: 
SELECT 
    COUNT(Item_Identifier) AS Number_Of_Items
FROM
    blinkit_grocery;