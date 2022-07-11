Q- Ad-Free Sessions
select distinct session_id
from playback
where session_id not in (select distinct session_id
from Playback p, Ads a
where p.customer_id = a.customer_id
and a.timestamp between p.start_time and p.end_time
order by 1)
