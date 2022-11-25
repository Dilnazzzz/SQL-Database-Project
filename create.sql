.mode column
PRAGMA foreign_keys = ON; -- activates foreign key features in sqlite. It is disabled by default

CREATE TABLE HOUSES (
    HOUSEID INTEGER PRIMARY KEY,
    SELLERNAME VARCHAR(20),
    NUMBEROFBEDROOMS INTEGER,
    NUMBEROFBATHROOMS INTEGER,
    PRICE INTEGER,
    ZIPCODE INTEGER,
    LISTINGDATE DATETIME,
    AGENTNAME VARCHAR(20),
    OFFICE VARCHAR(20),
    STATUS INTEGER
);

CREATE TABLE SALES (
    SALEID INTEGER PRIMARY KEY,
    HOUSEID INTEGER,
    BUYERRNAME VARCHAR(20),
    SALEPRICE INTEGER,
    AGENTNAME INTEGER,
    FOREIGN KEY (HOUSEID) REFERENCES HOUSES(HOUSEID),
    FOREIGN KEY (AGENTNAME) REFERENCES HOUSES(AGENTNAME)
);

INSERT INTO HOUSES VALUES (1, 'Neha Haines', 2, 1, 250000, 14738, '2022-11-01 8:00:00', 'Pamela Charles', New York, "Not Sold");
INSERT INTO HOUSES VALUES (2, 'Luis Taylor', 3, 1, 450000, 84003, '2022-11-02 8:00:00', 'Timothy Hansen', New York, "Not Sold");
INSERT INTO HOUSES VALUES (3, 'Neha Haines', 4, 2, 500000, 34003, '2022-11-03 8:00:00', 'Pamela Charles', New York, "Not Sold");


INSERT INTO SALES VALUES (10, 1, 'Lacie Rollins', 250000, 'Pamela Charles');
INSERT INTO SALES VALUES (11, 3, 'Alice Christian', 450000, 'Pamela Charles');


SELECT '';
SELECT "Find the top 5 offices with the most sales for that month";
SELECT '----------------------------------------------------';
SELECT NAME FROM RUBY
    JOIN RACES ON RACES.RACEID = RUBY.RACEID
    WHERE RUBY.RACEID = 1
    ORDER By RUBY.RUNTIME;
    
SELECT '';
SELECT "Find the top 5 estate agents who have sold the most for the month (include their contact details and their sales details so that it is easy contact them and congratulate them)";
SELECT '----------------------------------------------------';
SELECT NAME FROM RUBY
    JOIN RACES ON RACES.RACEID = RUBY.RACEID
    WHERE RUBY.RACEID = 1
    ORDER By RUBY.RUNTIME;

SELECT '';
SELECT "Calculate the commission that each estate agent must receive and store the results in a separate table";
SELECT '----------------------------------------------------';
SELECT NAME FROM RUBY
    JOIN RACES ON RACES.RACEID = RUBY.RACEID
    WHERE RUBY.RACEID = 1
    ORDER By RUBY.RUNTIME;

SELECT '';
SELECT "For all houses that were sold that month, calculate the average number of days on the market";
SELECT '----------------------------------------------------';
SELECT NAME FROM RUBY
    JOIN RACES ON RACES.RACEID = RUBY.RACEID
    WHERE RUBY.RACEID = 1
    ORDER By RUBY.RUNTIME;


SELECT '';
SELECT "For all houses that were sold that month, calculate the average selling price";
SELECT '----------------------------------------------------';
SELECT NAME FROM RUBY
    JOIN RACES ON RACES.RACEID = RUBY.RACEID
    WHERE RUBY.RACEID = 1
    ORDER By RUBY.RUNTIME;
    
    
