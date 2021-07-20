drop table f_product;
drop table f_location;

truncate table f_product;
truncate table f_location;

create table f_product_category(
	product_category_id			varchar2(1000)		primary key,
	product_category_name		varchar2(1000)
);

insert into f_product_category(product_category_id, product_category_name)
   values('11000', '곡물류');
insert into f_product_category(product_category_id, product_category_name)
   values('22000', '과일류');
insert into f_product_category(product_category_id, product_category_name)
   values('33000', '채소류');
insert into f_product_category(product_category_id, product_category_name)
   values('44000', '화초류');
insert into f_product_category(product_category_id, product_category_name)
   values('55000', '육류');
insert into f_product_category(product_category_id, product_category_name)
   values('66000', '어패류');
insert into f_product_category(product_category_id, product_category_name)
   values('77000', '광물류');
insert into f_product_category(product_category_id, product_category_name)
   values('88000', '공예품류');

create table f_ppt(
	location_id    	 	varchar2(1000)   	references f_location(location_id),
	category_id    	 	varchar2(1000)   	references f_product_category(product_category_id),
	primary key(location_id, category_id)
);