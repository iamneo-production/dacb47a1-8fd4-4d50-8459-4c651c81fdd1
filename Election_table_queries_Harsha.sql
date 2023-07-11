
---------------------***************Basic Queries of Election Table  ************---------------------

--To know the Election table structure 
  desc election;

-- To fetch all the data from the Election Table
   select * from ELECTION;

--1.To know the NUmber of states in the Election Table
   select distinct(st_name) from election;    --it shows names of the states
   select count(distinct(st_name)) from election;   --It shows the count/ number of states.

--To know the Constituency names and count of constituency from the election table   
  select distinct(pc_name) from election;      ---It shows the name of the Constituencies.
  select count(distinct(pc_name)) from election;   --It shows the number of constituencies in the election table.

--In which Years the Elections had been Conducted/Organised
   select distinct(year) from election
   order by year desc;         --this query shows the output of years that elections been conducted in Descending order.

--Total Parties available in the Election table
   select distinct(partyname) from election;   --This query shows the output of partynames in the Election Table.
   select count(distinct(partyname)) from election;  --This query shows the output of count/number of Parties available.   

--Total party Abbrevations in the election Table
  select distinct(PARTYABBRE) from election
   order by partyabbre;                         --This query shows the output of party Abbrevations in the Election Table.

   select count(distinct(PARTYABBRE)) from election;  --This query shows the output of count/number of Parties abbrevations available.  


   -------------------------------------------------------------------------------------------------------------------------------------------
   ---------------------------------------************* Oracle Workspace Queries ****************----------------------------------------------
   -------------------------------------------------------------------------------------------------------------------------------------------

--1. To find the Total count of female candidates Participating in each year.
     select count(distinct(CAND_NAME)) as Female_count,YEAR from election
     where cand_sex='F'  
     group by  year
     order by year desc;   
       --This query shows the output of Female candidates participating in the Elections every year in the descending order form.

--2. To Find the Total candidates who participated in the election at each state in each year.
    select count(CAND_NAME),st_name,year from election
    group by st_name,year
    order by st_name,year;     
      --This query shows the output of count of candidates participating in the Elections in each state and each year.  

--3. To find the total votes BJP in each state in the year 1987.
     select sum(TOTVOTPOLL) as BJP_VOTES,st_name from election
     where partyabbre='BJP' and year=1987
     group by st_name,partyabbre,year;       
       --This query shows the output of "No rows selected" because on that Year i.e., 1987 there was no elections held.
       --instead of the above query Iam going to change the year in which the election held to get the similar output. 
       ---taking year=1984
      select sum(TOTVOTPOLL) as BJP_VOTES,st_name,year from election
     where PARTYABBRE='BJP' and year=1984
     group by st_name,year,partyabbre;      

--4. To Find the total candidates who participated in election in each state in the year 2004.
     select count(cand_name) as TOTAL_CANDIDATES,st_name,year
     from election
     where year=2004
     group by st_name,year;     
    
--5. To fetch the top 5 parties that got the most votes in UTTAR PRADESH in the year 2014.
     select sum(totvotpoll) as Most_votes,PARTYABBRE
      from election
      where st_name='Uttar Pradesh' and year=2014  
      group by partyabbre
      order by Most_votes desc
      fetch first 5 rows only;
     --According to the above query the output of that shows "No rows Fetched" because the data of the uttar pradesh is not available in the election table
     --so instead of that to get the similar output i've changed the state_name to 'Andhra Pradesh'.
     
      select sum(totvotpoll) as Most_votes,partyabbre
      from election
      where st_name='Andhra Pradesh' and year=2014 
      group by partyabbre
      order by Most_votes desc
      fetch first 5 rows only;  


--------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------**************Performance tuning *************-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. To find the total votes BJP got in each state in the year 1989.
     select sum(TOTVOTPOLL) AS TOTAL_VOTES,st_name
     from ELECTION
     where year=1989 and PARTYABBRE='BJP'
     group by st_name;


--7.To find the total votes BJP got in the state 'ANDHRA PRADESH' in the year 1984.
    select sum(TOTVOTPOLL) as Total_votes
    from ELECTION
    where st_name='Andhra Pradesh' and year=1984
    group by st_name;

--8. Find the Total vote percentage of BJP get in AP state in the year 2004.
      select (sum(TOTVOTPOLL)/sum(electors))*100 as vote_percentage
      from ELECTION
      where st_name='Andhra Pradesh' and year=2004;    

--9. How many times has BJP gotten an above 50% votes.
     select count(*) as count_above_50
     from ELECTION
     where PARTYNAME='BJP' and ((TOTVOTPOLL/electors)*100)<50;
    
  
--10.  what is the state list the BJP gets below 75% vote.
    select distinct(st_name) as state_list
    from election
    where partyname='BJP' and  ((totvotpoll/ELECTORS)*100)<75; 


--11. find the total candidates who participated in Assam state in 2014.
      select count(CAND_NAME) as TOTAL_CANDIDATES
      from ELECTION
      where st_name='Assam' and year=2014;

----------------------------------------------------------------------------------------------------------------
------------------------------------*************performance tuning set2 ***********----------------------------
--------------------------------------------------------------------------------------------------------------------

--1.   Display the candidates list participated at state Andaman & nicobar islands in the year 1984.
    select cand_name
    from election
    where st_name='Andaman & Nicobar islands' and year=1984 and PARTYNAME='BJP';      

--  2.How many Male candidates participated in elections in each state.
    select  count(*),ST_NAME
    from ELECTION
    where CAND_SEX='M'
    group by st_name;    

--  3. Display the party name in descending order.
     select distinct(PARTYNAME)
     from ELECTION
     order by partyname desc;         

-- 4. Display the Bihar candidates list each year.
    select distinct(cand_name),year
    from election
    where st_name='Bihar'
    order by year desc;    

--5.  Display how many candidates participated at state Assam in the year 1984.    
     select count(cand_name) as candidates_count
    from election
    where st_name='Assam' and year=1984;


-----------------------------------------------------------------------------------------------------------------
------------------------------**************Performance tuning set 3***************------------------------------
-----------------------------------------------------------------------------------------------------------------


--1. To calculate Total votes got BJP in bihar state in 1996.
select sum(TOTVOTPOLL)
from ELECTION
where st_name='Bihar' and year=1996 and PARTYABBRE='BJP'
group by st_name,year;

--2. To display the BJP candidates list in descending order.
      select distinct(cand_name)
    from election
    where partyabbre='BJP'
    ORDER by CAND_NAME desc; 

--3. Find how many times congress gets above 50% vote in bihar state.
     select count(*)
     from election
     where PARTYABBRE='INC' and st_name='Bihar' and ((totvotpoll/ELECTORS)*100)<50;
  



