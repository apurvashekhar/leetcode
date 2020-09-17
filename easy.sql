Q- Customers who never order
SELECT Customers.Name as Customers
FROM Customers
WHERE Id NOT IN (Select CustomerID from Orders)
Order By Customers.Name

Q- Big Countries
select name, population, area
from World
where area > 3000000 or population > 25000000
order by 1

Q- Combine Two Tables
select FirstName, LastName, City, State
from Person P left join Address A
on P.PersonID = A.PersonID
