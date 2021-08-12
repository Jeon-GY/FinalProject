drop table f_location;
truncate table f_location;

CREATE SEQUENCE sq_location_id;
--location_id, location_name
create table f_location(
	location_id		varchar2(100)		primary key,
	location_name	varchar2(100)
);
insert into f_location(location_id, location_name)
   values('11', '서울시');
insert into f_location(location_id, location_name)
   values('11110', '종로구');
insert into f_location(location_id, location_name)
   values('11140', '중구');
insert into f_location(location_id, location_name)
   values('11170', '용산구');
insert into f_location(location_id, location_name)
   values('11200', '성동구');
insert into f_location(location_id, location_name)
   values('11215', '광진구');
insert into f_location(location_id, location_name)
   values('11230', '동대문구');
insert into f_location(location_id, location_name)
   values('11260', '중랑구');
insert into f_location(location_id, location_name)
   values('11290', '성북구');
insert into f_location(location_id, location_name)
   values('11305', '강북구');
insert into f_location(location_id, location_name)
   values('11320', '도봉구');
insert into f_location(location_id, location_name)
   values('11350', '노원구');
insert into f_location(location_id, location_name)
   values('11380', '은평구');
insert into f_location(location_id, location_name)
   values('11410', '서대문구');
insert into f_location(location_id, location_name)
   values('11440', '마포구');
insert into f_location(location_id, location_name)
   values('11470', '양천구');
insert into f_location(location_id, location_name)
   values('11500', '강서구');
insert into f_location(location_id, location_name)
   values('11530', '구로구');
insert into f_location(location_id, location_name)
   values('11545', '금천구');
insert into f_location(location_id, location_name)
   values('11560', '영등포구');
insert into f_location(location_id, location_name)
   values('11590', '동작구');
insert into f_location(location_id, location_name)
   values('11620', '관악구');
insert into f_location(location_id, location_name)
   values('11650', '서초구');
insert into f_location(location_id, location_name)
   values('11680', '강남구');
insert into f_location(location_id, location_name)
   values('11710', '송파구');
insert into f_location(location_id, location_name)
   values('11740', '강동구');

insert into f_location(location_id, location_name)
   values('26', '부산시');
insert into f_location(location_id, location_name)
   values('26110', '중구');
insert into f_location(location_id, location_name)
   values('26140', '서구');
insert into f_location(location_id, location_name)
   values('26170', '동구');
insert into f_location(location_id, location_name)
   values('26200', '영도구');
insert into f_location(location_id, location_name)
   values('26230', '부산진구');
insert into f_location(location_id, location_name)
   values('26260', '동래구');
insert into f_location(location_id, location_name)
   values('26290', '남구');
insert into f_location(location_id, location_name)
   values('26320', '북구');
insert into f_location(location_id, location_name)
   values('26350', '해운대구');
insert into f_location(location_id, location_name)
   values('26380', '사하구');
insert into f_location(location_id, location_name)
   values('26410', '금정구');
insert into f_location(location_id, location_name)
   values('26440', '강서구');
insert into f_location(location_id, location_name)
   values('26470', '연제구');
insert into f_location(location_id, location_name)
   values('26500', '수영구');
insert into f_location(location_id, location_name)
   values('26530', '사상구');
insert into f_location(location_id, location_name)
   values('26710', '기장군');

insert into f_location(location_id, location_name)
   values('27', '대구시');
insert into f_location(location_id, location_name)
   values('27110', '중구');
insert into f_location(location_id, location_name)
   values('27140', '동구');
insert into f_location(location_id, location_name)
   values('27170', '서구');
insert into f_location(location_id, location_name)
   values('27200', '남구');
insert into f_location(location_id, location_name)
   values('27230', '북구');
insert into f_location(location_id, location_name)
   values('27260', '수성구');
insert into f_location(location_id, location_name)
   values('27290', '달서구');
insert into f_location(location_id, location_name)
   values('27710', '달성군');
   
insert into f_location(location_id, location_name)
   values('28', '인천시');
insert into f_location(location_id, location_name)
   values('28110', '중구');
insert into f_location(location_id, location_name)
   values('28140', '동구');
