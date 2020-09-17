Q- Find Users With Valid E-Mails
select * from users
where mail regexp('^[a-zA-Z][[a-zA-Z0-9]-_.]*@leetcode.com$')
