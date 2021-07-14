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

insert into f_location(location_id, location_name)
   values('46', '전남도');
insert into f_location(location_id, location_name)
   values('46110', '목포시');
insert into f_location(location_id, location_name)
   values('46130', '여수시');
insert into f_location(location_id, location_name)
   values('46150', '순천시');
insert into f_location(location_id, location_name)
   values('46170', '나주시');
insert into f_location(location_id, location_name)
   values('46230', '광양시');
insert into f_location(location_id, location_name)
   values('46710', '담양군');
insert into f_location(location_id, location_name)
   values('46720', '곡성군');
insert into f_location(location_id, location_name)
   values('46730', '구례군');
insert into f_location(location_id, location_name)
   values('46770', '고흥군');
insert into f_location(location_id, location_name)
   values('46780', '보성군');
insert into f_location(location_id, location_name)
   values('46790', '화순군');
insert into f_location(location_id, location_name)
   values('46800', '장흥군');
insert into f_location(location_id, location_name)
   values('46810', '강진군');
insert into f_location(location_id, location_name)
   values('46820', '해남군');
insert into f_location(location_id, location_name)
   values('46830', '영암군');
insert into f_location(location_id, location_name)
   values('46840', '무안군');
insert into f_location(location_id, location_name)
   values('46860', '함평군');
insert into f_location(location_id, location_name)
   values('46870', '영광군');
insert into f_location(location_id, location_name)
   values('46880', '장성군');
insert into f_location(location_id, location_name)
   values('46890', '완료도군');
insert into f_location(location_id, location_name)
   values('46900', '진도군');
insert into f_location(location_id, location_name)
   values('46910', '신안군');
insert into f_location(location_id, location_name)
   values('47', '경북도');
insert into f_location(location_id, location_name)
   values('47110', '포항시');
insert into f_location(location_id, location_name)
   values('47130 ', '경주시');
insert into f_location(location_id, location_name)
   values('47150 ', '김천시');
insert into f_location(location_id, location_name)
   values('47170', '안동시');
insert into f_location(location_id, location_name)
   values('47190', '구미시');
insert into f_location(location_id, location_name)
   values('47210', '영주시');
insert into f_location(location_id, location_name)
   values('47230', '영천시');
insert into f_location(location_id, location_name)
   values('47250', '상주시');
insert into f_location(location_id, location_name)
   values('47280', '문경시');
insert into f_location(location_id, location_name)
   values('47290', '경산시');
insert into f_location(location_id, location_name)
   values('47720', '군위군');
insert into f_location(location_id, location_name)
   values('47730', '의성군');
insert into f_location(location_id, location_name)
   values('47750', '청송군');
insert into f_location(location_id, location_name)
   values('47760', '영양군');
insert into f_location(location_id, location_name)
   values('47770', '영덕군');
insert into f_location(location_id, location_name)
   values('47820', '청도군');
insert into f_location(location_id, location_name)
   values('47830', '고령군');
insert into f_location(location_id, location_name)
   values('47840', '성주군');
insert into f_location(location_id, location_name)
   values('47850', '칠곡군');
insert into f_location(location_id, location_name)
   values('47900', '예천군');
insert into f_location(location_id, location_name)
   values('47920', '봉화군');
insert into f_location(location_id, location_name)
   values('47930', '울진군');
insert into f_location(location_id, location_name)
   values('47940', '울릉군');
insert into f_location(location_id, location_name)
   values('48', '경남도');
insert into f_location(location_id, location_name)
   values('48120', '창원시');
insert into f_location(location_id, location_name)
   values('48170', '진주시');
insert into f_location(location_id, location_name)
   values('48220 ', '통영시');
insert into f_location(location_id, location_name)
   values('48240', '사천시');
insert into f_location(location_id, location_name)
   values('48250', '김해시');
insert into f_location(location_id, location_name)
   values('48270', '밀양시');
insert into f_location(location_id, location_name)
   values('48310', '거제시');
insert into f_location(location_id, location_name)
   values('48330', '양산시');
insert into f_location(location_id, location_name)
   values('48720', '의령군');
insert into f_location(location_id, location_name)
   values('48730', '함안군');
insert into f_location(location_id, location_name)
   values('48740', '창녕군');
insert into f_location(location_id, location_name)
   values('48820', '고성군');
insert into f_location(location_id, location_name)
   values('48840', '남해군');
insert into f_location(location_id, location_name)
   values('48850', '하동군');
insert into f_location(location_id, location_name)
   values('48860', '산청군');
insert into f_location(location_id, location_name)
   values('48870', '함양군');
insert into f_location(location_id, location_name)
   values('48880', '거창군');
insert into f_location(location_id, location_name)
   values('48890', '합천군');
