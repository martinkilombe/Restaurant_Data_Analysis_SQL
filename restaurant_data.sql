#Grouping the table according to price of the restaurant
SELECT * FROM restaurants.restaurants
ORDER BY price;
#Selecting restaurants that DO NOT serve beer and allow smoking.
SELECT * FROM restaurants.restaurants
WHERE Alcohol_Service LIKE "%None%" AND  Smoking_Allowed LIKE "%NO%";

#calulate the percentage of hotels that DO NOT serve alcohol
SELECT COUNT(Alcohol_Service) as total_rows,
SUM(CASE WHEN Alcohol_Service = 'None' THEN 1 ELSE 0 END) AS none_count,(SUM(CASE WHEN Alcohol_Service = 'None' THEN 1 ELSE 0 END) / COUNT(Alcohol_Service)) * 100 as none_percentage
FROM restaurants.restaurants;

#Calculating using two conditional Expressions for Hotels that both serve alochol and those that DO NOT(None and wine & Beer)
SELECT COUNT(Alcohol_Service) as total_rows,
SUM(CASE WHEN Alcohol_Service = 'None' THEN 1 ELSE 0 END) as no_count,
SUM(CASE WHEN Alcohol_Service = 'Wine & Beer' THEN 1 ELSE 0 END) as yes_count,
(SUM(CASE WHEN Alcohol_Service = 'None' THEN 1 ELSE 0 END) / COUNT(Alcohol_Service)) * 100 as no_percentage,
(SUM(CASE WHEN Alcohol_Service = 'Wine & Beer' THEN 1 ELSE 0 END) / COUNT(*)) * 100 as yes_percentage
FROM restaurants.restaurants;

#calulate the percentage of hotels that ARE franchises and those that are NOT

