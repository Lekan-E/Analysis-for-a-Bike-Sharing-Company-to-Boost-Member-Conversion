-- BY: Olamilekan Razak Elegbede
-- Customers Analysis Dashboard

-- A comparative analysis for a bike-sharing company to 
-- better understand how members and casual riders differ.

DROP DATABASE IF EXISTS cyclistic;
CREATE DATABASE IF NOT EXISTS cyclistic;
use cyclistic;

-- CREATE TABLE STRUCTURE (Repeat for each table)
CREATE TABLE november2021 (
		month_year   VARCHAR(20),
		ride_id			VARCHAR(60)				NOT NULL,
        member_casual 	ENUM('member','casual'),
        rideable_type	VARCHAR(60)				NOT NULL,
        day_of_week		VARCHAR(20),
        started_at		DATETIME				NOT NULL,
        ended_at		DATETIME				NOT NULL,
        ride_length		DOUBLE,
        start_station_name		VARCHAR(120)				,
        start_station_id		VARCHAR(60)		,
        start_lat		DOUBLE,
        start_lng		DOUBLE,
        end_station_name		VARCHAR(120),
        end_station_id			VARCHAR(60),
        end_lat			VARCHAR(20),
        end_lng			varchar(20)
);

-- LOAD CSV FILES INTO DATABASE (Repeat for each table)
LOAD DATA INFILE 'november2021.csv' INTO TABLE november2021
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

-- Combine all tables into a temp table
CREATE or replace view v_all_months AS
select *
from november2020
union all select *
from december2020
union all select *
from january2021
union all select *
from february2021
union all select *
from march2021
union all select *
from april2021
union all select *
from may2021
union all select *
from june2021
union all select *
from july2021
union all select *
from august2021
union all select *
from september2021
union all select *
from october2021
union all select *
from november2021;

-- Start Startion Info
CREATE OR REPLACE VIEW v_start_station AS
SELECT ride_id, member_casual, start_station_id, start_station_name, start_lat, start_lng
from v_all_months;

-- End Station Info
CREATE OR REPLACE VIEW v_end_station AS
SELECT ride_id, member_casual, end_station_id, end_station_name, end_lat, end_lng
from v_all_months;

-- Ride Info
CREATE OR REPLACE VIEW v_ride_info AS
SELECT ride_id, rideable_type, member_casual, started_at, ended_at, ride_length, month_year, day_of_week
FROM v_all_months;

-- DROP VIEW
DROP VIEW v_start_station,
			v_end_station,
            v_ride_info,
            v_all_months;

-- DATA CLEANING
-- Delete rows where ride duration is less than or equal 0
DELETE FROM v_all_months
where ride_length <= 0;



-- EXEC DASHBOARD
-- Find average ride_length [year, month, day of week] hrs:mins:secs
SELECT round(sum(ride_length) / 86400) as days,
		round((sum(ride_length) % 86400) / 3600) as hours,
        round((sum(ride_length) % 3600) / 60) as minutes,
        round(sum(ride_length) % 60) as seconds
FROM
(
select round(avg(ride_length),2) AS ride_length
from v_all_months
)X;


select round(avg(ride_length),2) AS ride_length
from v_all_months;

-- [by month]
select month_year,
round(sum(avg_ride_length) / 86400) as days,
		round((sum(avg_ride_length) % 86400) / 3600) as hours,
        round((sum(avg_ride_length) % 3600) / 60) as minutes,
        round(sum(avg_ride_length) % 60) as seconds
from(
select month_year, round(avg(ride_length),2) as avg_ride_length
from v_all_months
group by month_year
)x
group by month_year;

SELECT month_year, ROUND(avg(ride_length),2) as ride_length
FROM v_all_months
group by month_year
order by ride_length asc;

-- order by avg_ride_length asc;

-- [by week]
select member_casual,
		round(sum(avg_ride_length) / 86400) as days,
		round((sum(avg_ride_length) % 86400) / 3600) as hours,
        round((sum(avg_ride_length) % 3600) / 60) as minutes,
        round(sum(avg_ride_length) % 60) as seconds
from(
select member_casual ,round(avg(ride_length),2) as avg_ride_length
from v_ride_info
group by member_casual
)x
group by member_casual;

select day_of_week,
		round(sum(avg_ride_length) / 86400) as days,
		round((sum(avg_ride_length) % 86400) / 3600) as hours,
        round((sum(avg_ride_length) % 3600) / 60) as minutes,
        round(sum(avg_ride_length) % 60) as seconds
from(
select day_of_week,round(avg(ride_length),2) as avg_ride_length
from v_all_months
group by day_of_week
)x
group by day_of_week;


select day_of_week,round(avg(ride_length),2) as avg_ride_length
from v_all_months
group by day_of_week
order by avg_ride_length asc;


-- Find the total number of rides [year, by month, by day of week] & Which month had the highest no of rides
SELECT COUNT(ride_id) as total_number_of_rides
from v_all_months;

select month_year, count(ride_id)
from v_all_months
group by month_year
order by count(ride_id);

-- Which month had the highest no of rides
select month_year, count(ride_id)
from v_all_months
group by month_year
order by count(ride_id) desc
limit 1;

-- Which day of the week had the highest no. of rides
select day_of_week, count(ride_id) as total_ride
from v_all_months
group by day_of_week
order by count(ride_id) desc
limit 1;

select member_casual, ride_length, ride_id, started_at, ended_at
from v_ride_info
where member_casual = 'casual'
order by ride_length desc;


-- Top 10 start stations by total/number of rides
select start_station_name, start_station_id, count(ride_id), start_lat, start_lng, member_casual
from v_start_station
where member_casual = 'member'
group by start_station_name
order by count(ride_id) desc
limit 10;

select start_station_name, start_station_id, count(ride_id), start_lat, start_lng
from v_start_station
group by start_station_name
order by count(ride_id) desc
limit 10;



-- Top 10 end stations by total/number of rides
select end_station_name, end_station_id, count(ride_id), end_lat, end_lng
from v_end_station
group by end_station_name
order by count(ride_id) desc
limit 10;

select end_station_name, end_station_id, count(ride_id), end_lat, end_lng, member_casual
from v_end_station
where member_casual = 'casual'
group by end_station_name
order by count(ride_id) desc
limit 10;

SELECT count(*) 
FROM cyclistic.v_all_months
where start_station_id != end_station_id;

-- Number of rides for each bike type [year, by month]
select rideable_type, count(ride_id)
from v_ride_info
group by rideable_type;

select rideable_type, month_year, member_casual, count(ride_id)
from v_ride_info
where member_casual = 'casual'
group by month_year, rideable_type;

select member_casual, rideable_type, count(ride_id)
from v_ride_info
group by rideable_type, member_casual
order by member_casual;


-- CASUAL VS MEMBERS
-- No of rides for [casual/members]
SELECT member_casual, month_year, count(ride_id)
FROM v_all_months
GROUP BY member_casual, month_year;

-- Average ride duration [casual/members]
SELECT member_casual, avg(ride_length)
FROM v_all_months
group by member_casual;

-- top day of the week for [casual/member]
select member_casual, day_of_week, max(total)
from(
SELECT member_casual, day_of_week, count(ride_id) as total
from v_all_months
group by member_casual, day_of_week)x
group by member_casual;


SELECT member_casual, day_of_week, count(ride_id)
from v_all_months
group by member_casual, day_of_week;

-- Number of rides for each bike type [casual/member]
select member_casual, rideable_type, count(ride_id)
from v_all_months
group by member_casual;