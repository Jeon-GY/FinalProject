drop table f_post_info;
drop table f_post;
drop table f_board;

--board_id, board_name
create table f_board(
   board_id			varchar2(10)    primary key,
   board_name		varchar2(20)
);

insert into f_board (board_id, board_name)
   values ('1', '카테고리');
insert into f_board (board_id, board_name)
   values ('2', '베스트');
insert into f_board (board_id, board_name)
   values ('3', '라이브쇼');
insert into f_board (board_id, board_name)
   values ('4', '마이페이지');
insert into f_board (board_id, board_name)
   values ('5', '관리페이지');
insert into f_board (board_id, board_name)
   values ('6', '상품 관리');


CREATE SEQUENCE sq_post_id;
--post_id, sell_count, rate
create table f_post(
   post_id       varchar2(4000)    	primary key,
   board_id      varchar2(10)  	 	references f_board(board_id),
   seller_id     varchar2(10)   	references f_party(user_id),
   post_title	 varchar2(100) 		not null,
   sell_count    varchar2(1000),
   rate          number(3),
   image		 varchar2(1000),
   reg_dt        timestamp      	default sysdate not null, --등록시점
   upt_dt        timestamp      	default sysdate not null --수정시점
);


insert into f_post(post_id, board_id, seller_id, post_title, sell_count, rate)
   values('00000', '2', 'seller1', '김천 포도', '00005', 444);
insert into f_post(post_id, board_id, seller_id, post_title, sell_count, rate)
   values('00001', '2', 'seller2', '청주 딸기', '00007', 325);
insert into f_post(post_id, board_id, seller_id, post_title, sell_count, rate)
   values('00002', '3', 'seller1', '제주 감귤', '00025', 312);

CREATE SEQUENCE sq_postInfo_id;   
--business_reg_num, user_id, business_name, business_phone_num
create table f_post_info (
   post_info_id      		varchar2(4000)  primary key,
   post_id            		varchar2(4000)  references f_post(post_id),
   user_id            		varchar2(10)    references f_party(user_id),
   post_info_name         	varchar2(10)    not null,
   post_info_content     	varchar2(4000),
   reg_dt           		timestamp      default sysdate not null, --등록시점
   upt_dt           		timestamp      default sysdate not null --수정시점
);

CREATE SEQUENCE sq_reply_id;
create table f_reply(
	reply_id		varchar2(1000)		primary key,
	original_id		varchar2(1000),
	post_info_id	varchar2(4000)		references f_post_info(post_info_id),
	party_id		varchar2(10)		references f_party(user_id)
);







