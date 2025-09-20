with student_grade AS (
    select Students.ID, Students.Name, Students.Marks, Grades.Grade
    from Students
    join Grades on Students.Marks between Grades.Min_Mark and Grades.Max_Mark
)
SELECT
   case 
      when Grade < 8 then null 
   else Name 
   end as Name, 
   Grade, 
   Marks
from student_grade
order by 2 desc, 1 asc, 3 asc;
