#Grouping the table according to price of the restaurant
SELECT * FROM restaurants.restaurants
ORDER BY price;

#


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
SELECT count(Alcohol_Service) AS total_rows,
SUM(CASE WHEN Franchise = 'No' THEN 1 ELSE 0 END) AS no_franchise,
SUM(CASE WHEN Franchise = 'Yes' THEN 1 ELSE 0 END) AS yes_franchise,
(SUM(CASE WHEN Franchise = 'No' THEN 1 ELSE 0 END)/COUNT(Franchise)) *100 as no_percentage,
(SUM(CASE WHEN Franchise = 'Yes' THEN 1 ELSE 0 END)/ COUNT(Franchise))*100 as yes_percentage
FROM restaurants.restaurants;


#Counting the number of cities that share the same state name
SELECT COUNT(*) FROM restaurants.restaurants
WHERE city = State;

#Joining the customer_perferences table and the customers table on the Customer_ID primary key
SELECT Preferred_Cuisine, City,State
FROM restaurants.consumer_preferences
FULL JOIN restaurants.consumers
	ON restaurants.consumer_preferences.Consumer_ID = restaurants.consumers.Consumer_ID;
