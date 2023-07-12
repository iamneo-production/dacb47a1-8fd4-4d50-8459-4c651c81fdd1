my sql

Select * from election;

#--Performance Tuning Set-1--#

/* write an sql query to find the total count of female candidates participating in each year*/

select year,count(cand_name)as total_female_candidates
from ELECTION where cand_sex='F'
group by year;

/*write an sql query to find the total candidates who participated in the election at each state in each year*/

select st_name,year,count(CAND_NAME) as total_candidates
from election 
group by st_name,year
order by year;

/*write an sql query to find the total votes that bjp got in each state in the year 1967*/

select ST_NAME,totvotpoll
from election where partyname='bjp' and year=1967
group by st_name,totvotpoll;

/*write an sql query to find the total candidates who participated in the election in each state in year 2004*/

select ST_NAME,count(CAND_NAME)as total_candidates
from election where year=2004
group by ST_NAME;

/*write an sql query to what are the top 5 parties  that got the most votes in uttar pradesh in year 2014?*/

select PARTYNAME,totvotpoll
from election where year=2014 and st_name='Uttar Pradesh'
group by PARTYNAME,totvotpoll
order by TOTVOTPOLL
fetch first 5 rows only;

