use harsh;
show tables;

#1
select distinct driver_id,pickup_location
from rides_csv rc 
where pickup_location in (select distinct pickup_location from rides_csv rc);
#2
select avg(rating) 
from drivers_id di
where driver_id in (select  driver_id from rides_csv rc  group by driver_id HAVING COUNT(DISTINCT pickup_location) > 1);
#3
SELECT AVG(rating) FROM drivers_id  dc WHERE driver_id IN (SELECT DISTINCT driver_id FROM rides_csv rdc 
    GROUP BY driver_id
    HAVING COUNT(DISTINCT pickup_location) > 1;
#4
   select * 
   from rides_csv rc 
   where pickup_location = dropoff_location ;
#5
  select passenger_id,count(pickup_location)
  from rides_csv rc 
  group by passenger_id 
  having count( distinct pickup_location)>300;
 #6
select avg(fare_amount) from rides_csv rc  
where dayofweek(str_to_date(ride_timestamp, '%m/%d/%Y %H:%i'))<5;
#7
select distinct driver_id  from rides_csv rc 
where ride_distance >19;

select * from passenger_id pi2 ;
select * from rides_csv rc ;
select * from drivers_id di ;
#8
select r.driver_id,count(r.driver_id) total_ride ,round(sum(d.earnings),2) total_earnings
from rides_csv r inner join drivers_id d 
on r.driver_id = d.driver_id
group by r.driver_id 
having count(r.driver_id)>100
order by total_ride ; 
#9
select d.driver_id, count(d.driver_id) ase, sum(d.earnings) as total_earning
from drivers_id d inner join rides_csv r
on d.driver_id = r.driver_id
group by d.driver_id
having count(d.driver_id)>100 
order by ase;
#10
select * 
from rides_csv rc 
where fare_amount <(select avg(fare_amount) from rides_csv rc2);
#11
select d.driver_id ,avg(d.rating) 
from drivers_id d inner join rides_csv r
on d.driver_id =r.driver_id 
where r.payment_method in('Credit Card','cash')
group by d.driver_id
having count(distinct r.payment_method)=2; 
#12
select passenger_id,sum(total_spent) total_spent
from passenger_id pi2 
group by passenger_id 
order by total_spent desc 
limit 3;
#13
SELECT r1.* FROM rides_csv r1
JOIN (
    SELECT pickup_location, MIN(ride_duration) AS min_duration
    FROM rides_csv r1
    GROUP BY pickup_location
) r2 ON r1.pickup_location = r2.pickup_location AND r1.ride_duration = r2.min_duration;
#14
select avg(fare_amount)
from rides_csv rc 
where passenger_id in (select passenger_id from passenger_id pi2 where rating >4);
select monthname(str_to_date(ride_timestamp) month, avg(fare_amount)
from rides_csv rc 
group by month;
select * from rides_csv rc ;
#15
select month(str_to_date(ride_timestamp, '%m/%d/%Y %H:%i')) month_of_year,round(avg(fare_amount),2)
from rides_csv rc 
group by month_of_year
order by month_of_year;
#16
select pickup_location,dropoff_location,count(*) most_repeated
from rides_csv rc 
group by pickup_location ,dropoff_location 
order by most_repeated
desc limit 1;
#17
select driver_id, sum(earnings)
from drivers_id di 
group by driver_id 
order by sum(earnings)
desc;
#18
select * from drivers_id di ;
select * from passenger_id pi2 ;
select * from rides_csv rc ;
#19
select p.passenger_id,p.passenger_name 
from passenger_id p inner join rides_csv r
on p.passenger_id = r.passenger_id 
where date(p.signup_date) =date(r.ride_timestamp) ;
#20
SELECT p.passenger_id, p.passenger_name
FROM passenger_id p
JOIN rides_csv  r ON p.passenger_id = r.passenger_id
WHERE DATE(p.signup_date) = DATE(r.ride_timestamp);
#21
select driver_id,count(*)
from rides_csv rc 
group by driver_id 
order by count(*)asc ;
#22
SELECT driver_name,  COUNT(driver_id) AS ride_count
FROM drivers_id dc 
GROUP BY driver_name
ORDER BY ride_count ASC;
#23
select avg(r.fare_amount)
from rides_csv r inner join passenger_id p
on r.passenger_id =p.passenger_id ;
#24
select avg(fare_amount)
from rides_csv rc 
where passenger_id in (select passenger_id from rides_csv rc2 group by passenger_id having count(passenger_id)>20);
#25
select pickup_location,avg(fare_amount) avg_amount
from rides_csv rc 
group by pickup_location 
order by avg_amount desc limit 1;
#26
select avg(d.rating) as avg_rating
from drivers_id d inner join rides_csv r
on r.driver_id =d.driver_id 
having count(r.driver_id)>=100;
#27
SELECT AVG(rating) FROM drivers_id dc WHERE driver_id IN 
(SELECT driver_id FROM rides_csv rc GROUP BY driver_id  HAVING COUNT(*) >= 100);
#28
select distinct pickup_location from rides_csv rc ;
select count(distinct pickup_location) from rides_csv rc ;
#29
select count(*) from rides_csv rc ;
SELECT COUNT(*) 
FROM rides_csv rc ;
select * from rides_csv rc 
order by ride_id desc;
#30
select avg(ride_duration) from rides_csv rc ;
#31
select driver_id ,sum(earnings) from drivers_id di 
group by driver_id
order by sum(earnings) desc 
limit 5;
#32
select payment_method ,count(*) 
from rides_csv rc
group by payment_method;
#33
select * from rides_csv rc 
where rc.fare_amount >20;
#34
select *
from rides_csv rc 
where pickup_location =dropoff_location ;
#35
select pickup_location ,count(*) as ride_count,round(count(*)*100.0/(select count(*) from rides_csv rc ),2) as percentage
from rides_csv rc
group by pickup_location ;
#36
select pickup_location,count(*)
from rides_csv rc 
group by pickup_location 
order by count(*)
desc limit 1;
#37
select avg(fare_amount)
from rides_csv rc ;
#38
select driver_id,avg(rating)avg_rating
from drivers_id di 
group by driver_id
order by avg_rating desc limit 10;
#39
select sum(earnings)
from drivers_id di ;
#40
select payment_method,count(*)
from rides_csv rc 
where payment_method ='Cash';
#41
select pickup_location,avg(ride_distance),count(*)
from rides_csv rc 
where pickup_location ="Dhanbad"
group by pickup_location; 








