Q-  Weather Type in Each Country
select country_name,
case when weather_type <= 15 then 'Cold'
when weather_type >= 25 then 'Hot'
else 'Warm' end as weather_type
from(
select country_id, avg(weather_state) as weather_type
from Weather
where date_format(day,'%Y-%m') = '2019-11'
group by country_id)foo, Countries c
where foo.country_id = c.country_id
