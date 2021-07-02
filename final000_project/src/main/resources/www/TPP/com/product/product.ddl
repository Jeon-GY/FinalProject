drop table f_product;

--party_type, description
create table f_product (
	product_id		varchar2(1000)	primary key,
	user_id			varchar2(10)	references f_party(user_id),
	post_id			varchar2(4000)  references f_post(post_id),
	product_name	varchar2(100)	not null,
	product_amount	varchar2(100)	not null
);

insert into f_product(product_id, user_id, post_id, product_name, product_amount)
	values()
