Q- Swap Salary
update salary
set sex = case
when sex = 'm' then 'f'
when sex = 'f' then 'm'
end
where sex = 'f' or sex = 'm'
