-- first i need to create a database to store all of the fitbase data

create database fitbase_data; 

-- now i will create a table for each dataset

create table daily_activity (
	entry_id bigint primary key,
	id varchar(15), 
    date date,
    total_steps int,
    total_distance decimal (10,7),
    tracker_distance decimal (10,7),
    logged_activities_distance int,
    very_active_distance decimal (10,7),
    moderate_active_distance decimal (10,7),
    light_active_distance decimal (10,7),
    sendentary_active_distance int,
    very_active_mins int,
    fairly_active_mins int,
    lightly_active_mins int,
    sendentary_active_mins int,
    calories int
    );
    
    
-- I will import the daily_activity dataset into the table
    
    select *
    from daily_activity;
-- total of 940 rows of data imported
     


    
create table hourly_calories (
	entry_id bigint primary key,
	id bigint,
    activity_hour datetime,
    calories int
);
    
select *
from hourly_calories;
-- total of 22099 rows of data imported


create table hourly_steps (
	entry_id bigint primary key,
    id bigint,
    activity_hour datetime,
    step_total int
); 
    
    
select *
from hourly_steps;
-- total of 22099 rows of data imported

create table sleep (
	entry_id bigint primary key,
    id bigint,
    sleep_day datetime,
    total_sleep_records int, -- total recorded sleep sessions including naps >60 mins
    total_mins_alseep int,
    total_mins_in_bed int
);

select *
from sleep;
-- total of 413 rows of data were imported




-- Now i am going to look at the distinct data to see the total number of participants of the survey. I will review each table.

select distinct id 
from daily_activity;
-- 33 recored were found meaning the number of people we will be studying is 33. A really small sample size but slightly large enough to stil review and gather insights. 


select distinct id
from hourly_calories;
-- 33 records were found


select distinct id
from hourly_steps;
-- 33 records found


select distinct id
from sleep;
-- 24 records were found


-- I will add day of the week to the daily_activity table so I am able to analyze which days activity is taking place. 

alter table daily_activity 
add day_of_week varchar(10);

update daily_activity
set day_of_week = dayname(date); 

-- I will also add a day of the week column to the sleep table as well.

alter table sleep
add day_of_week varchar(10);

update sleep
set day_of_week = dayname(sleep_day);


-- I am going to add the sleep table to the daily_activity table. 

create table daily_activity_sleep
select a.*, b.total_sleep_records, b.total_mins_alseep, b.total_mins_in_bed
from daily_activity as a
inner join sleep as b
on a.id = b.id and a.date = b.sleep_day;

select *
from daily_activity_sleep; 
-- total of 413 rows of data imported from inner join.


-- Data Aggregation
-- to understand the data on a deeper level i will find the avgs of the statistics of distance, daily steps, avg mins asleep, avg calories. 

select id, round(avg(total_steps), 0) as avg_daily_steps, round(avg(total_distance), 2) as avg_distance, round(avg(total_mins_alseep), 0) as avg_sleep, round(avg(calories), 2) as avg_calories
from daily_activity_sleep
group by id
order by avg_distance desc;
-- this shows the average daily steps per partcipant, in addtion to avg distance, sleep, and calories burned per day. The avg daily steps range from 19,079 to 1,490 steps by different participants. Meaning some of the participants are very active and might be part of their job while others do not move nearly as much in comparison based on their fitness tracker. I could be possbile that not all users wear their fitness tracker all day and a lot of their activity isnt recorded. I could analyze the data and try and find out how often each participant wears their device. 


-- I will find the avgs by the day of the week

select id, day_of_week, round(avg(total_steps), 2) as avg_steps, round(avg(total_distance), 2) as avg_distance, round(avg(total_mins_alseep), 2) as avg_sleep, round(avg(calories), 2) as avg_calories
from daily_activity_sleep
group by id, day_of_week, total_distance
order by total_distance desc; 



-- now i will do the same but find the total activity logged for each participant

select id, round(sum(total_steps), 2) as total_steps, round(sum(total_distance), 2) as total_distance, round(sum(total_mins_alseep), 2) as total_sleep, round(sum(calories), 2) as total_calories
from daily_activity_sleep
group by id
order by total_distance desc;



