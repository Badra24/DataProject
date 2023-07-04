DESCRIPTION PROJECT:
This PSQL database project aims to store and manage data in a car marketplace. This database will include several main tables, namely: cars, sellers, buyers, bids, cities, and transactions. Each table will have a certain structure and columns to store relevant information.

ERD PROJECT :
![alt text](https://github.com/Badra24/DataProject/blob/main/Screenshot%202023-06-28%20at%2009.41.09.png?raw=true)
FEKER DATABASE :

![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/IMPORT%20FAKER.png?raw=true)
![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/SINTAX%20FAKER.png?raw=true)
![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/SAVECSV.png?raw=true)
This PSQL database project aims to create dummy data using the Faker library on the theme of cities, sellers and buyers. This database will include several main tables, namely: cities, sellers, and buyers. Each table will have a certain structure and columns to store relevant information.


PSQL QUERY REQUIREMENTS
![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/VALUE%20BID%20DAN%202015%3E%3D.png?raw=true)

1. Finding cars with a production year of 2015 and above:
   In this part, an SQL query is used to retrieve data from the "car" table based on certain criteria. The query uses the SELECT statement to choose the columns to be displayed, namely "product_id", "brand", "model", "year", and "price". The FROM statement is used to specify the table from which the data will be retrieved, which is the "car" table. It is followed by the WHERE statement, which sets the selection criteria, in this case, selecting cars with a production year greater than or equal to 2015.

2. Adding a bid value to the "Bids" table:
   This part demonstrates an example of the SQL INSERT INTO statement, which is used to insert new data into the "Bids" table. The data being inserted includes "user_id" (with a value of 16), "car_id" (with a value of 16), "bid_price" (with a value of 185500000), and "bid_date" (with a value of '2024-03-04'). This data will be inserted as a new row in the "Bids" table.

By running this code, we can retrieve cars with a production year of 2015 and above from the "car" table, as well as add a new bid value to the "Bids" table using SQL statements.

![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/MENCARI%20SELLER%20DAN%20%25YARIS%25.png?raw=true)
The first query, "SELECT product_id, brand, model, year, price, date_post FROM Car WHERE seller_id = (SELECT penjual_id FROM penjual WHERE nama_depan = 'Gilang' AND nama_belakang = 'Andriani') ORDER BY date_post DESC;", retrieves data from the "Car" table. It selects the columns "product_id", "brand", "model", "year", "price", and "date_post" for cars where the seller_id matches the penjual_id of a seller with the first name 'Gilang' and last name 'Andriani' in the "penjual" table. The result is then ordered in descending order based on the "date_post" column.

The second query, "SELECT product_id, brand, model, year, price FROM car WHERE model ILIKE '%Yaris%' ORDER BY price ASC;", selects data from the "car" table. It retrieves the columns "product_id", "brand", "model", "year", and "price" for cars where the model contains the word 'Yaris' (case-insensitive) using the ILIKE operator. The result is then ordered in ascending order based on the "price" column.

These queries allow you to retrieve information about cars posted by a specific seller named Gilang Andriani and find used cars with the model containing 'Yaris' in their name, sorted by price.

![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/MENCARI%20MOBIL%20BEKAS.png?raw=true)
The query selects specific columns from the "Car" table and calculates the distance between each car's location and a specified city. It orders the results based on the distance in ascending order and limits the output to the car with the shortest distance. In short, it retrieves the car that is closest to the specified city.

![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/MENJUMAH%20BID%20DENGAN%20UNIQUE.png?raw=true)
This query joins the "Bids" table with the "Car" table based on the common "car_id" column. It then groups the results by the car model and calculates the count of distinct product_ids (unique products) and the total count of bids for each car model. The results are sorted in descending order based on the count of bids. In short, this query provides the car models along with the count of unique products and the total count of bids for each model.


![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/MEMBANDINGKAN%20HARGA%20RATA2DAN%20TOYOTA%20YARIS.png?raw=true)
1. The first query retrieves data from the "Car" table and joins it with the "kota" table based on the common "kota_id" column. It selects the city name ("nama_kota"), car brand, model, year, price, and calculates the average car price per city using the window function AVG() with the PARTITION BY clause. The results are ordered by city name. This query provides information about car details along with the average car price for each city.

2. The second query retrieves data from the "Car" table and joins it with the "Bids" table twice: once for the first bid (b1) and once for the next bid (b2). It selects the car model, user_id of the first bidder, first bid date, next bid date, first bid price, and next bid price. The join condition ensures that the car model is 'Toyota Yaris' and there exists a subsequent bid (b2.bid_date > b1.bid_date). The results are ordered by the first bid date. This query provides information about bids on Toyota Yaris cars, including details of the first bid and the subsequent bid (if available).

![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/BID%20DENGAN%206%20BULAN%20TERAKHIR.png?raw=true)
1. The inner subquery selects the car model, average price (avg_price), and average bid price (avg_bid_6month) for the last 6 months. It joins the "Car" table with the "Bids" table based on the common "product_id" and "car_id" columns, respectively. The WHERE clause filters the bids to only include those within the last 6 months. The results are grouped by the car model.

2. The outer query selects the car model, avg_price, avg_bid_6month, difference (avg_price - avg_bid_6month), and difference_percent ((difference / avg_price) * 100). These calculations are performed using the values obtained from the inner subquery.

3. The results are ordered by the car model.

In summary, this query retrieves the average price and average bid price for each car model within the last 6 months. It also calculates the difference between the average price and average bid price, as well as the difference percentage. The results provide insights into the price variations and competitiveness of bids for different car models.

![alt text](https://github.com/Badra24/DataProject/blob/main/PICTURE/BID%201-6%20BULAN.png?raw=true)
1. The SELECT clause retrieves the brand (AS merk), model, and average bid prices for different time intervals using the FILTER clause. Each AVG(b.bid_price) calculation is filtered based on the bid_date being within a specific time range (e.g., last 6 months, last 5 months, etc.). The result columns are aliased as m_min_6, m_min_5, m_min_4, m_min_3, m_min_2, and m_min_1, corresponding to the respective time intervals.

2. The FROM clause specifies the 'Car' table as 'c' and the 'Bids' table as 'b'. The tables are joined based on the common 'product_id' and 'car_id' columns, respectively.

3. The WHERE clause filters the results to include only the records where the brand is 'Toyota' and the model is 'Toyota Yaris'.

4. The GROUP BY clause groups the results by the brand and model.

In summary, this query retrieves the average bid prices for the 'Toyota Yaris' car model within different time intervals (last 6 months, last 5 months, etc.). The results provide insights into the trend of bid prices over time for this specific car model.

FOR RESULTS ALREADY IN THE RESULT REPOSITORY FILE IN THE FORM OF A CSV FILE FROM QUERY RESULTS
