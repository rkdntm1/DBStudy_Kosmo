--행위자(party)
drop table t_detail;
drop table t_trade;
drop table t_product;
drop table t_party;

create table t_party(
	id			integer			primary key,
	name		varchar2(500),
	balance		number(19)   -- long
);
--integer 2 100 000 000  > int number(9)
--2^10 = 10^3 > 2^(10 * 6 + 3) = 10^18 * 8 => 19
--long number(19)

--상품(product)
create table t_product(
	id			integer			primary key,
	seller		integer			references t_party(id),
	name		varchar2(500),
	unitprice	integer,
	stock		integer
);

--거래
create table t_trade(
	id			integer,	
	buyer_id	integer			references t_party(id),		
	when		timestamp 		default sysdate,
	primary key (id)
);

--거래 상세
create table t_detail(
	trade_id		integer,
	product_id		integer,
	count			integer,
	primary key(trade_id, product_id)
);

alter table t_detail add constraint fk_detail2trade foreign key (trade_id) references t_trade(id);
alter table t_detail add constraint fk_detail2product foreign key (product_id) references t_product(id);

drop view v_tot_buy;

t_trade t, t_detail d, t_product p
 where t.buyer_id = 4						-- 구매자 홍길동
   and t.id = d.trade_id					-- trade와 detail 연결
   and d.product_id = p.id  
   
CREATE OR REPLACE VIEW v_amt_per_product AS
select t.id id, t.buyer_id bid, p.id pid, d.count * p.unitprice amt
  from t_trade t, t_detail d, t_product p
 where t.id = d.trade_id				
   and d.product_id = p.id;
   
CREATE OR REPLACE VIEW v_amt_per_product AS
select t.id id, t.buyer_id bid, p.seller psel, d.count * p.unitprice amt
  from t_trade t, t_detail d, t_product p
 where t.id = d.trade_id				
   and d.product_id = p.id;
   
			
   
 from v_tot_buy
where id = 4 
 
 