-- total activity based on day of the week

select day_of_week, round(sum(total_steps), 2) as total_steps, round(sum(total_distance), 2) as total_distance, round(sum(total_mins_alseep), 2) as total_sleep, round(sum(calories), 2) as total_calories
from daily_activity_sleep
group by day_of_week
order by total_distance desc;




-- adding time of day column to the hourly steps table

alter table hourly_steps
add column time_of_day time; 

update hourly_steps
set time_of_day = time(activity_hour);



-- I will find the average steps per hour for the participants 

select time_of_day, round(avg(step_total), 2) as average_steps
from hourly_steps
group by time_of_day
order by average_steps desc;
-- this data shows which hours led to the most amount of steps in a day. it looks like 6pm is the most common time poeple are walking with roughly 600 steps per hour. 7-8pm are very close behind between 550-580 steps per hour. this could mean peopel are getting off work around this time and now looking to move and get some excercise. It makes a olot of sense since throughout the day they are probably sitting and working not recording a lot of steps or exercise. 12pm, 2pm, 1pm also showed some prettry strong results of steps per hour comparitaivly at around 540ish steps per hour. Again I could assume not every individual wears there device every second of the day and will need further evaluation.


-- created a new table that has the daily averages per participant
create table average_user_data
select id, round(avg(total_distance), 2) as avg_distance, 
round(avg(total_steps), 2) as avg_daily_steps,
round(avg(total_mins_alseep), 0) as avg_sleep,
round(avg(calories), 0) as avg_calories
FROM daily_activity_sleep
GROUP BY id;



-- Show the average caloreis burned per day 
select activity_hour, round(avg(calories), 0) as avg_calories_burned_daily
from hourly_calories
group by activity_hour; 

SELECT 
    activity_hour, 
    DATE(activity_hour) AS activity_date,
    HOUR(activity_hour) AS activity_hour_of_day,
	ROUND(AVG(calories), 0) AS avg_calories
FROM 
    hourly_calories
GROUP BY 
    activity_date, activity_hour; 




-- i want to create classifications of "sendatary", "active" and "very active" based on number of daily steps. 

create table user_classification
select id, avg_daily_steps,
(case 
when avg_daily_steps < 5000 then 'Sedentary'
when avg_daily_steps >= 5000 and avg_daily_steps < 7499 then 'Lightly Active'
when avg_daily_steps >= 7500 and avg_daily_steps < 9999 then 'Fairly Active'
when avg_daily_steps >= 10000 then 'Very Active'
end) as user_level
from average_user_data; 
-- i have now classified each participant to one of the 3 levels based on steps taken per day. there seems to be a variety but again numbers can very vastly based on how often they wear their fitness device. I do not know the demograpghic of these participants so its hard to know how many steps in particiular are deemed "Sedentary", or "active" but based on recent CDC guidlines an healthy adult should be getting around 10,000 steps a day. 

select *
from user_classification; 




-- I will not try and find out how often each indivual wears there fitness device

Create Table daily_usage
 select id, count(id) as total_usage_in_days
 from daily_activity_sleep
 group by id;
 -- there  is a variety of usage throught the month. I will now create a new table that will label the frequency of total_usage
 
 
-- I will find the use level by day of each participant 
create table total_usage
select id, total_usage_in_days, 
case 
when total_usage_in_days  <= 10 then "Low Use"
when total_usage_in_days >= 11 and total_usage_in_days <= 20 then "Fair Use"
when total_usage_in_days >= 21 then "High Use"
end as use_level
from daily_usage;

select count(id)/24*100 as percentage, use_level -- calculates the avg use per hour, multiplied by 100 gives me the percentage
from total_usage
group by use_level;
-- I am able to see that 50% are high users, 37% are low use and 12.5% are fair users


-- I will find the total minutes spent for each level of activty for each participant

select id,
sum(lightly_active_mins) as light_active_mins,
sum(fairly_active_mins) as fairly_active_mins,
sum(very_active_mins) as very_active_mins
from daily_activity
group by id
order by very_active_mins desc; 
-- I can see how many minutes each participant spent in each category




 

select *
from total_usage; 












    
    
    
    
    
    
    
    
    



