create table t_some(
	id			number(19)		primary key,
	name		varchar2(100),
	update_dt	timestamp		default sysdate
);

insert into t_some(id, name)
	values(1, '홍길동');
	
select * from t_some where id = 1;