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

INSERT INTO HOUSES VALUES (1, 'Summer Gallegos', 6, 1, 1553000, 81231, '2020-01-04', 'Karen Cisneros', 'New York', 'Not Sold'); 
INSERT INTO HOUSES VALUES (2, 'Liam Hood', 4, 1, 715000, 74420, '2020-01-04', 'Dillon Mcclure', 'Los Angeles', 'Not Sold');
INSERT INTO HOUSES VALUES (3, 'Enzo Burgess', 5, 3, 532000, 19424, '2020-01-06', 'Seth Mcleod', 'Phoenix', 'Not Sold');
INSERT INTO HOUSES VALUES (4, 'Mackenzie Lambert', 5, 3, 1421000, 60784, '2020-01-10', 'Liam Hanson', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (5, 'Danielle Bowers', 2, 2, 131000, 46878, '2020-01-11', 'Verity Morrow', 'San Jose', 'Not Sold');
INSERT INTO HOUSES VALUES (6, 'Elsa Collier', 7, 1, 1256000, 65969, '2020-01-12', 'Ishaq Matthams', 'Chicago', 'Not Sold');
INSERT INTO HOUSES VALUES (7, 'Samira Burns', 1, 2, 258000, 75485, '2020-01-13', 'Liam Hanson', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (8, 'Hector Galvan', 4, 3, 1010000, 49853, '2020-01-13', 'Seth Mcleod', 'Houston', 'Not Sold');
INSERT INTO HOUSES VALUES (9, 'Katy Mcintosh', 1, 1, 609000, 56207, '2020-01-13', 'Karen Cisneros', 'San Diego', 'Not Sold');
INSERT INTO HOUSES VALUES (10, 'Miles Raymond', 7, 3, 338000, 60963, '2020-01-13', 'Conor Wood', 'Chicago', 'Not Sold')
INSERT INTO HOUSES VALUES (11, 'Zainab Garcia', 5, 2, 315000, 80246, '2020-01-16', 'Karen Cisneros', 'Houston', 'Not Sold');
INSERT INTO HOUSES VALUES (12, 'Marilyn Vance', 1, 1, 76000, 25949, '2020-01-17', 'Ishaq Matthams', 'New York', 'Not Sold');
INSERT INTO HOUSES VALUES (13, 'Valentina Craig', 4, 3, 248000, 19272, '2020-01-17', 'Dillon Mcclure', 'Philadelphia', 'Not Sold');
INSERT INTO HOUSES VALUES (14, 'Subhaan Mcmahon', 2, 2, 488000, 52671, '2020-01-22', 'Seth Mcleod', 'Chicago', 'Not Sold');
INSERT INTO HOUSES VALUES (15, 'Alfie Schneider', 6, 3, 563000, 11658, '2020-01-23', 'Dillon Mcclure', 'Los Angeles', 'Not Sold');
INSERT INTO HOUSES VALUES (16, 'Alexandros Maldonado', 5, 3, 200000, 49968, '2020-01-23', 'Liam Hanson', 'Phoenix', 'Not Sold');
INSERT INTO HOUSES VALUES (17, 'Hasnain Love', 7, 1, 845000, 44649, '2020-01-27', 'Cameron Ford', 'Dallas', 'Not Sold');
INSERT INTO HOUSES VALUES (18, 'Elspeth Case', 5, 1, 595000, 25135, '2020-01-27', 'Liam Hanson', 'Los Angeles', 'Not Sold');
INSERT INTO HOUSES VALUES (19, 'Dewi Howard', 4, 2, 756000, 18552, '2020-01-31', 'Karen Cisneros', 'San Antonio', 'Not Sold');
INSERT INTO HOUSES VALUES (20, 'Sasha Little', 2, 3, 806000, 81638, '2020-01-31', 'Verity Morrow', 'Chicago', 'Not Sold');

INSERT INTO SALES VALUES (10, 1, 'Lacie Rollins', 1153000, 'Karen Cisneros', '2020-04-05', 'New York');
INSERT INTO SALES VALUES (11, 3, 'Alice Christian', 632000, 'Seth Mcleod', '2020-04-05', 'Phoenix');
INSERT INTO SALES VALUES (12, 6, 'Neave Gregory', 1356000, 'Ishaq Matthams', '2020-04-07', 'Chicago');
INSERT INTO SALES VALUES (13, 10, 'Amelia Archer', 438000, 'Conor Wood', '2020-04-09', 'Chicago');
INSERT INTO SALES VALUES (14, 12, 'Jorge Gilmore', 96000, 'Ishaq Matthams', '2020-04-15', 'New York');
INSERT INTO SALES VALUES (15, 13, 'Ameer Watson', 348000, 'Dillon Mcclure', '2020-04-15', 'Philadelphia');
INSERT INTO SALES VALUES (16, 14, 'Sana Berger', 588000, 'Seth Mcleod', '2020-04-16', 'Chicago');
INSERT INTO SALES VALUES (17, 15, 'Hajra Middleton', 663000, 'Dillon Mcclure', '2020-04-17', 'Los Angeles');
INSERT INTO SALES VALUES (18, 17, 'Drew Boyd', 945000, 'Cameron Ford', '2020-04-18', 'Dallas');
INSERT INTO SALES VALUES (19, 19, 'Omar Bowers', 456000, 'Karen Cisneros', '2020-04-18', 'San Antonio');
INSERT INTO SALES VALUES (20, 20, 'Marwa Hardy', 506000, 'Verity Morrow', '2020-04-25', 'Chicago');

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
    
    
