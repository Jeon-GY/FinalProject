drop table f_ppt_for_sale;
drop table f_post;

truncate table f_ppt_for_sale;
truncate table f_post;

--board_id, board_name
create table f_board(
	board_id					varchar2(100)	    primary key,
	board_name					varchar2(100)
);
insert into f_board (board_id, board_name)
   values ('1', '카테고리');
insert into f_board (board_id, board_name)
   values ('2', '베스트');
insert into f_board (board_id, board_name)
   values ('3', '라이브');
insert into f_board (board_id, board_name)
   values ('4', '마이페이지');
insert into f_board (board_id, board_name)
   values ('5', '상품 관리');
insert into f_board (board_id, board_name)
   values ('6', '관리페이지');

   
CREATE SEQUENCE sq_post_id;
--post_id, post_name
create table f_post(
	post_id						varchar2(100)	    primary key,
	post_name					varchar2(100)
	rate_score					number(10)			default 0,
	rate_count					number(10)			default 0,
	sell_count					number(10)			default 0,
	reg_dt        				timestamp      		default sysdate not null, --등록시점
	upt_dt        				timestamp      		default sysdate not null  --수정시점
);

CREATE SEQUENCE sq_ppt_for_sale;
--ppt_for_sale_id, title, content, amount, price, user_id, location_id, category_id, post_id
create table f_ppt_for_sale(
	ppt_for_sale_id				varchar2(1000)		primary key,
	title						varchar2(1000),
	content						varchar2(1000),
	amount						varchar2(1000),
	price						varchar2(1000),
	user_id    	 				varchar2(100)   	references f_party(user_id),
	location_id					varchar2(100)		references f_location(location_id),
	category_id    	 			varchar2(1000)		references f_product_category(product_category_id),
	post_id						varchar2(100)		references f_post(post_id),
	reg_dt        				timestamp      		default sysdate not null, --등록시점
	upt_dt        				timestamp      		default sysdate not null  --수정시점
);