Election_Table_QUERIES_Gnaneswari_EC

desc election;  #---description of election table---#

select * from election;  #---fetching data from election table---#

#--------General queries of election table----------#

select st_name from election;

select distinct(partyname) from election;

select distinct(year) from election;

select count(totvotpoll) from election group by year;

#------------------performance tuning queries on election table------------------------#

#----query to find total count of female candidates participating in each year----#
 select year,count(CAND_SEX) as female_candidates
 from election
 where cand_sex='F'
 group by year
 order by year;

 #----query to find total candidates participated in election at each state and each year----#
 select st_name,year,count(CAND_NAME)as total_candidates
 from election
 group by ST_NAME,year
 order by year asc;

 #----query to find total votes BJP got in each state in the year 1987----#
 select count(totvotpoll),ST_NAME
 FROM ELECTION
 WHERE PARTYNAME='BJP' and year=1987
 group by st_name;
                         #----since,election didnot held in 1987 output will be no rows fetched----#


 #----query to find total candidates participated in the election in each state in year 2004----#
 select st_name,count(cand_name) as total_candidates
 from election
 where year=2004
 group by ST_NAME;

 #----query to find top 5 parties that got most votes in uttarpradesh in year 2014----#
 select partyname
 from (select rownum slno,partyname
       from(select distinct PARTYNAME
            from election
            where ST_NAME='Uttar pradesh' and year=2014     
            order by  partyname desc))
where slno<6;
                         #----since,uttar pradesh is not in the table data, output will be no rows fetched----#



#--------------frequent queries on performance tuning--------------------#