

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

6.
--write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and 
--salesman_id higher than 5005 or purch_amt greater than 1000.
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id.  
--Sample table : orders



7.
--Salespeople with Commission Range 0.10-0.12
--From the following table, write a SQL query to find the details of those salespeople 
--whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 
--Sample table : salesman

8.
-- Orders with Amount < 200 or Exclusions
--From the following table, write a SQL query to find details of all orders with a purchase amount less than
--200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009.
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
--Sample table : orders

9.
-- Conditional Orders Exclusions
--From the following table, write a SQL query to find all orders that meet the following conditions.
--Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
--Sample table : orders

10.
--Orders with Achieved Percentage > 50%
--Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders
--that exceed 50% of the target value of 6000.  
--Sample table: orders

11.
-- Employees with Last Name Dosni or Mardy
--From the following table, write a  SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. 
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  
--Sample table : emp_details

12.
--Employees in Department 47 or 63

--rom the following table, write a SQL query to find the employees who work at depart 47 or 63.
--Return emp_idno, emp_fname, emp_lname, and emp_dept.  

--Sample table : emp_details