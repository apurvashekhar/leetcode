Q- Find the Quiet Students in All Exams
select *
from (
    select student_id, student_name
    from Student
    where (student_id, student_name) not in (
        select student_id, student_name
        from(
             select exam_id, e.student_id, score, student_name,
            max(score) over(partition by exam_id ) as max_score,
            min(score) over(partition by exam_id ) as min_score
            from Student s right join Exam e
            on s.student_id = e.student_id) foo
where score = max_score or score = min_score)) f
where student_id in (select distinct student_id from Exam)
