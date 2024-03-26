select products.ProductID, products.Name, sales.PricePerUnit, sales.Quantity, sales.PricePerUnit * sales.Quantity AS Total 
from products -- this is the left table so all results from this table
left join sales -- and what matches in this table will also display too
on sales.ProductID = products.ProductID
where sales.Quantity IS NUll
order by products.Name;

-- next below
select * from reviews;

select p.ProductID, p.Name, r.Reviewer, r.Comment, r.Rating 
from reviews as r
inner join products as p
on p.ProductID = r.ProductID
order by r.Rating desc;
