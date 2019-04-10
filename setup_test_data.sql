-- drop table course;
-- drop table student;
-- drop table enrollment;
--
-- Test Data setup
--
insert into course
select 
    course_seq.nextval,
    name,
    description,
    status
from (
    select
        'BigData'         as name,
        'BigData Course'  as description,
        'active'          as status
    from dual 
    union all
    select
        'Cloud',
        'Cloud Course',
        'active'
    from dual 
    union all
    select
        'BI',
        'BI Course',
        'active'
    from dual
);

insert into student
select
    student_seq.nextval        as id,
    dbms_random.string('U',10) as firstname,
    dbms_random.string('U',10) as lastname,
    dbms_random.string('U',20) as address,
    'active'                   as status
from dual connect by rownum <=10;

insert into enrollment
select
    enrollment_seq.nextval   as id,
    s.id                     as student_id,
    c.id                     as course_id,
    sysdate                  as created_dtm,
    null                     as changed_dtm
from course c
join student s 
on (mod(s.id,c.id)=0);
