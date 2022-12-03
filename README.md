# SQL Database Project: Real Estate Head Office

## Description
I built a database system for a real estate company. The project consists of three SQL files for each housing listing, successful sale, and agent information. In addition, five required queries were successfully implemented. 

### Inserting data
1. When a new house is listed for sale, it is recorded to the HOUSES table along with the following information: seller name, # of bedrooms, # of bathrooms, listing price, zip code, date of listing, the listing estate agent, the appropriate office, the status of the listing which is "Not sold" by default. 
2. When a house is sold, it is recorded in the SALES table, which captures unique house id, buyer name, sale price, agent id, agent name, date of sale, the responsible office, and the status of the listing which is by default "Sold." When a house is inserted into the Sales table, its status is changed to "Sold" in the original Houses table to reflect its new status. 

### Normalization and Indices
* I used data normalization principles to ensure consistency within a database. Specifically, tables AGENTS, HOUSES, and SALES have unique primary keys to identify each row uniquely. It allowed me to achieve 1NF since there are no duplicated rows in the table, each cell is single-valued, and entries in a column are the same. Three tables are also in 2NF since it is in 1NF and has no partial dependencies. It also meets 3NF since there is no transitive dependency. As a result, it is easier to make queries and add and remove data. In addition, this minimizes duplicate data, avoids data modification issues, and simplifies queries. 
* I created indices for the main variables in the query. For example, for the fourth query, I created indices for LISTINGDATE and SOLDDATE. The purpose is to speed up the run time of the query. The changes become significant as more data is added to tables.

### Querying data

* Find the top 5 offices with the most sales for that month.

Using the strftime function, I selected rows with only sales made in the same month (April 2020 in this testing example) to find the total sum of sales made for each office. Out of all offices, the top five were returned in the descending order of sales. 

```
SELECT OFFICE, SUM(SALEPRICE) FROM SALES WHERE strftime('%m',SALES.SOLDDATE) = strftime('%m','2020-04-01')
    GROUP BY OFFICE 
    ORDER By SUM(SALEPRICE) DESC LIMIT 5;
```

* Find the top 5 estate agents who have sold the most for the month (include their contact details and their sales details so that it is easy contact them and congratulate them).

Similarly, I found the total sales in dollars all the agents have made in the given month and outputted the top five in descending order. Their personal information was extracted from the AGENTS table after joining the table with the SALES table given the AGENTID column. 

```
SELECT SALES.AGENTNAME, AGENTS.EMAIL, SUM(SALES.SALEPRICE) FROM SALES 
JOIN AGENTS ON SALES.AGENTID = AGENTS.AGENTID WHERE strftime('%m',SALES.SOLDDATE) = strftime('%m','2020-04-01')
    GROUP BY AGENTNAME
    ORDER By SUM(SALEPRICE) DESC LIMIT 5;
```

* Calculate the commission that each estate agent must receive and store the results in a separate table.

Firstly, I created a separate table for all commissions for all the sales recorded in the SALES table. Specifically, the new table has columns for the agent name, the commission amount, and the house sold date. Then I selected rows corresponding to sales made in the given month and copied the entries to the AGENTCOMISSION table, which has individual entries for each agent and the sum of all commissions for them. As a result, with more data, we can make separate agent commission tables for each month. 

```
CREATE TABLE ALLCOMISSIONS (
    AGENTNAME VARCHAR(20),
    COMMISSION INTEGER,
    SOLDDATE DATETIME
);

INSERT INTO ALLCOMISSIONS (AGENTNAME, COMMISSION, SOLDDATE)
SELECT AGENTNAME, SALEPRICE * 0.1, SOLDDATE FROM SALES WHERE SALEPRICE < 100000 union all
SELECT AGENTNAME, SALEPRICE * 0.075, SOLDDATE FROM SALES WHERE SALEPRICE > 100000 and SALEPRICE < 200000 union all
SELECT AGENTNAME, SALEPRICE * 0.06, SOLDDATE FROM SALES WHERE SALEPRICE > 200000 and SALEPRICE < 500000 union all
SELECT AGENTNAME, SALEPRICE * 0.05, SOLDDATE FROM SALES WHERE SALEPRICE > 500000 and SALEPRICE < 1000000 union all
SELECT AGENTNAME, SALEPRICE * 0.04, SOLDDATE FROM SALES WHERE SALEPRICE > 1000000;

CREATE TABLE AGENTCOMISSION AS 
SELECT AGENTNAME, SUM(COMMISSION) FROM ALLCOMISSIONS 
WHERE strftime('%m',ALLCOMISSIONS.SOLDDATE) = strftime('%m','2020-04-01') GROUP BY AGENTNAME;

SELECT * FROM AGENTCOMISSION;
```

* For all houses that were sold that month, calculate the average number of days on the market.

I selected rows of sales in the given month and joined the HOUSES and SALES tables. Using the JULIANDAY function, I found a difference in days between two dates (data of posting and selling) for each sold house and returned the average amount in days.

```
SELECT AVG(JULIANDAY(SALES.SOLDDATE) - JULIANDAY(HOUSES.LISTINGDATE)) 
FROM HOUSES JOIN SALES ON HOUSES.HOUSEID = SALES.HOUSEID 
WHERE strftime('%m',SALES.SOLDDATE) = strftime('%m','2020-04-01');
```

* For all houses that were sold that month, calculate the average selling price

Similarly, I selected all houses sold that month and averaged their sale price. 

```
SELECT AVG(SALES.SALEPRICE)
FROM HOUSES JOIN SALES ON HOUSES.HOUSEID = SALES.HOUSEID 
WHERE strftime('%m',SALES.SOLDDATE) = strftime('%m','2020-04-01');
```

#### Execution (SQLite)

```sqlite3
.read create.sql
```
