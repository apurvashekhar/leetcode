Q- Delete duplicate email using DELETE
DELETE FROM Person WHERE
Id NOT IN (SELECT MIN(p.Id) FROM (SELECT * FROM Person) p
Group by p.Email);
