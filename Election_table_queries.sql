---intial queries-----------
-- fetch data from table
select * from election;
-- table structure
desc election;

-------------------------------oracle workspace queries-----------------------------------------
1-- total female candidate participating each year
select year, COUNT(CAND_NAME) as count
from ELECTION
where CAND_SEX = 'F'
group by Year;

2--total candidates who participated in election at each state in each year
select year,ST_NAME,count(cand_name) as count
from election
group by year,ST_NAME;

3--total votes bjp got in each state in year 1987
select ST_NAME,sum(TOTVOTPOLL) 
as totalvotes from election where
 PARTYABBRE='BJP' and year=1987
group by ST_NAME;
--no rows will be fetched by the above query as no elections were held in 1987----------------------

4--total candidates who participated in election in each state in year 2004
select ST_NAME,count(cand_name) as count 
from election 
where year=2004
group by ST_NAME;

5--top5 parties got the most votes in uttarpradesh in year 2014
select partyname from(select PARTYNAME, sum(TOTVOTPOLL) 
as totalvotes from ELECTION
where ST_NAME = 'uttar Pradesh' and  year = 2014
group by PARTYNAME)
order by totalvotes DESC
FETCH FIRST 5 ROWS ONLY;
--for the above query  no rows are selected as there is no state named uttatpradesh

------------------------------Example Queries----------------------------------------------
------------------------------------------------------------------------------------------------------
--------------------performance tuning set1 queries-----------------------------------------------------

1--totalvotes bjp party got in each state in year 1989
select sum(TOTVOTPOLL) as totalvotes,ST_NAME as state
from ELECTION 
where year=1989 and PARTYABBRE='BJP'
group by st_name;

2--total candidates who participated from Arunachal Pradesh in year 2014
select count(distinct CAND_NAME) as candidatecount 
from election
where ST_NAME='Arunachal Pradesh' and year=2014;

3--total votes bjp got in state of Andhra Pradesh in year 1989

select sum(TOTVOTPOLL) as totalvotes 
from ELECTION
where ST_NAME='Andhra Pradesh' and year= 1989
and partyabbre='BJP';

4--total vote percentage bjp got in state of Andhra Pradesh in 1989
select (sum(TOTVOTPOLL)/sum(ELECTORS))*100 as votepercentage
from election 
where ST_NAME = 'Andhra Pradesh' and year=1989
and PARTYABBRE='BJP';

5-- how many times bjp has gotten below 50% votes
select count(*) as count 
from ELECTION
where PARTYABBRE='BJP'
and ((TOTVOTPOLL/ELECTORS)*100)<50;

6--state list of bjp where it gets 75% below votes
select ST_NAME as state 
from election 
where PARTYABBRE='BJP' and ((totvotpoll/electors)*100)<75;

7-- state list where bjp got below 60% below vote
select ST_NAME as state 
from election 
where PARTYABBRE='BJP' and ((totvotpoll/electors)*100)<60;

8--total candidates who participated in Arunachal Pradesh in year 2014
select count(cand_name) as candidate_count
from election 
where st_name='Arunachal Pradesh' and year=2014;


-----------------------performance tuning set2 queries--------------------------------------------

1--bjp candidate list in andaman&nicobar islands,party='bjp' and year=1984
select CAND_NAME as candidatename
from election 
where st_name='Andaman & Nicobar islands' and 
PARTYNAME='BJP' and year= 1984;

2--male candidates participated in elections in each state
select ST_NAME, COUNT(CAND_NAME) as count
from ELECTION
where CAND_SEX = 'M'
group by ST_NAME;

3--select partyname in descending order
select  distinct partyname
from election
order by partyname desc;

4--candidates participated in year 1988 in west bengal
select count(cand_name) as count
from ELECTION 
where year= 1984
and st_name='Arunachal Pradesh';

5-- Assam candidate list each year
select year,cand_name as candidatename from election 
where st_name='Assam';

6-- TamilNadu candidate lsit each year
select year,cand_name as candidatename from election 
where st_name='TamilNadu';

-------------------------performance tuning set-3 Queries--------------------------------------

1--total male candidates participated in election each year

select year,count(cand_name) as candidatename 
from election
where cand_sex='M'
group by year;

2--Andhra Pradesh Candidate list each year
select year,cand_name as candidatename
from election 
where st_name='Andhra Pradesh';

3-- count of how many times congress got above 50% votes in bihar state
select count(*) as count 
from ELECTION
where PARTYABBRE='INC'
and st_name='Bihar'and ((TOTVOTPOLL/ELECTORS)*100)<50;

4--bjp candidate list in descending order
select cand_name as candidatename
from election 
where partyabbre='BJP'
order by cand_name desc;

5--total votes bjp got in bihar state in 1996
select sum(TOTVOTPOLL) as totalvotes
from election 
where PARTYABBRE='BJP'and year=1996;

-------------basic queries on election table--------------------------------------------
1--state names from election table
select distinct(st_name) as state
from election;

2--total parties participated in elections
select distinct(partyname) from election;

3--count of how many times elections were held
select count(distinct year)as count 
from ELECTION;

4--constituency names in elections
select distinct(PC_NAME) from Election;

5--Candidate type in elections
select distinct(PC_TYPE) from election;

6--abbrevations of parties participating in elections
select distinct(PARTYABBRE) from election;

7-- total count of independent party candidates from election
select count(cand_name) as candidatename
from election
where partyname='Independents';




