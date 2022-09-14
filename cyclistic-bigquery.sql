--STEP 1: Join all the months into one table to make querying easier moving forward-----------

CREATE TABLE cyclistic-capstone-1.cyclistic_monthly_data.trip_data AS
(SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2021_08_Aug_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2021_09_Sep_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2021_10_Oct_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2021_11_Nov_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2021_12_Dec_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_01_Jan_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_02_Feb_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_03_Mar_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_04_Apr_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_05_May_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_06_Jun_Cyclistic_Trip_Data`
UNION ALL
SELECT *
FROM `cyclistic-capstone-1.cyclistic_monthly_data.2022_07_Jul_Cyclistic_Trip_Data`)


--STEP 2: Count the number of rows to confirm total number of trips-----------

select count(1)
from `cyclistic_monthly_data.trip_data`
--this matches the total we had on our summary spreadsheet--


--STEP 3: Create two columns: for ride length in seconds, then ride length in minutes-----------
--these are the queries to add values to those columns--

UPDATE `cyclistic_monthly_data.trip_data`
SET ride_length_seconds = timestamp_diff(ended_at, started_at, second)
WHERE true;

UPDATE `cyclistic_monthly_data.trip_data`
SET ride_length_mins = ride_length_seconds/60
WHERE true;


--STEP 4: Check the data for any possible errors-----------

--should only be two member types, no null--
select distinct member_casual
from `cyclistic_monthly_data.trip_data`;

select *
from `cyclistic_monthly_data.trip_data`
where member_casual is null;

--should only be three types of bikes, no null--
select distinct rideable_type
from `cyclistic_monthly_data.trip_data`;

select *
from `cyclistic_monthly_data.trip_data`
where rideable_type is null;

--ride IDs should be unique to each ride--
select ride_id, count(1)
from `cyclistic_monthly_data.trip_data`
group by ride_id
having count(1) > 1;

--all trips should have a start time and end time--
select *
from `cyclistic_monthly_data.trip_data`
where started_at is null or ended_at is null;


--STEP 5: Remove trips with a length of less than zero seconds-----------

--find trips where trip length is less than zero--
select count(1)
from `cyclistic_monthly_data.trip_data`
where ride_length_seconds <= 0;
--result is 2980 trips with negative time--

select count(1)
from `cyclistic_monthly_data.trip_data`
where ride_length_seconds > 0;
--result is 5,898,483 trips that should be included in table--

--remove 2980 anomalies--
DELETE `cyclistic_monthly_data.trip_data`
WHERE ride_length_seconds <= 0
--This statement removed 2,980 rows from trip_data.--


--STEP 6: Analyze the data-----------

--bike preference overall--
select rideable_type, count(1)
from `cyclistic_monthly_data.trip_data`
group by rideable_type;

--bike preference by user type--
select member_casual, rideable_type, count(1)
from `cyclistic_monthly_data.trip_data`
group by member_casual, rideable_type;

--number of trips by user type--
select member_casual, count(1)
from `cyclistic_monthly_data.trip_data`
group by member_casual;

--hours cycled by user type--
select distinct member_casual, sum(ride_length_seconds/3600) as ride_length_hours
from `cyclistic_monthly_data.trip_data`
group by member_casual;

--average length of trips by user type--
select member_casual, avg(ride_length_seconds/60)
from `cyclistic_monthly_data.trip_data`
group by member_casual;


--MONTHLY DATA--
--number of trips per month by user type--
select member_casual, EXTRACT(MONTH FROM started_at), count (1)
from `cyclistic_monthly_data.trip_data`
group by member_casual, EXTRACT(MONTH FROM started_at);

--average length of trip by month by user type--
select member_casual, avg(ride_length_seconds/60), EXTRACT(MONTH from started_at)
from `cyclistic_monthly_data.trip_data`
group by member_casual, EXTRACT(MONTH from started_at);


--DAILY DATA--
--number of trips per day by user type--
select member_casual, EXTRACT(DAYOFYEAR FROM started_at), count (1)
from `cyclistic_monthly_data.trip_data`
group by member_casual, EXTRACT(DAYOFYEAR FROM started_at);

--average length of trips per day by user type--
select member_casual, avg(ride_length_seconds/60), EXTRACT(DAYOFYEAR FROM started_at)
from `cyclistic_monthly_data.trip_data`
group by member_casual, EXTRACT(DAYOFYEAR FROM started_at);


--DAY OF WEEK DATA--
--number of trips per day of week by use type--
select member_casual, EXTRACT(DAYOFWEEK from started_at), count (1)
from `cyclistic_monthly_data.trip_data`
group by member_casual, EXTRACT(DAYOFWEEK from started_at);

--average length of trip (mins) by day of week by user type--
select member_casual, avg(ride_length_seconds/60), EXTRACT(DAYOFWEEK from started_at)
from `cyclistic_monthly_data.trip_data`
group by member_casual, EXTRACT(DAYOFWEEK from started_at);
