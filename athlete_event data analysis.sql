SELECT * FROM athlete_project.olympic_events;

# 1-> write an sql query to find in which sport or event india has won the highest medals 
select event , count(Medal)
from olympic_events 
where Team = 'India'
and Medal <> 'NA'
group by event
order by count(Medal) desc;


# 2-> identify the sports or events which was played most consequently in the summer olympics games

select event ,count(event)
from olympic_events 
where season = 'summer'
group by event
order by count(event) desc;

# 3-> writr a sql query to fetch yhe details of the all the countries which have won
#      most no of silver and bronze and atleast one gold
select team , sum(silver),sum(bronze),sum(gold)
from
	(select *,
			case Medal when 'silver' then 1 else 0 end as silver,
			case Medal when 'bronze' then 1 else 0 end as bronze, 
			case Medal when 'gold' then 1 else 0 end as gold
	from olympic_events) a
group by team
having sum(gold) > 0
order by sum(silver) desc;
                

# 4=> which player has won maximum number of gold
select Name ,sum(gold)
from (select *,
			case medal when 'gold' then 1 else 0 end as gold
from olympic_events) a
group by name
order by sum(gold) desc;
        
# 5-> which sport has maximum event 
select sport, count(*)
from olympic_events
group by sport 
order by count(*) desc limit 1;

# 6-> which year has maximum events
select year ,count(*)
from olympic_events
group by year
order by count(*) desc limit 1;