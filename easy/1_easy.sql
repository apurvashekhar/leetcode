Q- Customers who never order
SELECT Customers.Name as Customers
FROM Customers
WHERE Id NOT IN (Select CustomerID from Orders)
Order By Customers.Name
