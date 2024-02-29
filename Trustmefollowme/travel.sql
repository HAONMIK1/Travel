-- 게시판
drop sequence boardseq;
create sequence boardseq 
start with 1
increment by 1
nocache;

drop table board;
CREATE TABLE board (
	num	number	NOT NULL,
  writer varchar2(50) NOT NULL,
	title	varchar2(500)	NOT NULL,
	reg_date	date	NOT NULL,
	readcount	number default 0,
	content	varchar2(3000)	NOT NULL,
	ip	varchar2(20)	NOT NULL,
	image	varchar2(100) default 'board.jpg',
  mEmail varchar2(30),
  jnum varchar2(500),
  minDate varchar2(100),
  maxDate varchar2(100),
  likes number default 0
);


-- 게시판 좋아요
drop sequence likeseq;
create sequence likeseq;
drop table likes;
create table likes(
num number primary key,
b_num varchar2(50),
m_num varchar2(50),
likes number
);
commit;


-- 게시판 댓글
drop sequence chatseq;
create sequence chatseq;

drop table chat;
create table chat(
chatnum number primary key,
b_num varchar2(50),
writer varchar2(50),
content varchar2(2000),
ref number,
re_level number,
re_step number,
ip varchar2(20) not null,
reg_date date not null
);

drop table spot;
CREATE TABLE spot (
	snum	number	NOT NULL primary key,
	name	varchar2(300)	NULL,
	xpos	varchar2(300)	NULL,
	ypos	varchar2(300)	NULL,
	address	varchar2(300)	NULL,
	content	varchar2(300)	NULL,
	image	varchar2(300)	NULL,
	image2	varchar2(300)	NULL,
	image3	varchar2(300)	NULL,
    image4	varchar2(300)	NULL,
	image5	varchar2(300)	NULL,
  stime varchar2(300)	NULL
);
drop sequence spot_seq;
create sequence spot_seq
   increment by 1
   start with 1
   minvalue 1
   maxvalue 10000;



--카페 번호 시퀀스
drop sequence cafeseq;
create sequence cafeseq
  increment by 1
  start with 1
  nocache;

--카페 정보
drop TABLE cafe;
CREATE TABLE cafe (
    cnum int primary key,               -- 카페 번호 
    name varchar2(255) NOT NULL,      -- 카페 이름 
    xpos varchar2(255),               -- 카페 위도 
    ypos varchar2(255),               -- 카페 경도
    address varchar2(255),             -- 카페 주소 
    ctel1 varchar2(15),                  -- 카페 전화 시작 번호 
    ctel2 varchar2(15),                  -- 카페 전화 중간 번호 
    ctel3 varchar2(15),                  -- 카페 전화 끝 번호   
    c_date varchar2(30),               -- 카페 개업 일자
    ctime1 varchar2(20),               -- 카페 개업 시작 시간
    ctime2 varchar2(20),               -- 카페 개업 종료 시간
    image varchar2(30),             -- 카페 사진(메인 사진)
    image2 varchar2(30),            -- 카페 사진2
    image3 varchar2(30),            -- 카페 사진3
    image4 varchar2(30),            -- 카페 사진4
    image5 varchar2(30)             -- 카페 사진5
);

drop sequence resseq;
create sequence resseq 
start with 1
increment by 1
nocache;

drop table rest;
create table rest (
   rnum number primary key,   -- 음식점 고유번호
   name varchar2(30) not null,   -- 음식점 이름
   xpos varchar2(255) not null,   -- 위도
   ypos varchar2(255) not null,   -- 경도
   address varchar2(255) not null,-- 장소(경기도 00시)
   image varchar2(30),      -- 메인 이미지
   image2 varchar2(30),      -- 상품 이미지
   image3 varchar2(30),      -- 상품 이미지
   image4 varchar2(30),      -- 상품 이미지
   image5 varchar2(30),      -- 상품 이미지
   rtel1 varchar2(255) not null,   -- 연락처 시작
   rtel2 varchar2(255) not null,   -- 연락처 중간
   rtel3 varchar2(255) not null,   -- 연락처 끝
   rtime1 varchar2(255) not null,   -- 영업 시작 시간
   rtime2 varchar2(255) not null,   -- 영업 종료 시간
   rdate varchar2(255) not null   -- 음식점 개업일자
);

drop table hotel;
create table hotel(
   hnum number   not null,--호텔 고유번호
   name varchar2(500) not null, --호텔이름
   hprice varchar2(500) not null,--호텔가격
   image varchar2(500)   not null,--호텔이미지1
   image2 varchar2(500) not null,--룸이미지2
   image3 varchar2(500) not null,--룸이미지3
   image4 varchar2(500) not null,--룸이미지4
   image5 varchar2(500) not null,--룸이미지5
   image6 varchar2(500) not null,--부대시설이미지6
   address varchar2(500) not null,--호텔주소
   htel varchar2(50) not null,--전화번호
   facility varchar2(500) not null,--부대시설
   hcontent varchar2(500) not null,--호텔 상세내용
   rname1 varchar2(500)   not null,--룸이름1
   rname2 varchar2(500)   not null,--룸이름2
   rname3 varchar2(500)   not null,--룸이름3
   rname4 varchar2(500)   not null,--룸이름4
   rprice1   varchar2(500) not null,--룸1가격
   rprice2   varchar2(500) not null,--룸2가격
   rprice3   varchar2(500) not null,--룸3가격
   rprice4   varchar2(500) not null,--룸4가격
   xpos varchar2(500) not null,--호텔위도
   ypos varchar2(100) not null--호텔경도
);

drop sequence hotel_seq;
create sequence hotel_seq
   increment by 1
   start with 1
   minvalue 1
   maxvalue 10000;

drop table member;
create table member(
num varchar2(50) not null,
email varchar2(100) not null,
password varchar2(50) not null,
name varchar2(50) not null,
birth varchar2(100) not null,
address1 varchar2(100) not null,
address2 varchar2(100),
mtel varchar2(50) not null,
myjNum number default 0 --해당 아이디의 고유 여정번호
);

insert into member(num,email,password,name ,birth ,address1, address2, mtel)
values(member_seq.nextval,'admin@gamil.com','admin1234','어드민','1996-12-24','서울 강서구 월정로 20길 13','늘예솔하우스 1202호','010-1234-5678');
commit;

drop sequence member_seq;
create sequence member_seq
   increment by 1
   start with 1
   minvalue 1
   maxvalue 10000;

select * from member;

