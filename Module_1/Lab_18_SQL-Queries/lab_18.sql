create database applestore;
use applestore;
CREATE TABLE data 
(
id INT PRIMARY KEY,
track_name VARCHAR(255) NOT NULL,
);
select * from data;
alter table data add size_bytes INT, currency VARCHAR(255), price INT, rating_count_tot INT, rating_count_ver INT, user_rating INT, user_rating_ver INT, 