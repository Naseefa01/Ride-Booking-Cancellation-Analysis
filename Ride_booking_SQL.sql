CREATE DATABASE ride_project;

USE ride_project;

select * from ride_table;

select  `Booking Status`, Count(*) from ride_table
GROUP BY `Booking Status`;

SELECT Count(*) from ride_table;

SELECT Count(*) AS unsuccesful_rides FROM ride_table
WHERE `Booking Status` IN ('Incomplete', 'No Driver Found', 'Cancelled by Driver', 'Cancelled by Cuatomer');

SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ride_table)) AS Failure_percentage
    FROM ride_table
    WHERE `Booking Status` IN ('Incomplete', 'No Driver Found', 'Cancelled by Driver', 'Cancelled by Cuatomer');

SELECT `Booking Status`, count(*) AS rides from ride_table
where `Booking Status` != 'Completed'
group by `Booking Status`
ORDER BY rides desc;

SELECT `Booking Status`,
   (count(*) * 100 / (SELECT count(*) from ride_table)) as percentage
   from ride_table
   Where `Booking Status` != 'Completed'
   group by `Booking Status`
   ORDER BY percentage DESC;
   
SELECT `Vehicle Type`, Count(*) AS total_rides from ride_table
group by `Vehicle Type`
ORDER BY total_rides desc;

select `Vehicle Type`, count(*) as failed_rides from ride_table
where `Booking Status` != 'Completed'
group by `Vehicle Type`
ORDER BY failed_rides DESC;

CREATE TABLE ride_cleaned AS
select
     Date,
     `Booking Status`,
     `Vehicle Type`,
     `Pickup Location`,
     `Drop Location`,
     `Avg VTAT`
	FROM ride_table;
    
select * from ride_cleaned