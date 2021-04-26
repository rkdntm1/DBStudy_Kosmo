create table t_id_seed(
	seq_id		number(19)		primary key,
	seed 		char(10)
);

select * from t_id_seed order by seed;

CREATE OR REPLACE FUNCTION get_id(intSeed number) RETURN char
IS
	ret char(10);
BEGIN
	select seed into ret from t_id_seed where seq_id = intSeed;
	RETURN ret;
END;

select get_id(15) from dual