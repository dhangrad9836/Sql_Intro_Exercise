/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
select p.Name as ProductName, c.Name as CategoryName
from products as p
inner join categories as c
on c.CategoryID = p.CategoryID
where c.Name = 'Computers'
order by c.CategoryID;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select p.Name, p.Price, r.Rating
from products as p
inner join reviews as r
on p.productid = r.ProductID
where r.Rating = 5
group by p.ProductID;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- better solution @ 41:00 in joins video using subquery
select e.EmployeeID, concat(e.FirstName, " ", e.LastName) as EmpName, sum(s.quantity) as Total
from sales as s
inner join employees as e
on s.EmployeeID = e.EmployeeID
group by e.EmployeeID
-- you can't abbreviate the column names in the having clause b/c it's out of the scope from above so you need to write the full qualified name out ie: sales.employeeID
Having total = (Select sum(sales.quantity) as Total from sales group by sales.employeeid order by Total desc limit 1 );

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select * from categories;
select * from departments;
select d.Name as Dept_Name, c.Name as Ctg_Name
from departments as d
inner join categories as c
on d.DepartmentID = c.DepartmentID
where c.Name like 'games'
or c.Name like 'appliances';

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, sum(s.quantity) as TotalQty, sum(s.priceperunit * s.quantity) as Total_price_sold
 from sales as s
 inner join products as p
 on s.productid = p.ProductID 
 where p.Name = 'Eagles: Hotel California';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.Rating as MINRev, r.comment
from reviews as r
inner join products as p
on r.productid = p.productid
where p.name = "Visio TV"
order by r.rating
limit 1;



-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
-- sales table
-- employees table
-- products table

select sales.EmployeeID, employees.FirstName, employees.LastName, products.Name as Product, sum(sales.Quantity) as QTY, sum(sales.Quantity * sales.PricePerUnit) as TotalAmount
from sales
inner join employees
on sales.EmployeeID = employees.EmployeeID
inner join products
on sales.productid = products.ProductID
group by sales.employeeid, sales.ProductID
order by sales.EmployeeID, totalamount desc;
