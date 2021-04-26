-- 삭제할때는 꼬리부터 자른다.
drop table t_takes; 
drop table t_class;
drop table t_course;
drop table t_student;
drop table t_professor;
drop table t_dept;

create table t_dept (
	id		integer			primary key,
	name	varchar2(500)	not null,
	office  varchar2(500)	not null
);

create table t_professor (
	id			integer			primary key,
	dept_id		integer			references t_dept (id),
	ssn 		char(14)		not null,
	name		varchar2(500)	not null,
	position	varchar2(10),
	year_emp  	integer			not null
);

create table t_student (
	id			integer			primary key,
	dept_id		integer			references t_dept (id),
	ssn 		char(14)		not null,
	name		varchar2(500)	not null,
	year  		integer			not null
);

create table t_course (
	id		char(4)			primary key,
	title	varchar2(500)	not null,
	credit  integer			not null
);

create table t_class (
	id			char(7)			primary key,
	prof_id		integer			references t_professor (id),
	course_id	char(4)			references t_course (id),
	year 		integer,
	semester	integer,
	division	char(1),
	class_room  varchar2(500),
	enroll		integer			
);

create table t_takes(
	class_id	char(7)		references t_class (id),
	student_id	integer		references t_student (id),
	grade		char(2),
	primary key(student_id, class_id)			
	-- 어떤 순서로 인덱스를 만들어야 할까?
	-- create : 시험치고 평가하고 등록할때.
	-- update : 
	-- delete : 
	-- select : 학생			
);

--인덱스는 항상 read 할때 빠름.
--과, 교과목 입장에서 빠르게 처리할때
create index idx_takes_cls on t_takes(class_id, grade);