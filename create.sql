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
    AGENTNAME VARCHAR(20),
    SOLDDATE DATETIME, 
    OFFICE VARCHAR(20),
    FOREIGN KEY (HOUSEID) REFERENCES HOUSES(HOUSEID),
    FOREIGN KEY (AGENTNAME) REFERENCES HOUSES(AGENTNAME)
);

INSERT INTO HOUSES VALUES (1, 'Neha Haines', 2, 1, 250000, 14738, '2022-11-01', 'Pamela Charles', 'New York', "Not Sold");
INSERT INTO HOUSES VALUES (2, 'Luis Taylor', 3, 1, 450000, 84003, '2022-11-02', 'Timothy Hansen', 'New York', "Not Sold");
INSERT INTO HOUSES VALUES (3, 'Neha Haines', 4, 2, 500000, 34003, '2022-11-03', 'Pamela Charles', 'New York', "Not Sold");


INSERT INTO SALES VALUES (10, 1, 'Lacie Rollins', 250000, 'Pamela Charles', '2022-11-05', 'New York');
INSERT INTO SALES VALUES (11, 3, 'Alice Christian', 450000, 'Pamela Charles', '2022-11-05', 'New York');
INSERT INTO SALES VALUES (12, 2, 'Alice Christian', 450000, 'Timothy Hansen', '2022-11-05', 'San Francisco');


SELECT '';
SELECT "Find the top 5 offices with the most sales for that month";
SELECT '----------------------------------------------------';
SELECT OFFICE FROM SALES
    GROUP BY OFFICE
    ORDER By COUNT(*) DESC LIMIT 5;

    
SELECT '';
SELECT "Find the top 5 estate agents who have sold the most for the month (include their contact details and their sales details so that it is easy contact them and congratulate them)";
SELECT '----------------------------------------------------';
SELECT AGENTNAME FROM SALES
    GROUP BY AGENTNAME
    ORDER By COUNT(*) DESC LIMIT 5;

SELECT '';
SELECT "Calculate the commission that each estate agent must receive and store the results in a separate table";
SELECT '----------------------------------------------------';


CREATE TABLE ALLCOMISSIONS (
    AGENTNAME VARCHAR(20),
    COMMISSION INTEGER
);

INSERT INTO ALLCOMISSIONS (AGENTNAME, COMMISSION)
SELECT AGENTNAME, SALEPRICE * 0.1 FROM SALES WHERE SALEPRICE < 100000 union all
SELECT AGENTNAME, SALEPRICE * 0.075 FROM SALES WHERE SALEPRICE > 100000 and SALEPRICE < 200000 union all
SELECT AGENTNAME, SALEPRICE * 0.06 FROM SALES WHERE SALEPRICE > 200000 and SALEPRICE < 500000 union all
SELECT AGENTNAME, SALEPRICE * 0.05 FROM SALES WHERE SALEPRICE > 500000 and SALEPRICE < 1000000 union all
SELECT AGENTNAME, SALEPRICE * 0.04 FROM SALES WHERE SALEPRICE > 1000000;

CREATE TABLE AGENTCOMISSION AS 
SELECT AGENTNAME, SUM(COMMISSION) FROM ALLCOMISSIONS GROUP BY AGENTNAME;

SELECT * FROM AGENTCOMISSION;


SELECT '';
SELECT "For all houses that were sold that month, calculate the average number of days on the market";
SELECT '----------------------------------------------------';


SELECT AVG(JULIANDAY(SALES.SOLDDATE) - JULIANDAY(HOUSES.LISTINGDATE)) 
FROM HOUSES JOIN SALES ON HOUSES.HOUSEID = SALES.HOUSEID WHERE strftime('%m',SALES.SOLDDATE) = strftime('%m','2022-11-01');
    

SELECT '';
SELECT "For all houses that were sold that month, calculate the average selling price";
SELECT '----------------------------------------------------';
SELECT AVG(SALES.SALEPRICE)
FROM HOUSES JOIN SALES ON HOUSES.HOUSEID = SALES.HOUSEID WHERE strftime('%m',SALES.SOLDDATE) = strftime('%m','2022-11-01');
    
    
