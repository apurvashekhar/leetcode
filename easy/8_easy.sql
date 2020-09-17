Q- Rising Temperature
select w1.id
from Weather w1
where w1.Temperature > (select w2.Temperature
                        from Weather w2
                        where datediff(w1.recordDate, w2.recordDate) = 1)
