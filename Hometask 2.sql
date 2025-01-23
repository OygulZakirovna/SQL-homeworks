

--home assignment 3

--tasks from w3resourse
--Retrieve data from tables; 12 exercies


1. 
--write a  SQL query to locate the details of customers with grade values above 100. 
--Return customer_id, cust_name, city, grade, and salesman_id. 
--Sample table: customer

select * from [Inventory].[Customer]
where grade > 100 



2.
--write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. 
--Return customer_id, cust_name, city, grade, and salesman_id.  
--Sample table: customer

select customer_id, cust_name, city, grade, salesman_id from [Inventory].[Customer]
where city = 'New York' and grade > 100;




3.
-- write a SQL query to find customers who are from the city of New York or have a grade of over 100.
-- Return customer_id, cust_name, city, grade, and salesman_id.  
--Sample table: customer

select customer_id, cust_name, city, grade, salesman_id from [Inventory].[Customer]
where city = 'New York' or grade > 100;

4.
-- write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. 
-- Return customer_id, cust_name, city, grade, and salesman_id.  
--Sample table: customer

select customer_id, cust_name, city, grade, salesman_id from [Inventory].[Customer]
where city = 'New York' or grade  <= 100;



5.
--write a SQL query to identify customers who are not from the city of 'New York' and do not have a grade value greater than 100. 
--Return customer_id, cust_name, city, grade, and salesman_id.
--Sample table: customer

select customer_id, cust_name, city, grade, salesman_id from [Inventory].[Customer]
where  not (city='New York' or   grade  > 100);

