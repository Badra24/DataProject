-- mencari mobil 2015 ke atas 
SELECT product_id, brand, model, year, price
FROM car
WHERE year >= 2015;

--menambah value bid
INSERT INTO Bids (user_id, car_id, bid_price, bid_date)
VALUES
    (16, 16, 185500000, '2024-03-04');
	

---- mencari seller id (penjual) pada car

select * from penjual

SELECT product_id, brand, model, year, price, date_post
FROM Car
WHERE seller_id = (
    SELECT penjual_id
    FROM penjual
    WHERE nama_depan = 'Gilang' AND nama_belakang = 'Andriani'
)
ORDER BY date_post DESC;

--- mencari mobil bekas %yaris% yg termuha

select product_id, brand , model ,year, price
from car
where model ilike '%Yaris%'
order by price asc

---- mencari mobil bekas terdekat sqrt power (2) untuk mencari titik kordinat
select * from cars;


SELECT product_id, brand, model, body_type, year, price, date_post, seller_id,
    SQRT(POWER(c.latitude - (SELECT latitude FROM kota WHERE kota_id = 3173), 2) + POWER(c.longitude - (SELECT longitude FROM kota WHERE kota_id = 3173), 2)) AS distance
FROM Car c
ORDER BY distance ASC
LIMIT 1;

select * from car

-----CREATEING ANALYTIC QUERY

---COUNT JUMLAH BID count disctic untu mencari unique dan join tabel car 
SELECT model, COUNT(DISTINCT product_id) AS count_product, COUNT(*) AS count_bid
FROM Bids
JOIN Car ON Bids.car_id = Car.product_id
GROUP BY model
ORDER BY count_bid DESC;


---Membandingkan harga mobil berdasarkan harga rata-rata per kota dengan harga AVG price dan Partition by nama_kota

	
SELECT k.nama_kota, c.brand, c.model, c.year, c.price, AVG(c.price) OVER (PARTITION BY k.nama_kota) AS avg_car_city
FROM Car c
JOIN kota k ON c.kota_id = k.kota_id
ORDER BY k.nama_kota;

--- MENAMPILKAN PENAWARAN CAR DALAM BID PADA MODEL TOYOTA YARIS DENGAN KETERNAGAN B1.BID PERTAMA DAN B2 HARUS ADA 

SELECT c.model, b1.user_id, b1.bid_date AS first_bid_date, b2.bid_date AS next_bid_date, b1.bid_price AS first_bid_price, b2.bid_price AS next_bid_price
FROM Car c
JOIN Bids b1 ON c.product_id = b1.car_id
LEFT JOIN Bids b2 ON c.product_id = b2.car_id AND b2.bid_date > b1.bid_date
WHERE c.model = 'Toyota Yaris' AND b2.bid_date IS NOT NULL
ORDER BY b1.bid_date;

----- Membandingkan persentase perbedaan rata-rata harga mobil berdasarkan modelnya dan rata-rata harga 
------ bid yang ditawarkan oleh customer pada 6 bulan terakhir dengan bid_date >= current date - interval'6 months'
SELECT model, avg_price, avg_bid_6month,
       avg_price - avg_bid_6month AS difference,
       ((avg_price - avg_bid_6month) / avg_price) * 100 AS difference_percent
FROM (
    SELECT c.model, 
           AVG(c.price) AS avg_price,
           AVG(b.bid_price) AS avg_bid_6month
    FROM Car c
    JOIN Bids b ON c.product_id = b.car_id
    WHERE b.bid_date >= CURRENT_DATE - INTERVAL '6 months'
    GROUP BY c.model
) AS loads
ORDER BY model;

select * from bids
----MENGHITUNG RATA-RATA PRICE BID PADA 6BULAN - 1BULAN TERAKHIR TERHITUNG DARI HARI INI(CURREND DATE)
---- DENGAN MEMFILTER BRAND TOYOTA YARIS 
SELECT
    c.brand AS merk,
    c.model,
    AVG(b.bid_price) FILTER (WHERE b.bid_date >= CURRENT_DATE - INTERVAL '6 months') AS m_min_6,
    AVG(b.bid_price) FILTER (WHERE b.bid_date >= CURRENT_DATE - INTERVAL '5 months') AS m_min_5,
    AVG(b.bid_price) FILTER (WHERE b.bid_date >= CURRENT_DATE - INTERVAL '4 months') AS m_min_4,
    AVG(b.bid_price) FILTER (WHERE b.bid_date >= CURRENT_DATE - INTERVAL '3 months') AS m_min_3,
    AVG(b.bid_price) FILTER (WHERE b.bid_date >= CURRENT_DATE - INTERVAL '2 months') AS m_min_2,
    AVG(b.bid_price) FILTER (WHERE b.bid_date >= CURRENT_DATE - INTERVAL '1 month') AS m_min_1
FROM
    Car c
    INNER JOIN Bids b ON c.product_id = b.car_id
WHERE
    c.brand = 'Toyota' AND c.model = 'Toyota Yaris'
GROUP BY
    c.brand, c.model;












