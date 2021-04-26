create table t_body (
	id		integer			primary key,
	name	varchar2(500)	not null,
	addr    varchar2(500)	not null
);

create table t_arm (
	body_id		integer,
	lr			integer		not null,
	leng    	integer,
	primary key(body_id, lr)
);

insert into t_body values(1, '홍길동', '한양 1번지');
insert into t_body values(2, '이순신', '서산 1번지');
insert into t_body values(3, '홍길순', '한양 2번지');

insert into t_arm values(2, 1, 120);
insert into t_arm values(2, 2, 130);

/* er : 주체, 능동태,    ~ee : 객체, 수동, 대상 */
--Oracle 전용.. 만 제공하는 문법
select *
  from t_body b, t_arm a
 where b.id = a.body_id(+); --outer : 본체는 나옴
-- 표준문법 letf outer join 왼쪽이 주체, 오른쪽이 객체   < > right outer join
select *
  from t_body b left outer join t_arm a on b.id = a.body_id; 
select *
  from t_arm a right outer join t_body b on b.id = a.body_id;
  
