create table kota(
	
	kota_id int primary key ,
	nama_kota varchar(50) not null,
	latitude real not null,
	longtitude real not null
)


create table pembeli (
pembeli_id int primary key,
kota_pembeli_id int,
	nama_depan varchar(50) not null,
	nama_belakang varchar(50) not null,
	detail_kontak varchar(50)  not null,
	constraint fk_kota_pembeli
		foreign key (kota_pembeli_id)
	references kota(kota_id)

)
create table penjual (
penjual_id int primary key,
kota_penjual_id int,
	nama_depan varchar(50) not null,
	nama_belakang varchar(50) not null,
	detail_kontak varchar(50)  not null,
	constraint fk_kota_penjual
		foreign key (kota_penjual_id)
	references kota(kota_id)

)



CREATE TABLE car (
  product_id SERIAL PRIMARY KEY,
  brand VARCHAR(50),
  model VARCHAR(50),
  body_type VARCHAR(50),
  year INTEGER,
  price INTEGER,
	date_post DATE
);
ALTER TABLE Cars
ADD COLUMN seller_id INTEGER,
ADD CONSTRAINT fk_seller
    FOREIGN KEY (seller_id)
    REFERENCES penjual (penjual_id);

ALTER TABLE Car
ADD COLUMN kota_id INTEGER,
ADD CONSTRAINT fk_car_kota
    FOREIGN KEY (kota_id)
    REFERENCES kota(kota_id);
ALTER TABLE Car ADD COLUMN latitude NUMERIC;
ALTER TABLE Car ADD COLUMN longitude NUMERIC;

UPDATE Car
SET latitude = CASE product_id
    WHEN 26 THEN -7.789456
    WHEN 16 THEN -6.174465
    WHEN 17 THEN -6.903889
    WHEN 18 THEN -6.976111
    WHEN 19 THEN -6.933333
    WHEN 20 THEN -7.234444
    WHEN 21 THEN -7.566667
    WHEN 22 THEN -7.017857
    WHEN 23 THEN -7.460556
    WHEN 24 THEN -7.561111
    WHEN 25 THEN -7.750556
    WHEN 27 THEN -6.270136
    WHEN 28 THEN -6.966667
    WHEN 29 THEN -7.566667
    WHEN 30 THEN -6.579166
END,
longitude = CASE product_id
    WHEN 26 THEN 110.365907
    WHEN 16 THEN 106.846565
    WHEN 17 THEN 107.604167
    WHEN 18 THEN 107.634167
    WHEN 19 THEN 107.633333
    WHEN 20 THEN 108.409167
    WHEN 21 THEN 110.816667
    WHEN 22 THEN 111.993778
    WHEN 23 THEN 111.0375
    WHEN 24 THEN 111.015833
    WHEN 25 THEN 112.733333
    WHEN 27 THEN 107.006744
    WHEN 28 THEN 110.416667
    WHEN 29 THEN 110.816667
    WHEN 30 THEN 106.726148
END
WHERE latitude IS NULL OR longitude IS NULL;





CREATE TABLE Bids (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    car_id INTEGER,
    bid_price DECIMAL(15, 2),
	bid_date DATE,
    FOREIGN KEY (user_id) REFERENCES penjual(penjual_id),
    FOREIGN KEY (car_id) REFERENCES Cars(id)
);