DROP TABLE myjourney;
CREATE TABLE myjourney (
	jnum	number	NOT NULL ,
	id	    varchar2(300)	NULL,
    num     varchar2(300),
	xpos	varchar2(300)	NULL,
	ypos	varchar2(300)	NULL,
	cate	varchar2(300)	NULL,
	ref	    number	NULL,
	turn	varchar2(300)	NULL,
	jdate	varchar2(300)	NULL
 
);
drop sequence myj_seq;
create sequence myj_seq
   increment by 1
   start with 1
   minvalue 1
   maxvalue 10000;

SELECT * FROM board
ORDER BY DBMS_RANDOM.VALUE;
select * from board;
select *from member ;

select * from likes;
select * from rest;
select * from cafe;
select * from hotel;
select * from myjourney ;
select * from spot;

commit;


SELECT
    m.jnum, m.id, m.xpos, m.ypos, m.cate, m.ref, m.turn, m.jdate,
    COALESCE(s.name, r.name, h.name, c.name) AS name,
    COALESCE(s.address, r.address, h.address, c.address) AS address,
    COALESCE(s.image, r.image, h.image, c.image) AS image,
    COALESCE(s.image2, r.image2, h.image2, c.image2) AS image2,
    COALESCE(s.image3, r.image3, h.image3, c.image3) AS image3,
    COALESCE(s.image4, r.image4, h.image4, c.image4) AS image4,
    COALESCE(s.image5, r.image5, h.image5, c.image5) AS image5
	FROM
    myjourney m
	LEFT JOIN spot s ON m.ref = s.snum AND m.cate = 'spot'
	LEFT JOIN rest r ON m.ref = r.rnum AND m.cate = 'restaurant'
	LEFT JOIN hotel h ON m.ref = h.hnum AND m.cate = 'hotel'
	LEFT JOIN cafe c ON m.ref = c.cnum AND m.cate = 'cafe'
	WHERE
    m.id = 'noa@noa' and m.jdate = '2023-12-29' and jnum= 1
   order by m.turn ;


select * from myjourney WHERE id = 'noa2006@naver.com' and jnum =3 order by jdate ,turn ;

SELECT DISTINCT jdate FROM myjourney WHERE id = 'noa2006@naver.com' and jnum= 1 order by jdate ;
	

select m.jnum,m.id,m.xpos,m.ypos,m.cate,m.ref,m.turn,m.jdate,c.name,c.address,c.image,c.image2,c.image3,c.image3,c.image4,c.image5
from myjourney	m right join spot c on m.ref = c.snum where m.id = 'admin' and m.cate ='spot' ;
	
commit;

	SELECT
    m.jnum, m.id, m.xpos, m.ypos, m.cate, m.ref, m.turn, m.jdate,
    COALESCE(s.name, r.name, h.name, c.name) AS name,
    COALESCE(s.address, r.address, h.address, c.address) AS address,
    COALESCE(s.image, r.image, h.image, c.image) AS image,
    COALESCE(s.image2, r.image2, h.image2, c.image2) AS image2,
    COALESCE(s.image3, r.image3, h.image3, c.image3) AS image3,
    COALESCE(s.image4, r.image4, h.image4, c.image4) AS image4,
    COALESCE(s.image5, r.image5, h.image5, c.image5) AS image5
FROM
    myjourney m
LEFT JOIN spot s ON m.ref = s.snum AND m.cate = 'spot'
LEFT JOIN rest r ON m.ref = r.rnum AND m.cate = 'restaurant'
LEFT JOIN hotel h ON m.ref = h.hnum AND m.cate = 'hotel'
LEFT JOIN cafe c ON m.ref = c.cnum AND m.cate = 'cafe'
WHERE
     m.id = 'noa2006@naver.com'
   order by m.jdate ,m.turn ;

