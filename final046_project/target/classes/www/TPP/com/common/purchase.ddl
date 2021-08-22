drop table f_purchase_detail;
drop table f_purchase;

TRUNCATE TABLE f_purchase_detail;
TRUNCATE TABLE f_purchase;

create sequence sq_purchase_id;
--purchase_id, count, ppt_for_sale_id, user_id
create table f_purchase(
   purchase_id     		varchar2(4000)     	primary key,
   count           		number(10),
   ppt_for_sale_id      varchar2(4000)      references f_ppt_for_sale(ppt_for_sale_id),
   user_id           	varchar2(100)      	references f_party(user_id),
   purchase_dt			timestamp      		default sysdate not null,
   cart 				varchar2(10) 		default '0'
);

create table f_purchase_detail(
   purchase_id     		varchar2(4000)     references f_purchase(purchase_id),
   ppt_for_sale_id      varchar2(1000)      references f_ppt_for_sale(ppt_for_sale_id),
   primary key(purchase_id, ppt_for_sale_id)
);
