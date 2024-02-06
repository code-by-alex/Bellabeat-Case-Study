-- DATA TO USE IN TABLEAU VISUALIZATION



-- total number of participants in the case study
select *
from daily_activity; 

-- Caloreis burned per hour per day 
SELECT activity_hour as date, day_of_week as day, calories
FROM hourly_calories;
    
alter table hourly_calories
add column day_of_week varchar(10);

update hourly_calories
set day_of_week = dayname(activity_hour); 

select *
from hourly_calories; 
    
-- total Steps taken per day
select day_of_week as day, sum(total_steps) as total_steps
from daily_activity_sleep 
group by day_of_week; 

-- avg steps taken per day
select day_of_week as day, round(avg(total_steps), 2) as average_steps
from daily_activity_sleep 
group by day_of_week; 



-- total time(mins) spend on each activity level per day
select day_of_week, 
sum(sendentary_active_mins) as sedentary_mins, 
sum(lightly_active_mins) as lightly_active_mins,
sum(fairly_active_mins) as fairly_active_mins,
sum(very_active_mins) as very_active_mins
from daily_activity
group by day_of_week;

-- total time spent in each activity leve per day per particpant 

select id,
sum(lightly_active_mins) as light_active_mins,
sum(fairly_active_mins) as fairly_active_mins,
sum(very_active_mins) as very_active_mins
from daily_activity
group by id
order by very_active_mins desc; 

-- correlation between steps and calories burned
select total_steps as Steps, Calories
from daily_activity_sleep;



