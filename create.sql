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

INSERT INTO HOUSES VALUES (1, 'Summer Gallegos', 6, 1, 2553500, 81231, '2020-06-24', 'Karen Cisneros', 'New York', 'Not Sold'); 
INSERT INTO HOUSES VALUES (2, 'Liam Hood', 4, 1, 1715212, 74420, '2020-08-23', 'Dillon Mcclure', 'Los Angeles', 'Not Sold');
INSERT INTO HOUSES VALUES (3, 'Enzo Burgess', 5, 3, 2532682, 19424, '2020-09-26', 'Seth Mcleod', 'Los Angeles', 'Not Sold');
INSERT INTO HOUSES VALUES (4, 'Mackenzie Lambert', 5, 3, 2421988, 60784, '2020-05-10', 'Liam Hanson', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (5, 'Danielle Bowers', 2, 2, 131126, 46878, '2020-06-01', 'Verity Morrow', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (6, 'Elsa Collier', 7, 1, 1256833, 65969, '2021-07-27', 'Ishaq Matthams', 'Chicago', 'Not Sold');
INSERT INTO HOUSES VALUES (7, 'Samira Burns', 1, 2, 2258594, 75485, '2021-10-23', 'Liam Hanson', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (8, 'Hector Galvan', 4, 3, 1010053, 49853, '2021-07-01', 'Seth Mcleod', 'Houston', 'Not Sold');
INSERT INTO HOUSES VALUES (9, 'Katy Mcintosh', 1, 1, 2009602, 56207, '2021-04-13', 'Karen Cisneros', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (10, 'Miles Raymond', 7, 3, 2338257, 60963, '2021-12-13'), 'Conor Wood', 'Chicago', 'Not Sold')


INSERT INTO SALES VALUES (10, 1, 'Lacie Rollins', 250000, 'Karen Cisneros', '2022-11-05', 'New York');
INSERT INTO SALES VALUES (11, 3, 'Alice Christian', 450000, 'Seth Mcleod', '2022-11-05', 'New York');
INSERT INTO SALES VALUES (12, 6, 'Alice Christian', 450000, 'Ishaq Matthams', '2022-11-05', 'San Francisco');
INSERT INTO SALES VALUES (13, 10, 'Alice Christian', 450000, 'Conor Wood', '2022-11-05', 'San Francisco');
INSERT INTO SALES VALUES (14, 2, 'Alice Christian', 450000, 'Dillon Mcclure', '2022-11-05', 'San Francisco');

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
    
    
