drop table f_product;
drop table f_location;

truncate table f_product;
truncate table f_location;

CREATE SEQUENCE sq_location_id;
--location_id, location_name
create table f_location(
	location_id		varchar2(100)		primary key,
	location_name	varchar2(100)
);

CREATE SEQUENCE sq_product_id;
--product_id, user_id, post_id, product_name, product_amount
create table f_product(
	product_id		varchar2(1000)		primary key,
	user_id    	 	varchar2(100)   	references f_party(user_id),
	post_id         varchar2(4000)  	references f_post(post_id),
	location_id		varchar2(100)		references f_location(location_id),
	product_name    varchar2(100)		not null,
    product_amount  varchar2(100),
    product_price	number(10)			not null,
    product_count	number(10)			default 0
);
insert into f_product(product_id, user_id, post_id, product_name, product_amount, product_price, product_count)
   values('00000', 'seller2', '00001', '딸기', '200g', 6000, 3)