insert into f_location(location_id, location_name)
   values('50', '제주도');
insert into f_location(location_id, location_name)
   values('50110', '제주시');
insert into f_location(location_id, location_name)
   values('50130', '서귀포시');
insert into f_location(location_id, location_name)
   values('42', '강원도');
insert into f_location(location_id, location_name)
   values('42110', '춘천시');
insert into f_location(location_id, location_name)
   values('42130', '원주시');
insert into f_location(location_id, location_name)
   values('42150', '강릉시');
insert into f_location(location_id, location_name)
   values('42170', '동해시');
insert into f_location(location_id, location_name)
   values('42190', '태백시');
insert into f_location(location_id, location_name)
   values('42210', '속초시');
insert into f_location(location_id, location_name)
   values('42230', '삼척시');
insert into f_location(location_id, location_name)
   values('42720', '홍천군');
insert into f_location(location_id, location_name)
   values('42730', '횡성군');
insert into f_location(location_id, location_name)
   values('42750', '영월군');
insert into f_location(location_id, location_name)
   values('42760', '평창군');
insert into f_location(location_id, location_name)
   values('42770', '정선군');
insert into f_location(location_id, location_name)
   values('42780', '철원군');
insert into f_location(location_id, location_name)
   values('42790', '화천군');
insert into f_location(location_id, location_name)
   values('42800', '양구군');
insert into f_location(location_id, location_name)
   values('42810', '인제군');
insert into f_location(location_id, location_name)
   values('42820', '고성군');
insert into f_location(location_id, location_name)
   values('42830', '양양군');
insert into f_location(location_id, location_name)
   values('43', '충북도');
insert into f_location(location_id, location_name)
   values('43110', '청주시');
insert into f_location(location_id, location_name)
   values('43130', '충주시');
insert into f_location(location_id, location_name)
   values('43150', '제천시');
insert into f_location(location_id, location_name)
   values('43710', '청원군');
insert into f_location(location_id, location_name)
   values('43720', '보은군');
insert into f_location(location_id, location_name)
   values('43730', '옥천군');
insert into f_location(location_id, location_name)
   values('43740', '영동군');
insert into f_location(location_id, location_name)
   values('43745', '증평군');
insert into f_location(location_id, location_name)
   values('43750', '진천군');
insert into f_location(location_id, location_name)
   values('43760', '괴산군');
insert into f_location(location_id, location_name)
   values('43770', '음성군');
insert into f_location(location_id, location_name)
   values('43800', '단양군');
insert into f_location(location_id, location_name)
   values('44', '충남도');
insert into f_location(location_id, location_name)
   values('44130', '천안시');
insert into f_location(location_id, location_name)
   values('44150', '공주시');
insert into f_location(location_id, location_name)
   values('44180', '보령시');
insert into f_location(location_id, location_name)
   values('44200', '아산시');
insert into f_location(location_id, location_name)
   values('44210', '서산시');
insert into f_location(location_id, location_name)
   values('44230', '논산시');
insert into f_location(location_id, location_name)
   values('44250', '계룡시');
insert into f_location(location_id, location_name)
   values('44710', '금산군');
insert into f_location(location_id, location_name)
   values('44730', '연기군');
insert into f_location(location_id, location_name)
   values('44760', '부여군');
insert into f_location(location_id, location_name)
   values('44770', '서천군');
insert into f_location(location_id, location_name)
   values('44790', '청양군');
insert into f_location(location_id, location_name)
   values('44800', '홍성군');
insert into f_location(location_id, location_name)
   values('44810', '예산군');
insert into f_location(location_id, location_name)
   values('44825', '태안군');
insert into f_location(location_id, location_name)
   values('44830', '당진군');
insert into f_location(location_id, location_name)
   values('45', '전북도');
insert into f_location(location_id, location_name)
   values('45110', '전주시');
insert into f_location(location_id, location_name)
   values('45130', '군산시');
insert into f_location(location_id, location_name)
   values('45140', '익산시');
insert into f_location(location_id, location_name)
   values('45180', '정읍시');
insert into f_location(location_id, location_name)
   values('45190', '남원시');
insert into f_location(location_id, location_name)
   values('45210', '김제시');
insert into f_location(location_id, location_name)
   values('45710', '완주군');
insert into f_location(location_id, location_name)
   values('45720', '진안군');
insert into f_location(location_id, location_name)
   values('45730', '무주군');
insert into f_location(location_id, location_name)
   values('45740', '장수군');
insert into f_location(location_id, location_name)
   values('45750', '임실군');
insert into f_location(location_id, location_name)
   values('45770', '순창군');
insert into f_location(location_id, location_name)
   values('45790', '고창군');
insert into f_location(location_id, location_name)
   values('45800', '부안군');

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
   
