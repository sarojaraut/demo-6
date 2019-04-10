drop table course;
drop table student;
drop table enrollment;

drop sequence course_seq;
drop sequence student_seq;
drop sequence enrollment_seq;


create table course(
    id                number,
    name              varchar(100),
    description       varchar(300),
    status            varchar(20),
    primary key(id)
);

create table student(
    id                number,
    firstname        varchar(100),
    lastname         varchar(100),
    address           varchar(300),
    status            varchar(20),
    primary key(id)
);

create table enrollment(
    id                number,
    student_id        number,
    course_id         number,
    created_dtm       timestamp,
    changed_dtm       timestamp,
    primary key(id)
);

create sequence course_seq     start with 1 increment by 1;
create sequence student_seq    start with 1 increment by 1;
create sequence enrollment_seq start with 1 increment by 1;
