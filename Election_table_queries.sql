-- Election table
CREATE TABLE ELECTION (
    ST_NAME VARCHAR(30) not null,
    YEAR NUMBER not null,
    PC_NO NUMBER not null,
    PC_NAME VARCHAR(50)  not null,
    PC_TYPE VARCHAR(15) ,
    CAND_NAME VARCHAR(50) not null,
    CAND_SEX CHAR(2),
    PARTYNAME VARCHAR(10) not null,
    PARTYABBRE VARCHAR(50) not null,
    TOTVOTPOLL NUMBER not null,
    OBTVOTPOLL NUMBER not null
);

desc election;