insert into f_location(location_id, location_name)
   values('28170', '남구');
insert into f_location(location_id, location_name)
   values('28185', '연수구');
insert into f_location(location_id, location_name)
   values('28200', '남동구');
insert into f_location(location_id, location_name)
   values('28237', '부평구');
insert into f_location(location_id, location_name)
   values('28245', '계양구');
insert into f_location(location_id, location_name)
   values('28260', '서구');
insert into f_location(location_id, location_name)
   values('28710', '강화군');
insert into f_location(location_id, location_name)
   values('28720', '옹진군');
   
insert into f_location(location_id, location_name)
   values('29', '광주시');
insert into f_location(location_id, location_name)
   values('29110', '동구');
insert into f_location(location_id, location_name)
   values('29140', '서구');
insert into f_location(location_id, location_name)
   values('29155', '남구');
insert into f_location(location_id, location_name)
   values('29170', '북구');
insert into f_location(location_id, location_name)
   values('29200', '광산구');
   
insert into f_location(location_id, location_name)
   values('30', '대전시');
insert into f_location(location_id, location_name)
   values('30110', '동구');
insert into f_location(location_id, location_name)
   values('30140', '중구');
insert into f_location(location_id, location_name)
   values('30170', '서구');
insert into f_location(location_id, location_name)
   values('30200', '유성구');
insert into f_location(location_id, location_name)
   values('30230', '대덕구');
   
insert into f_location(location_id, location_name)
   values('31', '울산시');
insert into f_location(location_id, location_name)
   values('31110', '중구');
insert into f_location(location_id, location_name)
   values('31140', '남구');
insert into f_location(location_id, location_name)
   values('31170', '동구');
insert into f_location(location_id, location_name)
   values('31200', '북구');
insert into f_location(location_id, location_name)
   values('31710', '울주군');
   
insert into f_location(location_id, location_name)
   values('41', '경기도');
insert into f_location(location_id, location_name)
   values('41110', '수원시');
insert into f_location(location_id, location_name)
   values('41130', '성남시');
insert into f_location(location_id, location_name)
   values('41150', '의정부시');
insert into f_location(location_id, location_name)
   values('41170', '안양시');
insert into f_location(location_id, location_name)
   values('41190', '부천시');
insert into f_location(location_id, location_name)
   values('41210', '광명시');
insert into f_location(location_id, location_name)
   values('41220', '평택시');
insert into f_location(location_id, location_name)
   values('41250', '동두천시');
insert into f_location(location_id, location_name)
   values('41270', '안산시');
insert into f_location(location_id, location_name)
   values('41280', '고양시');
insert into f_location(location_id, location_name)
   values('41290', '과천시');
insert into f_location(location_id, location_name)
   values('41310', '구리시');
insert into f_location(location_id, location_name)
   values('41360', '남양주시');
insert into f_location(location_id, location_name)
   values('41370', '오산시');
insert into f_location(location_id, location_name)
   values('41390', '시흥시');
insert into f_location(location_id, location_name)
   values('41410', '군포시');
insert into f_location(location_id, location_name)
   values('41430', '의왕시');
insert into f_location(location_id, location_name)
   values('41450', '하남시');
insert into f_location(location_id, location_name)
   values('41460', '용인시');
insert into f_location(location_id, location_name)
   values('41480', '파주시');
insert into f_location(location_id, location_name)
   values('41500', '이천시');
insert into f_location(location_id, location_name)
   values('41550', '안성시');
insert into f_location(location_id, location_name)
   values('41570', '김포시');
insert into f_location(location_id, location_name)
   values('41590', '화성시');
insert into f_location(location_id, location_name)
   values('41610', '광주시');
insert into f_location(location_id, location_name)
   values('41630', '양주시');
insert into f_location(location_id, location_name)
   values('41650', '포천시');
insert into f_location(location_id, location_name)
   values('41730', '여주군');
insert into f_location(location_id, location_name)
   values('41800', '연천군');
insert into f_location(location_id, location_name)
   values('41820', '가평군');
insert into f_location(location_id, location_name)
   values('41830', '양평군');

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
