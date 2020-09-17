Q- Combine Two Tables
select FirstName, LastName, City, State
from Person P left join Address A
on P.PersonID = A.PersonID
