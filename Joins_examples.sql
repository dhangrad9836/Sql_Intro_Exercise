-- products and sales
select products.ProductID, products.Name, sales.PricePerUnit, sales.Quantity, sales.PricePerUnit * sales.Quantity AS Total 
from products -- this is the left table so all results from this table
left join sales -- and what matches in this table will also display too
on sales.ProductID = products.ProductID
where sales.Quantity IS NUll
order by products.Name;

-- next below
select * from reviews;

-- reviews and products
select p.ProductID, p.Name, r.Reviewer, r.Comment, r.Rating 
from reviews as r
inner join products as p
on p.ProductID = r.ProductID
order by r.Rating desc;

-- employees and sales
-- Ask what am I looking for...sales or employees
-- what sale by which employee so sales table is the primary table..display employee and the sale
select e.EmployeeID, concat(e.FirstName, " ", e.LastName) as Name, s.Quantity, s.PricePerUnit, s.Quantity * s.PricePerUnit as Total
from sales as s
inner join employees as e
on e.EmployeeID = s.EmployeeID -- the on keyword links the two tables with the pk or what is in common
ORDER BY e.employeeID;

-- same query above but with a second inner join to see what products each person sold
select e.EmployeeID, concat(e.FirstName, " ", e.LastName) as Name, p.name as Product, s.Quantity, s.PricePerUnit, s.Quantity * s.PricePerUnit as Total
from sales as s
inner join employees as e
on e.EmployeeID = s.EmployeeID
inner join products as p
on s.ProductID = p.ProductID -- the on keyword links the two tables with the pk or what is in common
ORDER BY e.employeeID;

-- same query above but with a second inner join to see what products each person sold
-- find info about employee John Ford..use aggregration
 -- if you have aggregrate function that aggregrate to one record from many
 -- and you need to look at groups
 -- use a group by
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
    Round(AVG(s.Quantity),2) AS AVGQuantity,
    SUM(s.quantity) AS TotalQuantity,
    Round(AVG(s.priceperunit),2) AS AvgPricePerUnit,
    SUM(s.priceperunit * s.quantity) AS TotalValue
FROM
    sales AS s
        INNER JOIN
    employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID -- very important to use group by with aggregation
ORDER BY TotalValue desc;


-- same query above but with a second inner join to see what products each person sold
-- find info about employee John Ford..use aggregration
 -- if you have aggregrate function that aggregrate to one record from many
 -- and you need to look at groups
 -- use a group by
 -- adding a having clause to add a condition instead of using a where since we have a group by
 -- place the having after the group by
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS Employee,
    Round(AVG(s.Quantity),2) AS AVGQuantity,
    SUM(s.quantity) AS TotalQuantity,
    Round(AVG(s.priceperunit),2) AS AvgPricePerUnit,
    SUM(s.priceperunit * s.quantity) AS TotalValue
FROM
    sales AS s
        INNER JOIN
    employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID -- very important to use group by with aggregation
having TotalValue > 7500 -- add condition here instead of a where clause when using group by
-- we are testing for employees who sold more than 7500...if we want to test to see who sold a small amount ie: who didn't meet quota you can do a having < 300 and it would display employees who had low figures
ORDER BY TotalValue desc;



