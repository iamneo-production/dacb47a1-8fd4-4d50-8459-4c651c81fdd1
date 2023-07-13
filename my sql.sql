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

                            /*--PERFORMANCE TUNING QUESTIONS--*/

--1.Display the BJP candidate list participated at state Andaman & Nicobar Islands in the year 1984?
select cand_name
from election
where st_name='Andaman & Nicobar' and year=1984;

--2. How many Male Candidates participated in elections in each state?
select st_name,count(cand_name)
from election
where cand_sex='M'
group by st_name;

--3. Display the Party name in descending order?
select distinct partyname
from election 
order by partyname desc;


--4. Find how many Candidates participated in the year West Bengal 1988?

select count(cand_name)
from election
where st_name ='West Bengal'and year='1998'
order by year;

--5. Display the Tamilnadu Candidate list each year?
select cand_name , year
from election where st_name='Tamilnadu'
group by cand_name,year
order by year;

--6. Find total votes BJP got In each state in the year 1987?

select  ST_NAME,SUM(totvotpoll)
from election where partyabbre='BJP'and year=1987
group by st_name;

--7. Find the Total votes BJP Got in state 'andhra pradesh' in the year 1984?
 
select SUM(totvotpoll)
from election
where partyabbre='BJP'and year=1984 and st_name='Andhra Pradesh';


--8. Find the Total vote percentage of BJP get in goa state in the year 2003?

select (sum(TOTVOTPOLL)/sum(electors))*100 as vote_percentage
from ELECTION
where st_name='Andhra Pradesh' and year=2004;

--9. How many times has BJP gotten an Above 50% vote?

select count(*) as num_times_above_50percent_votes
from ELECTION
where PARTYNAME='BJP' and ((TOTVOTPOLL/electors)*100)<50;

--10. what is the state list the BJP gets below 75% vote?

select distinct(st_name) as state_list
from election
where partyname='BJP' and  ((totvotpoll/ELECTORS)*100)<75; 


/*11.Write a SQL query to calculate total votes Got by BJP in Bihar State in 1996?*/

select st_name,year,sum(totvotpoll) as total_bjp_votess`
from election where st_name='Bihar' and year=1996
group by st_name,year;


/*12. Write a SQL query to display the BJP Candidates list in descending order?*/

select CAND_NAME
from election where PARTYABBRE='BJP'
order by cand_name desc;

/*13. Find how many times congress gets above 50% vote in Bihar state?*/

select count(distinct year) as  Num_of_Times
from election
where st_name = 'Bihar' and partyabbre = 'INC' and (totvotpoll / electors * 100) > 50;

/*14. Find the Sikkim Candidate list each year?*/

select distinct year, cand_name
from election
where st_name = 'Sikkim'
order by year;

/*15. Find total male candidates who participated in the election?*/

select cand_name
from election
where cand_sex='M';



