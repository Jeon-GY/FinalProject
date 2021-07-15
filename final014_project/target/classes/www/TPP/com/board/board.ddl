drop table f_reply;
drop table f_post_info;
drop table f_post;
drop table f_board;

truncate table f_reply;
truncate table f_post_info;
truncate table f_post;
truncate table f_board;

--board_id, board_name
create table f_board(
   board_id			varchar2(100)    primary key,
   board_name		varchar2(100)
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
   
select sq_post_id.nextval from dual;

CREATE SEQUENCE sq_post_id;
--post_id, sell_count, rate_score, rate_count
create table f_post(
   post_id       varchar2(4000)    	primary key,
   seller_id     varchar2(100)   	references f_party(user_id),
   post_title	 varchar2(1000) 	not null,
   sell_count    number(10)			default 0,
   image		 varchar2(1000),
   rate_score	 number(10)			default 0,
   rate_count	 number(10)			default 0,
   reg_dt        timestamp      	default sysdate not null, --등록시점
   upt_dt        timestamp      	default sysdate not null --수정시점
);

insert into f_post(post_id, seller_id, post_title, sell_count, rate_score, rate_count)
   values('00000', 'seller1', '김천 포도', '00005', 888, 2);
insert into f_post(post_id, seller_id, post_title, sell_count, rate_score, rate_count)
   values('00001', 'seller2', '청주 딸기', '00007', 754, 2);
insert into f_post(post_id, seller_id, post_title, sell_count, rate_score, rate_count)
   values('00002', 'seller1', '제주 감귤', '00025', 999, 3);

   
CREATE SEQUENCE sq_post_info_id;
--business_reg_num, user_id, business_name, business_phone_num
create table f_post_info(
   post_info_id      		varchar2(4000)   primary key,
   post_id            		varchar2(4000)  references f_post(post_id),
   user_id            		varchar2(100)   references f_party(user_id),
   post_info_content     	varchar2(4000),
   reg_dt           		timestamp      default sysdate not null, --등록시점
   upt_dt           		timestamp      default sysdate not null --수정시점
);
insert into f_post_info(post_info_id, post_id, user_id, post_info_content)
   values('00001', '00001', 'seller2', '상품 정보 입니다.');

CREATE SEQUENCE sq_reply;
--reply_id, original_id, post_info_id, party_id
create table f_reply(
	reply_id		varchar2(1000)		primary key,
	post_info_id	varchar2(4000)		references f_post_info(post_info_id),
	user_id			varchar2(100)		references f_party(user_id),
	content			varchar2(4000),
	reg_dt          timestamp      default sysdate not null, --등록시점
    upt_dt          timestamp      default sysdate not null --수정시점

);