SELECT DISTINCT jdate FROM myjourney WHERE id = 'noa2006@naver.com' order by jdate; 

Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (5,'용두암해안도로','33.5158700504','126.5120821042','제주특별자치도 제주시 서해안로 687-8','바다를 비추는 조명이 설치되어 있어 밤낮으로 산책을 즐기기에도 좋은 환경을 갖추고 있습니다.','road1.jpeg','road2.jpeg','road3.jpeg','road2.jpeg','road1.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (6,'용연구름다리','33.5149090722','126.5137903112','제주특별자치도 제주시 흥운길 69',null,'spot1.jpeg','spot2.jpeg','spot3.jpeg','spot2.jpeg','spot1.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (7,'만장굴','33.536500525644','126.77281988401',' 제주특별자치도 제주시 구좌읍 만장굴길 182',null,'cave1.jpeg','cave2.jpeg','cave3.jpeg',null,null);
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (26,'9.81 파크','33.389780','126.366461','제주특별자치도 제주시 애월읍 천덕로 880-24','세계 최초 스마트 레이싱 테마파크 ‘9.81파크’는 미래에 온 듯한 감각적인 실내 공간과 다양한 액티비티 그리고 신나는 레이싱과 함께 제주 자연을 온전히 경험할 수 있는 곳으로 애월 바다와 한라산 사이에 위치하고 있다. ','9.81p0.jpeg','9.81p1.jpeg','9.81p2.jpeg','9.81p3.jpeg','9.81p4.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (27,'산굼부리','33.431593','126.690018','대한민국 제주특별자치도 제주시 조천읍 비자림로 768','거대한 분화구까지 이어지는 긴 산책로를 따라 아름답고 고즈넉한 풍경이 펼쳐집니다.','sangum1.jpeg','sangum2.jpeg','sangum4.jpeg','sangum5.jpeg','sangum3.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (28,'세화해변','33.525394','126.860180','제주특별자치도 제주시 구좌읍 세화길','제주올레 20코스를 걷다 보면 세화민속오일장과 해녀박물관 사이에 작은 해변 하나를 만날 수 있다. 구좌읍 세화리에 위치한 이 해변은 정식 해수욕장도 아니고 규모도 크지 않지만, 눈이 시리게 맑고 파란 바다를 선물해준다.','sewha0.jpeg','sewha1.jpeg','sewha2.jpeg','sewha3.jpeg','sewha4.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (30,'용머리해안','33.231949','126.314639','제주특별자치도 서귀포시 안덕면 산방로 218-10','산방산 앞자락에 있는 바닷가로 산방산 휴게소에서 10여분 걸어내려가면 수려한 해안절경의 용머리 해안과 마주치게 된다.','yungmu1.jpeg','yungmu2.jpeg','yungmu3.jpeg','yungmu4.jpeg','yungmu5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (31,'비자림','33.484152','126.806472','대한민국 제주특별자치도 제주시 구좌읍 비자숲길 55','500~800년된 비자나무 수천 그루가 자생하는 천연기념물입니다.','bija1.jpeg','bija0.jpeg','bija2.jpeg','bija3.jpeg','bija4.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (32,'휴애리 자연생활공원','33.308686','126.633805','제주특별자치도 서귀포시 남원읍 신례동로 256','수많은 꽃들과 한라산 풍경이 더해져 더욱 아름다움을 자랑하는 꽃 정원이다. 연중무휴이며, 매년 수차례 꽃 축제(유채, 매화, 수국, 핑크뮬리, 동백)를 진행하고 있다','huae2.bmp','huae1.jpeg','huae3.bmp','huae4.bmp','huae5.bmp');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (33,'녹차동굴','33.381479','126.787077','제주에서 유명한 천연 용암 동굴 포토존이다. 동굴 안쪽에서 동굴 입구를 바라보며 찍는 사진은 미묘하고 신비로운 느낌을 준다.','제주특별자치도 서귀포시 중산간동로 4772','nok1.jpeg','nok2.jpeg','nok3.jpeg','nok4.jpeg','nok5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (34,'일출랜드','33.382195','126.842141','제주특별자치도 서귀포시 성산읍 중산간동로 4150-30','반려동물 동반 가능한 제주 식물원 테마파크','illchu0.png','illchu1.png','illchu3.png','illchu2.png','illchu4.png');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (22,'용두암','33.516160','126.512057','제주특별자치도 제주시 용담2동 용두암길 15','해안에 위치한 용 머리 모양의 화산암 형성물이 있는 인기 명소입니다.','yungdo1.jpeg','yungdo2.jpeg','yungdo3.jpeg','yungdo4.jpeg','yungdo5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (23,'신창풍차해안','33.343340','126.174012','제주특별자치도 제주시 한경면 신창리 1323','구불구불 해안선을 따라 보이는 하얀 풍차와 에메랄드빛 바다는 우리에게 상쾌한 가을 풍경을 보여준다. ','sincha0.jpeg','sincha1.jpeg','sincha2.jpeg','sincha4.jpeg','sincha3.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (24,'보롬왓','33.413417','126.752801','제주특별자치도 서귀포시 번영로 2350-104','서귀포 표선면에 위치한 농장으로, 바람이 부는 밭이라는 뜻의 제주 방언이다. 밭이라는 명칭이 있는 만큼 청보리, 메밀 등 밭작물을 만날 수 있으며, 튤립, 유채꽃, 수국, 라벤더 등 아름다운 꽃들도 만나볼 수 있다.','borim3.jpeg','borim0.jpeg','borim1.jpeg','borim2.jpeg','borim4.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (5,'용두암해안도로','33.5158700504','126.5120821042','제주특별자치도 제주시 서해안로 687-8','바다를 비추는 조명이 설치되어 있어 밤낮으로 산책을 즐기기에도 좋은 환경을 갖추고 있습니다.','road1.jpeg','road2.jpeg','road3.jpeg','road2.jpeg','road1.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (6,'용연구름다리','33.5149090722','126.5137903112','제주특별자치도 제주시 흥운길 69',null,'spot1.jpeg','spot2.jpeg','spot3.jpeg','spot2.jpeg','spot1.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (7,'만장굴','33.536500525644','126.77281988401',' 제주특별자치도 제주시 구좌읍 만장굴길 182',null,'cave1.jpeg','cave2.jpeg','cave3.jpeg',null,null);
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (10,'섭지코지','33.424191','126.931154','제주특별자치도 서귀포시 성산읍 섭지코지로','등대, 레스토랑, 상점, 경치 좋은 전망, 산책로를 갖추고 있는 조용한 해변 지역입니다.','subji1.jpeg','subji2.jpeg','subji3.jpeg','subji4.jpeg','subji5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (8,'성산 일출봉','33.458053','126.941774','대한민국 서귀포시 성산 일출봉','화산 분화로 형성된 이 독특한 분화구 형태의 봉우리는 고대의 성과 비슷하다고 합니다.','sungsan4.jpeg','sungsan1.jpeg','sungsan5.jpeg','sungsan3.jpeg',null);
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (9,'제주동문시장','33.513308','126.528280','제주특별자치도 제주시 특별자치도, 동문시장','싱싱한 농수산물, 의류, 잡화 등을 판매하는 역사가 오래된 실내 시장입니다.','dongmon1.png','dongmon2.jpeg','dongmon3.jpeg','dongmon4.jpeg','dongmon5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (11,'협재해변','33.393919','126.240425','대한민국 제주특별자치도 제주시 한림읍 한림로 329-10','조용한 분위기의 백사장으로 맑은 청록색 바닷물과 비양도 전망이 유명합니다.','hunje1.jpeg','hubje2.jpeg','hunje3.jpeg','hubje4.jpeg','hubje5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (12,'제주오설록 티뮤지엄','33.305732','126.289684','제주특별자치도 서귀포시 안덕면 신화역사로 15','녹차 전시관, 녹차 밭을 볼 수 있는 전망대, 인기 있는 기념품 가게, 카페가 있습니다.','ohsul1.jpeg','ohsul2.jpeg','ohsul3.jpeg','ohsul4.jpeg','ohsul5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (13,'새별오름','33.365369','126.256657','대한민국 제주시 새별오름','풍경이 아름다우며 매년 오름에 불을 피우는 들불 축제로 유명한 화산성 산맥입니다.','sebuk1.jpeg','sebuk2.jpeg','sebuk3.jpeg','sebuk4.jpeg','sebuk5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (14,'도두 무지개 해안도로','33.509252','126.472057','제주특별자치도 제주시 도두일동','파란 제주 하늘과 그 아래로 끝없이 펼쳐진 수평선을 마주할 수 있는 용담이호해안도로. 제주공항과 가까운 곳에 있어 여행 전후로 가볍게 드라이브를 즐길 수 있는 곳이다','dudo1.jpeg','dudo2.jpeg','dudo3.jpeg','dudo5.jpeg','dudo4.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (15,'쇠소깍','33.252215','126.623346','제주특별자치도 서귀포시 쇠소깍로 138','화산석 절벽에 둘러싸인 아름다운 하구로 카약과 전통 뗏목 타기가 유명합니다.','seso1.jpeg','seso2.jpeg','seso3.jpeg','seso4.jpeg','seso5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (16,'카멜리아 힐','33.289751','126.368116','대한민국 제주특별자치도 서귀포시 안덕면 병악로 166','1979년에 개장한 200,000m² 규모의 수목원으로 수많은 동백과 다양한 식물 종을 볼 수 있으며 연중무휴입니다.','camel1.jpeg','camel2.jpeg','camel3.jpeg','camel4.jpeg','camel5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (17,'천제연폭포','33.252186','126.418423','대한민국 제주특별자치도 서귀포시 중문동 2232','동굴에서 쏟아지는 물이 3단계의 폭포를 이루고 녹지로 둘러싸여 있습니다.','chunje1.jpeg','chunje2.jpeg','chunje3.jpeg','chunje4.jpeg','chunje5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (18,'서귀포 매일올레시장','33.248618','126.564149','제주특별자치도 서귀포시 특별자치도 중앙로62번길 18','1960년대에 설립된 실내 시장으로 농수산물, 가정용품 등을 판매하는 가판대가 많이 있습니다.','allle1.jpeg','allle3.jpeg','allle2.jpeg','allle4.jpeg',null);
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (19,'한담해변','33.461999','126.310584','	제주특별자치도 제주시 애월읍 애월로1길 26-4','주 북서부에 위치하여 애월에서 곽지까지 해안을 따라 이어진다. 제주시가 2009년 숨은 비경 31로 선정했으며, 맑고 투명한 바다로 유명하다','handam1.jpeg','handam2.jpeg','handam4.jpeg','handam3.jpeg','handam5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (20,'김녕해수욕장','33.558104','126.759499','제주특별자치도 제주시 구좌읍 구좌해안로 237','거대한 너럭바위 용암 위에 모래가 쌓여 만들어졌으며, 성세기는 외세의 침략을 막기 위한 작은 성이라는 뜻이 담겨 있다.','kimne1.jpeg','kimne2.jpeg','kimne3.jpeg','kimne4.jpeg','kimne5.jpeg');
Insert into SPOT (SNUM,NAME,XPOS,YPOS,ADDRESS,CONTENT,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) values (21,'사려니숲길 - 비자림로 입출구','33.394689','126.684529','제주특별자치도 서귀포시 특별자치도, 표선면 가시리 산 158-4','삼나무 숲속으로 고즈넉한 길이 나 있으며 조용히 산책을 즐기고 야생동물을 보고 사진을 찍을 수 있습니다','sare1.jpeg','sare2.jpeg','sare3.jpeg','sare4.jpeg','sare5.jpeg');

-- 음식점
drop sequence resseq;
create sequence resseq 
start with 1
increment by 1
nocache;

drop table rest;
create table rest (
	rnum number primary key,	-- 음식점 고유번호
	name varchar2(30) not null,	-- 음식점 이름
	xpos varchar2(255) not null,	-- 위도
	ypos varchar2(255) not null,	-- 경도
	address varchar2(255) not null, -- 장소(경기도 00시)
	image varchar2(50),		-- 상품 이미지
	image2 varchar2(50),		-- 상품 이미지
	image3 varchar2(50),		-- 상품 이미지
	image4 varchar2(50),		-- 상품 이미지
	image5 varchar2(50),		-- 상품 이미지
	rtel1 varchar2(255) not null,	-- 연락처 시작
	rtel2 varchar2(255) not null,	-- 연락처 중간
	rtel3 varchar2(255) not null,	-- 연락처 끝
	rtime1 varchar2(255) not null,	-- 영업 시작 시간
	rtime2 varchar2(255) not null,	-- 영업 종료 시간
	rdate varchar2(255) not null	-- 음식점 개업일자
);


insert into rest values(resseq.nextval,'수희식당','33.2454605','126.5613681','제주 서귀포시 태평로 377','suhee.jpg','suhee2.jpg','suhee3.jpg','suhee4.jpg','suhee5.jpg','064','762','0777','08:00','21:00','2003-03-01');
insert into rest values(resseq.nextval,'솔지식당','33.4922831','126.4726527','제주 제주시 월랑로 88','solji.jpg','solji2.jpg','solji3.jpg','solji4.jpg','solji5.jpg','0507','1315','0349','12:00','21:40','2005-06-27');
insert into rest values(resseq.nextval,'착한집','33.4999552','126.5070561','제주 제주시 서광로 98','kind.jpg','kind2.jpg','kind3.jpg','kind4.jpg','kind5.jpg','064','713','7136','11:00','21:00','2018-05-22');
insert into rest values(resseq.nextval,'제주오누이','33.4999552','126.5070561','제주특별자치도 제주시 구좌읍 해맞이해안로 972','onui.jpg','onui2.jpg','onui3.jpg','onui4.jpg','onui5.jpg','02','336','8546','09:00','18:30','2012-05-25');
insert into rest values(resseq.nextval,'제주오성','33.2556752','126.4146427','제주특별자치도 색달동 중문관광로 27','oseong.jpg','oseong2.jpg','oseong3.jpg','oseong4.jpg','oseong5.jpg','02','336','8546','09:00','18:30','1985-01-01');

insert into rest values(resseq.nextval,'나목도 식당','33.3534854','126.7718273','제주 서귀포시 특별자치도 표선면 가시리 1879-4','namokdo.jpg','namokdo2.jpg','namokdo3.jpg','namokdo4.jpg','namokdo5.jpg','064','787','1202','09:00','20:00','1987-01-01');
insert into rest values(resseq.nextval,'별돈별 정원본점','33.3086406','126.1802146','제주특별자치도 제주시 한경면 고산로8길 21-15','star.jpg','star2.jpg','star3.jpg','star4.jpg','star5.jpg','0507','1371','5895','12:00','22:00','2017-05-20');
insert into rest values(resseq.nextval,'해녀의집','33.4784355','126.3669405','제주특별자치도 제주시 애월읍 애월해안로 591','haenyeo.jpg','haenyeo2.jpg','haenyeo3.jpg','haenyeo4.jpg','haenyeo5.jpg','064','713','9366','10:00','20:00','2013-11-11');
insert into rest values(resseq.nextval,'자매국수','33.4985643','126.4587880','제주 제주시 항골남길 46','sisters.jpg','sisters2.jpg','sisters3.jpg','sisters4.jpg','sisters5.jpg','064','746','2222','09:00','18:00','2002-02-28');
insert into rest values(resseq.nextval,'우진해장국','33.5115050','126.5200319','제주 제주시 서사로 11','woojin.jpg','woojin2.jpg','woojin3.jpg','woojin4.jpg','woojin5.jpg','064','757','3393','06:00','22:00','1995-04-12');

insert into rest values(resseq.nextval,'안녕협재씨','33.3866186','126.2250355','제주특별자치도 제주시 특별자치도, 한림읍 금능9길 12','hello.jpg','hello2.jpg','hello3.jpg','hello4.jpg','hello5.jpg','064','796','0624','09:00','16:00','2017-06-24');
insert into rest values(resseq.nextval,'올래국수','33.4915195','126.4972577','제주특별자치도 제주시 특별자치도, 연동 귀아랑길 24','ollae.jpg','ollae2.jpg','ollae3.jpg','ollae4.jpg','ollae5.jpg','064','742','7355','08:30','15:00','2011-05-05');
insert into rest values(resseq.nextval,'명진전복','33.5324891','126.8502082','제주특별자치도 제주시 구좌읍 해맞이해안로 1282','myoungjin.jpg','myoungjin2.jpg','myoungjin3.jpg','myoungjin4.jpg','myoungjin5.jpg','064','782','9944','09:30','21:00','2012-07-01');
insert into rest values(resseq.nextval,'돈사돈 제주본관','33.4788707','126.4640837','제주특별자치도 제주시 노형동 3086-3','donsadon.jpg','donsadon2.jpg','donsadon3.jpg','donsadon4.jpg','donsadon5.jpg','064','746','8989','12:30','22:00','2018-07-15');
insert into rest values(resseq.nextval,'하갈비국수','33.4645313','126.3088230','제주 제주시 애월읍 애월북서길 54','hagalbi.jpg','hagalbi2.jpg','hagalbi3.jpg','hagalbi4.jpg','hagalbi5.jpg','0507','1390','2724','09:00','18:00','2020-12-01');

insert into rest values(resseq.nextval,'한라전복','33.4707177','126.9171910','제주특별자치도 서귀포시 특별자치도, 대정읍 대한로 33','hanra.jpg','hanra2.jpg','hanra3.jpg','hanra4.jpg','hanra5.jpg','064','782','5190','10:00','20:00','1997-08-17');
insert into rest values(resseq.nextval,'연돈','33.2592174','126.4057641','제주 서귀포시 색달로 10','yeondon.jpg','yeondon2.jpg','yeondon3.jpg','yeondon4.jpg','yeondon5.jpg','0507','1386','7060','12:00','21:00','2015-09-25');
insert into rest values(resseq.nextval,'성읍칠십리식당','33.3892433','126.8011784','제주 서귀포시 표선면 성읍정의현로 74','seong.jpg','seong2.jpg','seong3.jpg','seong4.jpg','seong5.jpg','064','787','0911','11:00','20:00','1980-01-22');
insert into rest values(resseq.nextval,'바다를본돼지','33.2430993','126.5675955','제주 서귀포시 칠십리로 123','seapig.jpg','seapig2.jpg','seapig3.jpg','seapig4.jpg','seapig5.jpg','0507','1413','1058','12:00','21:00','2015-11-24');
insert into rest values(resseq.nextval,'가시아방국수','33.4386160','126.9180650','제주 서귀포시 성산읍 섭지코지로 10','gasiabang.jpg','gasiabang2.jpg','gasiabang3.jpg','gasiabang4.jpg','gasiabang5.jpg','064','783','0987','10:00','20:30','2017-12-10');
insert into rest values(resseq.nextval,'제주 판타스틱버거','33.3084898','126.7790718','제주 서귀포시 표선면 토산중앙로15번길 6','fantastic.jpg','fantastic2.jpg','fantastic3.jpg','fantastic4.jpg','fantastic5.jpg','0507','1339','6990','10:00','19:00','2020-11-21');
insert into rest values(resseq.nextval,'미스터크랩','33.2894013','126.7514871','제주 서귀포시 남원읍 남태해안로 533','mrcrab.jpg','mrcrab2.jpg','mrcrab3.jpg','mrcrab4.jpg','mrcrab5.jpg','0507','1471','5025','11:30','21:00','2015-06-11');
insert into rest values(resseq.nextval,'화고 흑돼지','33.2533624','126.5062742','제주 서귀포시 신서로32번길 20','firego.jpg','firego2.jpg','firego3.jpg','firego4.jpg','firego5.jpg','0507','1358','6124','11:00','24:00','2020-07-15');
insert into rest values(resseq.nextval,'춘미향 제주산방산점','33.2314288','126.2965731','제주 서귀포시 안덕면 산방로 378','chunmi.jpg','chunmi2.jpg','chunmi3.jpg','chunmi4.jpg','chunmi5.jpg','0507','5611','5611','11:30','21:00','2003-03-13');
insert into rest values(resseq.nextval,'제주고로','33.2711473','126.2025341','제주 서귀포시 대정읍 서삼중로 94','goro.jpg','goro2.jpg','goro3.jpg','goro4.jpg','goro5.jpg','0507','1312','9080','11:00','15:30','2017-12-10');
insert into rest values(resseq.nextval,'김녕오라이','33.5577318','126.7552547','제주 제주시 구좌읍 김녕로21길 21','kimnyeong.jpg','kimnyeong2.jpg','kimnyeong3.jpg','kimnyeong4.jpg','kimnyeong5.jpg','064','747','8174','11:30','21:00','2006-05-22');

commit;
-- 카페 insert

insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'하도1940','33.527646','126.882477','제주특별자치도 제주시 구좌읍 해맞이해안로 1681-3','064','782','1940','skip','09:00','17:00','hd1.jpeg','hd2.jpeg','hd3.jpeg','hd4.jpeg','hd5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'아줄레주','33.366747','126.839139','제주 서귀포시 성산읍 신풍하동로19번길 59','0507','1411','4052','skip','11:00','19:00','al1.jpeg','al2.jpeg','al3.jpeg','al4.jpeg','al5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'카페 글렌코','33.433593','126.733503','제주 제주시 구좌읍 비자림로 1202','010','9587','3555','skip','09:30','17:30','gc1.jpeg','gc2.jpeg','gc3.jpeg','gc4.jpeg','gc5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'그계절','33.531853','126.818534','제주특별자치도 제주시 구좌읍 한동로 119','010','3140','3121','skip','11:00','17:30','ts1.jpeg','ts2.jpeg','ts3.jpeg','ts4.jpeg','ts5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'도렐 제주본점','33.449913','126.918557','제주특별자치도 서귀포시 성산읍 동류암로 20 플레이스 내 LOVE동 1층','064','766','3008','skip','08:30','20:00','dr1.jpeg','dr2.jpeg','dr3.jpeg','dr4.jpeg','dr5.jpeg');

insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'마노르블랑','33.254876','126.295011','제주특별자치도 서귀포시 안덕면 일주서로2100번길 46 1층','064','794','0999','skip','09:00','18:30','mb1.jpeg','mb2.jpeg','mb3.jpeg','mb4.jpeg','mb5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'인스밀','33.238440','126.229384','제주특별자치도 서귀포시 대정읍 일과대수로27번길 22 1층','010','6844','5661','skip','11:30','18:00','im1.jpeg','im2.jpeg','im3.jpeg','im4.jpeg','im5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'산노루','33.329969','126.213613','제주특별자치도 제주시 한경면 낙원로 32','070','8801','0228','skip','10:00','19:00','snl1.jpeg','snl2.jpeg','snl3.jpeg','snl4.jpeg','snl5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'클랭블루','33.345020','126.177518','제주특별자치도 제주시 한경면 한경해안로 552-22','070','8801','0228','skip','10:00','19:00','cb1.jpeg','cb2.jpeg','cb3.jpeg','cb4.jpeg','cb5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'웨이뷰','33.407265','126.253018','제주특별자치도 제주시 한림읍 옹포7길 25-3','010','5198','8767','skip','09:00','19:00','wv1.jpeg','wv2.jpeg','wv3.jpeg','wv4.jpeg','wv5.jpeg');

insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'원앤온리','33.239173','126.319468','제주특별자치도 서귀포시 안덕면 산방로 141','064','794','0117','skip','09:00','20:00','oa1.jpeg','oa2.jpeg','oa3.jpeg','oa4.jpeg','oa5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'베케','33.261861','126.604860','제주특별자치도 서귀포시 효돈로 54','064','732','3828','skip','11:00','18:00','bk1.jpeg','bk2.png','bk3.png','bk4.png','bk5.png');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'더클리프','33.244270','126.415033','제주특별자치도 서귀포시 중문관광로 154-17','064','738','8866','skip','10:00','01:00','tc1.jpeg','tc2.jpeg','tc3.png','tc4.png','tc5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'허니문하우스','33.245919','126.578516','제주특별자치도 서귀포시 칠십리로 228-13','070','4277','9922','skip','10:00','18:00','hmh1.jpeg','hmh2.jpeg','hmh3.jpeg','hmh4.jpeg','hmh5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'서귀다원','33.312877','126.596710','제주특별자치도 서귀포시 516로 717','064','733','0632','skip','09:00','17:00','sg1.jpeg','sg2.jpeg','sg3.jpeg','sg4.jpeg','sg5.jpeg');

insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'노티드 제주','33.463284','126.309798','제주특별자치도 제주시 애월읍 애월로1길 24-9','010','4925','9377','skip','10:00','20:00','kt1.jpeg','kt2.jpeg','kt3.jpeg','kt4.jpeg','kt5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'델문도 함덕점','33.543712','126.668826','제주특별자치도 제주시 조천읍 조함해안로 519-10','064','702','0007','skip','07:00','23:55','dmd1.jpeg','dmd2.jpeg','dmd3.jpeg','dmd4.jpeg','dmd5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'오드랑베이커리','33.542061','126.671523','제주특별자치도 제주시 조천읍 조함해안로 552-3','064','784','5404','skip','07:00','22:00','ob1.jpeg','ob2.jpeg','ob3.jpeg','ob4.jpeg','ob5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'아베베베이커리 제주점','33.512632','126.528865','제주특별자치도 제주시 동문로6길 4','010','8857','0750','skip','10:00','21:00','ab1.jpeg','ab2.jpeg','ab3.jpeg','ab4.jpeg','ab5.jpeg');
insert into cafe (CNUM,NAME,XPOS,YPOS,ADDRESS,CTEL1,CTEL2,CTEL3,C_DATE,CTIME1,CTIME2,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5) 
values (cafeseq.nextval,'모알보알 제주','33.559502','126.728020','제주특별자치도 제주시 구좌읍 구좌해안로 141','0507','1312','3506','skip','10:00','17:30','mbj1.jpeg','mbj2.jpeg','mbj3.jpeg','mbj4.jpeg','mbj5.jpeg');


Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'라마다 프라자 제주 호텔','138,162','라마다호텔 1.jpg','라마다호텔 2.jpg','라마다호텔 3.jpg','라마다호텔 4.jpg','라마다호텔 5.jpg','라마다호텔 6.jpg','제주 제주시 탑동로 66','064-729-8100','무료 Wi-Fi,실내 수영장,사우나,스파,피트니스 센터','주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 5개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 실내 수영장 및 피트니스 센터을/를 제공합니다.','Superior Twin Mountain View','Mountain View Twin ','Superior Family Twin','Deluxe Twin Ocean View','161,594','166,780','161,594','169,470','33.518500','126.518524');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'제주 오리엔탈 호텔 앤 카지노','100,184','제주 오리엔탈 호텔1.jpg','제주 오리엔탈 호텔 2.jpg','제주 오리엔탈 호텔 3.jpg','제주 오리엔탈 호텔 4.jpg','제주 오리엔탈 호텔 5.jpg','제주 오리엔탈 호텔 6.jpg','제주 제주시 탑동로 47','064-752-8222','사우나,무료 주차,룸서비스','주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 5개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 온천탕 및 피트니스 센터을/를 제공합니다.','Standart Twin','Deluxe Twin Mountain View','Deluxe Twin Ocean View','Standard Room with City View','100,184','118,734','118,734','220,907','33.517315','126.519721');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'호텔 리젠트 마린 제주','259,508','호텔 리젠트 마린 제주1.jpg','호텔 리젠트 마린 제주2.jpg','호텔 리젠트 마린 제주5.jpg','호텔 리젠트 마린 제주2.jpg','호텔 리젠트 마린 제주4.jpg','호텔 리젠트 마린 제주6.jpg','제주 제주시 서부두2길 20','02-777-5080','야외 수영장,24시간 프런트 데스크','주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 피트니스 센터 및 실외 수영장을/를 제공합니다.',' Standard Double Room with City View','Superior Twin','Deluxe Double','Standard Twin City View','259,508','300,680','313,200','333,580','33.517651','126.526846');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'엠버호텔 제주','198,182','엠버호텔1.jpg','엠버호텔2.jpg','엠버호텔3.jpg','엠버호텔4.jpg','엠버호텔5.jpg','엠버호텔6.jpg','제주 제주시 삼무로 12','064-745-7458','무료 Wi-Fi,24시간 프런트 데스크,레스토랑','모든 객실 내 무료 Wi-Fi이/가 제공되는 이 숙소에서 즐거운 여행을 시작하세요. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 4성급 숙소는 보다 훌륭하고 기억에 남는 숙박을 제공하기 위해 레스토랑을/를 갖추고 있습니다.',' Standard Double Room - No Parking','Deluxe Twin Room - No Parking',' Deluxe Family Room - No Parking','Premium Deluxe Room - No Parking','198,182','231,818','254,525','282,645','33.489814','126.487717');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'호텔 샬롬 제주 ','150,638','호텔 샬롬 제주1.jpg','호텔 샬롬 제주2.jpg','호텔 샬롬 제주3.jpg','호텔 샬롬 제주4.jpg','호텔 샬롬 제주5.jpg','호텔 샬롬 제주6.jpg','제주 제주시 동광로 34','064-720-7704','무료 Wi-Fi,무료 주차,24시간 프런트 데스크',' 주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 4성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다','Deluxe Twin','디럭스 패밀리룸 (Deluxe Family Room) ','싱글룸 (Single Room)','Junior Double','150,638','155,173','120,273','155,755','33.501884','126.532663');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'해비치 호텔 앤 리조트 제주','254,962','해비치 호텔 앤 리조트 제주1.jpg','해비치 호텔 앤 리조트 제주2.jpg','해비치 호텔 앤 리조트 제주3.jpg','해비치 호텔 앤 리조트 제주4.jpg','해비치 호텔 앤 리조트 제주5.jpg','해비치 호텔 앤 리조트 제주6.jpg','제주 서귀포시 표선면 민속해안로 537','064-780-8100','실내 수영장,무료 주차,24시간 프런트 데스크',' 제주의 성산에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 5개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 실내 수영장 및 피트니스 센터를 제공합니다.','Hotel Superior Village View Twin Room','Hotel Superior Village View King Room','Hotel Deluxe Seaside Twin Room','Hotel Deluxe Seaside King Room','295,333','262,212','303,167','394,698','33.323129','126.844781');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'카세로지 (Kaselodge)','1,282,116','카세로지 (Kaselodge)1.jpg','카세로지 (Kaselodge)2.jpg','카세로지 (Kaselodge)3.jpg','카세로지 (Kaselodge)4.jpg','카세로지 (Kaselodge)5.jpg','카세로지 (Kaselodge)6.jpg','제주 서귀포시 표선면 가시로 383','064-780-4800','무료 Wi-Fi,실내 수영장,사우나,조식 포함,24시간 프런트 데스크,레스토랑','제주의 성산에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 본 5성급 숙소는 숙박의 질과 즐거움을 향상시키기 위한 숙소 내 다양한 편의시설로 가득 차 있습니다.','가든 스파 스위트 (Garden Spa Suite)','스위트룸 - 테라스 (Suite with Terrace)','스위트룸 - 스파 욕조 (Suite with Spa Bath)','스위트룸 - 씨뷰 (Suite with Sea)','1,454,545','1,282,116','1,282,116','1,454,545','33.345552','126.786996');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'리시온 호텔 (Rezion Hotel)','149,999','리시온 호텔 (Rezion Hotel)1.jpg','리시온 호텔 (Rezion Hotel)2.jpg','리시온 호텔 (Rezion Hotel)3.jpg','리시온 호텔 (Rezion Hotel)4.jpg','리시온 호텔 (Rezion Hotel)5.jpg','리시온 호텔 (Rezion Hotel)6.jpg','제주 서귀포시 표선면 표선동서로 263','064-787-8841','24시간 프런트 데스크,룸서비스','제주의 성산에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을 방문해 보세요. 보다 나은 숙박을 위해 레스토랑 및 마사지 등 숙소 내 특별한 편의시설이 제공됩니다.','Ocean View Double','Superior - Non-Smoking','Ocean Twin',' Haevichi Ocean View ','149,999','149,683','152,047','152,727','33.327163','126.833695');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'제이앤비 호텔 (JnB Hotel)','142,924','제이앤비 호텔 (JnB Hotel)1.jpg','제이앤비 호텔 (JnB Hotel)2.jpg','제이앤비 호텔 (JnB Hotel)3.jpg','제이앤비 호텔 (JnB Hotel)4.jpg','제이앤비 호텔 (JnB Hotel)5.jpg','제이앤비 호텔 (JnB Hotel)6.jpg','제주 서귀포시 토평남로30번길 10-12','0507-1432-8864','무료 Wi-Fi,야외 수영장,무료 주차','제주의 서귀포에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 본 3성급 숙소는 보다 훌륭하고 기억에 남는 숙박을 제공하기 위해 실외 수영장을  갖추고 있습니다.','Superior Double Room','Superior Triple','Superior Double Room','Family Suite','142,924','155,884','182,245','285,349','33.260598','126.592679');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'머큐어 앰배서더 제주','144,000','머큐어 앰배서더 제주1.jpg','머큐어 앰배서더 제주2.jpg','머큐어 앰배서더 제주3.jpg','머큐어 앰배서더 제주4.jpg','머큐어 앰배서더 제주5.jpg','머큐어 앰배서더 제주6.jpg','제주 서귀포시 안덕면 한창로 365','064-793-1131','실내 수영장,사우나,룸서비스,스파,피트니스 센터','제주의 중문에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑, 피트니스 센터 및 실외 수영장을 제공합니다.','Deluxe Room',' Parlor Room','Deluxe Suite','Executive Suite','144,000','230,000','243,000','279,000','33.293809','126.348992');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'제주신라호텔','338,800','신라호텔5.jpg','신라호텔1.jpg','신라호텔2.jpg','신라호텔3.jpg','신라호텔4.jpg','신라호텔6.jpg','제주 서귀포시 중문관광로72번길 75','064-735-1234','무료 Wi-Fi,야외 수영장,레스토랑,피트니스 센터','신라호텔의 야외 수영장은 무료로 이용 가능하며, 실내 수영장, 피트니스 센터와 사우나는 추가 요금으로 이용하실 수 있습니다. 어린이 수영장과 놀이방 등 어린이를 위한 실내 및 야외 활동도 다양하게 제공됩니다. 유모차는 무료로 대여하실 수 있습니다.','Standard Double Room(Mountain view)','Standard Twin Room(Sea view)','Standard Twin Room(Mountain view)','Standard Double Room(Mountain view)','338,800 원','338,800 원','371,800 원','371,800 원','33.247881','126.408438');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'라마다 프라자 제주 호텔','160,000','라마다호텔 1.jpg','라마다호텔 2.jpg','라마다호텔 3.jpg','라마다호텔 4.jpg','라마다호텔 5.jpg','라마다호텔 6.jpg','제주특별자치도 제주시 삼도이동 1254','064-729-8100','무료 Wi-Fi,실내 수영장,조식 포함,레스토랑,피트니스 센터','라마다프라자호텔은 전 세계 8,000여 개 라마다 브랜드 호텔 중 최상위등급 호텔 입니다 제주도 최초 5성 호텔로 투숙 고객님께 최상의 시설과 서비스를 보장 합니다 동급 호텔 대비 큰 객실을 제공하고 있어 편안한 휴식이 가능합니다','Superior Twin City view','Kids Sweet Mountain view','Habor Familiy Twin','Superior Twin Sea view','160,000','200,000','230,000 ','220,000','33.493483','126.534319');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'서머셋 제주신화월드','408,000','서머셋 제주신화월드1.jpg','서머셋 제주신화월드2.jpg','서머셋 제주신화월드3.jpg','서머셋 제주신화월드4.jpg','서머셋 제주신화월드5.jpg','서머셋 제주신화월드6.jpg','제주 서귀포시 안덕면 신화역사로304번길 89','1670-8800','무료 Wi-Fi,야외 수영장,무료 주차,조식 포함,룸서비스,스파','Ascott Cares 인증 기준 외에도 모든 투숙객은 모든 객실 내 무료 Wi-Fi 및 차를 운전해서 오실 경우 무료 주차를 이용하실 수 있습니다. ','Family Suite Ondol ',' Camping in Somerset Kids Room','Family Suite ','Racing in Somerset Kids Room ','408,000','435,000','462,000','494,130','33.302674','126.316952');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'메리어트 호텔 제주','236,667','메리어트 호텔 제주1.jpg','메리어트 호텔 제주2.jpg','메리어트 호텔 제주3.jpg','메리어트 호텔 제주4.jpg','메리어트 호텔 제주5.jpg','메리어트 호텔 제주6.jpg','제주 서귀포시 안덕면 신화역사로304번길','1670-8800','야외 수영장,무료 주차,룸서비스,스파','각 객실에는 안전 금고, 미니바, 평면 TV, 책상이 구비되어 있습니다. 전용 욕실에는 욕조가 설치되어 있으며, 목욕 가운, 헤어드라이어, 탄(Thann) 브랜드의 욕실용품이 제공됩니다.','Premier Room, Guest room','Premier Room, Guest room, 2 Twins','Family Room, Family room','Bedroom Presidential Suite','236,667','316,667','316,666','424,552','33.306580','126.318973');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'제주 핀크스 포도 호텔','380,165','제주 핀크스 포도 호텔1.jpg','제주 핀크스 포도 호텔2.jpg','제주 핀크스 포도 호텔3.jpg','제주 핀크스 포도 호텔4.jpg','제주 핀크스 포도 호텔5.jpg','제주 핀크스 포도 호텔6.jpg','제주 서귀포시 안덕면 산록남로 863','064-793-7000','무료 주차,24시간 프런트 데스크','제주의 중문에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다.','Deluxe Twin Western Room','Deluxe Twin Korean Room','Deluxe Double Western Room','Deluxe Double Korean Room','380,165','442,149','429,752','483,471','33.317717','126.387567');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'디아일랜드블루 호텔','190,409','디아일랜드블루 호텔1.jpg','디아일랜드블루 호텔2.jpg','디아일랜드블루 호텔3.jpg','디아일랜드블루 호텔4.jpg','디아일랜드블루 호텔5.jpg','디아일랜드블루 호텔6.jpg','제주 서귀포시 태평로431번길 3','064-762-6532','레스토랑,룸서비스,스파','제주의 서귀포에 위치한 본 숙소는 관광 명소 및 흥미로운 레스토랑과 가깝습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑 및 마사지을/를 제공합니다.','Island Double Room','Premier Family Suite ',' Premier Family Suite','Premier Family Suite Cooking Allowed','190,409','290,044','143,264','300,260','33.245726','126.565768');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'더 베스트 제주 성산','147,328','더 베스트 제주 성산1.jpg','더 베스트 제주 성산2.jpg','더 베스트 제주 성산3.jpg','더 베스트 제주 성산4.jpg','더 베스트 제주 성산5.jpg','더 베스트 제주 성산6.jpg','제주 서귀포시 성산읍 동류암로 26','0507-1401-0550','실내 수영장,룸서비스,피트니스 센터','대형 창문이 설치된 모든 객실은 커피 테이블이 구비된 휴식 공간 및 업무용 책상을 갖추고 있습니다. 객실마다 커피/차 및 생수도 제공됩니다. 전용 욕실에는 전자 비데가 설치된 화장실, 워크인 샤워 시설이 마련되어 있습니다.','Standard Twin Room','Jacuzzi 1 King Bed','Standard Double Room','Standard Twin Room','147,328','150,000','152,052','161,490','33.449166','126.916523');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'제주 스테이 인 성산','134,633','제주 스테이 인 성산1.jpg','제주 스테이 인 성산2.jpg','제주 스테이 인 성산3.jpg','제주 스테이 인 성산4.jpg','제주 스테이 인 성산5.jpg','제주 스테이 인 성산6.jpg','제주 서귀포시 성산읍 신고로 11','0507-1374-8877','무료 Wi-Fi,무료 주차,레스토랑','투숙객 요구를 편리하게 충족시킬 수 있도록 숙소 내 레스토랑을 제공합니다.','Deluxe Double','Deluxe Twin','Standard Double','Standard twin','134,633','153,636','142,360','152,480','33.437695','126.916358');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'골든튤립 제주 성산 호텔','147,530','골든튤립 제주 성산 호텔1.jpg','골든튤립 제주 성산 호텔2.jpg','골든튤립 제주 성산 호텔3.jpg','골든튤립 제주 성산 호텔4.jpg','골든튤립 제주 성산 호텔5.jpg','골든튤립 제주 성산 호텔6.jpg','제주 서귀포시 성산읍 일출로 31','064-744-7500','무료 Wi-Fi,야외 수영장,레스토랑','투숙객에게 숙소 내 레스토랑 및 실외 수영장을 제공합니다.','Superior Twin','Deluxe Triple','Deluxe Family City View','Superior Twin','147,530','183,335','178,090','190,338','33.447933','126.916229');
Insert into hotel (HNUM,NAME,HPRICE,IMAGE,IMAGE2,IMAGE3,IMAGE4,IMAGE5,IMAGE6,ADDRESS,HTEL,FACILITY,HCONTENT,RNAME1,RNAME2,RNAME3,RNAME4,RPRICE1,RPRICE2,RPRICE3,RPRICE4,XPOS,YPOS) values (hotel_seq.nextval,'해일리 풀 앤 스파 호텔','165,132','해일리 풀 앤 스파 호텔1.jpg','해일리 풀 앤 스파 호텔2.jpg','해일리 풀 앤 스파 호텔3.jpg','해일리 풀 앤 스파 호텔4.jpg','해일리 풀 앤 스파 호텔5.jpg','해일리 풀 앤 스파 호텔6.jpg','제주 서귀포시 성산읍 한도로 269-37 해일리호텔','0507-1418-0131','무료 Wi-Fi,무료 주차,24시간 프런트 데스크','제주 동쪽 최고의 절경을 감상하시며 해일리풀앤스파 호텔 에 도착하실수 있습니다','POOL VILLA STANDARD','SUITE POOL VILLA','POOL VILLA SUITE','POOL VILLA TWIN','165,132','182,645','214,674','189,899','33.469066','126.935343');