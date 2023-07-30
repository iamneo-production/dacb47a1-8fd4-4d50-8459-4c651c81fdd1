---intial queries-----------
-- table structure
desc election;

-------------------------------oracle workspace queries-----------------------------------------
-- total female candidate participating each year
select year, COUNT(CAND_NAME) as count
from ELECTION
where CAND_SEX = 'F'
group by Year;

--total candidates who participated in election at each state in each year
select year,ST_NAME,count(cand_name) as count
from election
group by year,ST_NAME;

--total votes bjp got in each state in year 1987
select ST_NAME,sum(TOTVOTPOLL) 
as totalvotes from election where
 PARTYABBRE='BJP' and year=1987
group by ST_NAME;
--no rows will be fetched by the above query as no elections were held in 1987----------------------

--total candidates who participated in election in each state in year 2004
select ST_NAME,count(cand_name) as count 
from election 
where year=2004
group by ST_NAME;

--top5 parties got the most votes in uttarpradesh in year 2014
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

--totalvotes bjp party got in each state in year 1989
select sum(TOTVOTPOLL) as totalvotes,ST_NAME as state
from ELECTION 
where year=1989 and PARTYABBRE='BJP'
group by st_name;


--total candidates whose party is BRP
select count( CAND_NAME) as candidatecount 
from election
where partyabbre='BRP';

--total votes bjp got in year 1989

select sum(TOTVOTPOLL) as totalvotes 
from ELECTION
where  year= 1989
and partyabbre='BJP';

-- how many times bjp has gotten below 50% votes
select count(*) as count 
from ELECTION
where PARTYABBRE='BJP'
and ((TOTVOTPOLL/ELECTORS)*100)<50;

--state list of bjp where it gets 75% below votes
select ST_NAME as state 
from election 
where PARTYABBRE='BJP' and ((totvotpoll/electors)*100)<75;

-- state list where bjp got below 60% below vote
select ST_NAME as state 
from election 
where PARTYABBRE='BJP' and ((totvotpoll/electors)*100)<60;


-----------------------performance tuning set2 queries--------------------------------------------

--bjp candidate list in andaman&nicobar islands,party='bjp' and year=1984
select CAND_NAME as candidatename
from election 
where st_name='Andaman & Nicobar islands' and 
PARTYNAME='BJP' and year= 1984;

--male candidates participated in elections in each state
select ST_NAME, COUNT(CAND_NAME) as count
from ELECTION
where CAND_SEX = 'M'
group by ST_NAME;

--select partyname in descending order
select  distinct partyname
from election
order by partyname desc;

--candidates participated in year 1988
select count(cand_name) as count
from ELECTION 
where year= 1984;

-- Assam candidate list each year
select year,cand_name as candidatename from election 
where st_name='Assam';

-- TamilNadu candidate lsit each year
select year,cand_name as candidatename from election 
where st_name='TamilNadu';

-------------------------performance tuning set-3 Queries--------------------------------------

--total male candidates participated in election each year

select year,count(cand_name) as candidatename 
from election
where cand_sex='M'
group by year;

--IND Candidate list each year
select year,cand_name as candidatename
from election 
where partyabbre='IND';

-- count of how many times congress got above 50% votes in bihar state
select count(*) as count 
from ELECTION
where PARTYABBRE='INC'
and st_name='Bihar'and ((TOTVOTPOLL/ELECTORS)*100)<50;

--bjp candidate list in descending order
select cand_name as candidatename
from election 
where partyabbre='BJP'
order by cand_name desc;

--total votes bjp got in bihar state in 1996
select sum(TOTVOTPOLL) as totalvotes
from election 
where PARTYABBRE='BJP'and year=1996;

-------------basic queries on election table--------------------------------------------
--state names from election table
select distinct(st_name) as state
from election;

--total parties participated in elections
select distinct(partyname) from election;

--count of how many times elections were held
select count(distinct year)as count 
from ELECTION;

--constituency names in elections
select distinct(PC_NAME) from Election;

--Candidate type in elections
select distinct(PC_TYPE) from election;

--abbrevations of parties participating in elections
select distinct(PARTYABBRE) from election;

-- total count of independent party candidates from election
select count(cand_name) as candidatename
from election
where partyname='Independents';




