--public long get_id(long val) {
--	return val + 10;
--}

-- 함수 만들기
CREATE OR REPLACE FUNCTION get_id(intSeed number) RETURN NUMBER -- get_id : 함수 이름/ intSeed number : 매개변수
IS
BEGIN -- {
	RETURN intSeed + 10;
END; -- }

select get_id(15) from dual