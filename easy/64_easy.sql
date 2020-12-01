Q- Fix Names in a Table
select user_id,
concat ( upper(substring(name,1,1)), lower(right(name,length(name)-1))) as name
from Users
order by user_id
