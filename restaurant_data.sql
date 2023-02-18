#Grouping the table according to price of the restaurant
SELECT * FROM restaurants.restaurants
ORDER BY price;
#Selecting restaurants that DO NOT serve beer and allow smoking.
SELECT * FROM restaurants.restaurants
WHERE Alcohol_Service LIKE "%None%" AND  Smoking_Allowed LIKE "%NO%";

#Sql statement that calulates the percentage of hotels that dont servce alcohol
SELECT COUNT(Alcohol_Service) as total_rows,
SUM(CASE WHEN Alcohol_Service = 'None' THEN 1 ELSE 0 END) AS none_count,(SUM(CASE WHEN Alcohol_Service = 'None' THEN 1 ELSE 0 END) / COUNT(Alcohol_Service)) * 100 as none_percentage
FROM restaurants.restaurants;
