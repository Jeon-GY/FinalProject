drop table f_seller;
drop table f_party;
drop table f_authority;

truncate table f_seller;
truncate table f_party;
truncate table f_authority;

--authority_type, description
create table f_authority(
	authority_type		varchar2(10),
	description			varchar2(100)
);

insert into f_authority(authority_type, description)
	values('admin', '관리자');
insert into f_authority(authority_type, description)
	values('seller', '판매자');
insert into f_authority(authority_type, description)
	values('customer', '일반회원');

--user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, reg_dt, upt_dt, authority
create table f_party(
	user_id 		varchar2(100)	primary key,
	user_pwd 		varchar2(100) 	not null,	--100 : 암호화된 결과물까지 고려함
	user_name 		varchar2(100) 	not null,	--100 : 전지구적인 사람의 이름 길이까지 고려함
	birth_dt 		Date,						--생일 년월일
	sex 			char(1) 		default 1 not null,	--true male, false female
	phone_num		varchar2(30)	not null,
	address			varchar2(1000)	not null,
	reg_dt			timestamp		default sysdate not null,	--등록시점
	upt_dt			timestamp		default sysdate not null,	--수정시점
	authority		varchar2(10)	not null
);

insert into f_party(user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, authority)
	values('admin', '1234', '강명수', '1992-11-10', '1', '010-8824-3282', '안산시 단원구', 'admin');
	
insert into f_party(user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, authority)
	values('seller1', '1234', '류한별', '1993-09-21', '1', '010-4030-7967', '서울시 마포구', 'seller');
insert into f_party(user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, authority)
	values('seller2', '1234', '남궁준', '1993-02-14', '1', '010-3927-8507', '서울시 관악구', 'seller');

insert into f_party(user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, authority)
	values('customer1', '1234', '박소연', '1994-12-12', '0', '010-7750-3221', '서울시 구로구', 'customer');
insert into f_party(user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, authority)
	values('customer2', '1234', '김형준', '1995-02-20', '1', '010-3729-1986', '서울시 관악구', 'customer');
insert into f_party(user_id, user_pwd, user_name, birth_dt, sex, phone_num, address, authority)
	values('customer3', '1234', '전가영', '1998-02-18', '0', '010-5659-9968', '안산시 상록구', 'customer');

--business_reg_num, user_id, business_name, business_phone_num	
create table f_seller (
	business_reg_num		varchar2(30)		primary key,
	user_id					varchar2(100)		references f_party(user_id),
	business_name			varchar2(200)		not null,
	business_phone_num		varchar2(30)
);

insert into f_seller(business_reg_num, user_id, business_name, business_phone_num)
	values('123-45-12345', 'seller1', '원스타', '02-333-3333');
insert into f_seller(business_reg_num, user_id, business_name, business_phone_num)
	values('123-45-54321', 'seller2', '준', '02-444-4444');
	