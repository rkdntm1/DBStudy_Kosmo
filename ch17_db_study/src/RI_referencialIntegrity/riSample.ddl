create sequence seq_master;
create sequence seq_detail;

drop table t_디테일;
drop table t_master;

create table t_master(
	id		number(9)		primary key,
	name	varchar2(500)
);

create table t_디테일(
	id			number(9)					primary key,
	master_id	number(9)		not null 	references t_master(id),-- refer쓰면 성능손해가 일어남	
	d_name		varchar2(500)
);

-- 시퀀스 활용 예 ( seq_master 야 다음 값 줘라 1 2 3 4 ... )
select seq_master.nextval from dual;

insert into t_master(id, name) values(seq_master.nextval, '홍'); --30

select * from t_master;

insert into t_디테일(id, master_id, d_name) values(seq_detail.nextval, 0, '홍왼팔');