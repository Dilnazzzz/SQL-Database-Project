# SQL Database Project: Real Estate Head Office

## Description
I built a databse system for a real estate company. The project consists of three sql files for each housing listing, successful sale and agent information. In addition, five required queiries were successfully implemented. 

### Inserting data
1. When a new house is listed for sale, it is recorded to the HOUSES table along with the following information: seller name, # of bedrooms, # of bathrooms, listing price, zip code, date of listing, the listing estate agent, the appropriate office, the status of the listing which is "Not sold" by default. 
2. When a house is sold, it is recorded in the SALES table which captures unique house id, buyer name, sale price, agent id, agent name, date of sale, th responsible office, abd the status of the listing which is by default "Sold". When a house is inderted to Sales table, its status is changed to "Sold" in the original Houses table to reflect its new status. 

### Querying data
#### Normalization, indices, and transactions

Every month the following reports need to be run:

Find the top 5 offices with the most sales for that month.
Find the top 5 estate agents who have sold the most for the month (include their contact details and their sales details so that it is easy contact them and congratulate them).
Calculate the commission that each estate agent must receive and store the results in a separate table.
For all houses that were sold that month, calculate the average number of days on the market.
For all houses that were sold that month, calculate the average selling price


#### Execution (SQLite)

```sqlite3
.read create.sql
```
