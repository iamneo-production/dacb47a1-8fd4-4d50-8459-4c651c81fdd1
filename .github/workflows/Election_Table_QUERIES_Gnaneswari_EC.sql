Election_Table_QUERIES_Gnaneswari_EC

desc election;
select * from election;
#query to find total count of female candidates participating in each year
 select year,count(CAND_SEX) as female_candidates
 from election
 where cand_sex='F'
 group by year;

 #query to find total candidates participated in election at each state and each year
 select st_name,year,count(CAND_NAME)as total_candidates
 from election
 group by ST_NAME,year
 order by year asc;

 #query to find total votes BJP got in each state in the year 1987
 select count(totvotpoll),ST_NAME
 FROM ELECTION
 WHERE PARTYNAME='BJP' and year=1987
 group by st_name;

 #query to find total candidates participated in the election in each state in year 2004
 select st_name,count(cand_name) as total_candidates
 from election
 where year=2004
 group by ST_NAME;

 #query to find top 5 parties that got most votes in uttarpradesh in year 2014
 select partyname
 from (select rownum slno,partyname
       from(select distinct PARTYNAME
            from election
            where ST_NAME='Uttar pradesh' and year=2014
            order by  partyname desc))
where slno<6;