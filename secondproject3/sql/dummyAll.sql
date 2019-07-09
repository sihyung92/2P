/*
순서

1.유저분류
2.강의등록
3.회원등록
4.자격증
>시퀀스가 최소값이 1이라 0부터 생성이 안됨!
5.자격증을 가진 회원
*/

/* Drop Tables */
DROP TABLE bbsKind CASCADE CONSTRAINTS;
DROP TABLE career CASCADE CONSTRAINTS;
DROP TABLE userCert CASCADE CONSTRAINTS;
DROP TABLE certification CASCADE CONSTRAINTS;
DROP TABLE lmsBbs CASCADE CONSTRAINTS;
DROP TABLE userData CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE userKind CASCADE CONSTRAINTS;

drop SEQUENCE userData_0_seq;

/* Create Sequences */
CREATE SEQUENCE bbsKind_seq START WITH 1;
CREATE SEQUENCE career_seq;
CREATE SEQUENCE certification_seq;
CREATE SEQUENCE lecture_seq;
CREATE SEQUENCE lmsBbs_0_seq;
CREATE SEQUENCE lmsBbs_1_seq;
CREATE SEQUENCE lmsBbs_2_seq;
CREATE SEQUENCE lmsBbs_3_seq;
CREATE SEQUENCE lmsBbs_4_seq;
CREATE SEQUENCE reply_seq;
CREATE SEQUENCE schedule_seq;
CREATE SEQUENCE userData_0_seq;
CREATE SEQUENCE userData_1_seq;
CREATE SEQUENCE userData_2_seq;
CREATE SEQUENCE userKind_seq START WITH 1;

/* Create Tables */

CREATE TABLE bbsKind
(
	-- 00 공지사항
	-- 01 수업자료
	-- 02 과제
	-- 03 질문_질의
	codeNum number NOT NULL,
	-- 00 공지사항
	-- 01 수업자료
	-- 02 과제
	-- 03 질문_질의
	kind varchar2(50),
	PRIMARY KEY (codeNum)
);

CREATE TABLE career
(
	num number NOT NULL,
	startdate date,
	enddate date,
	company varchar2(100),
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind number NOT NULL,
	PRIMARY KEY (num)
);

CREATE TABLE certification
(
	codeNum number NOT NULL,
	kind varchar2(50),
	PRIMARY KEY (codeNum)
);

CREATE TABLE lecture
(
	num number NOT NULL,
	name varchar2(60),
	startdate date,
	enddate date,
	classroom varchar2(21),
	content varchar2(2000),
	attach varchar2(1000),
	teacherName varchar2(30),
	PRIMARY KEY (num)
);


CREATE TABLE lmsBbs
(
	listNum number NOT NULL,
	-- 00 공지사항
	-- 01 수업자료
	-- 02 과제
	-- 03 질문_질의
	bbsNum number NOT NULL,
	num number NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	id varchar2(50),
	nalja date,
	views number,
	attach varchar2(1000),
	PRIMARY KEY (listNum, bbsNum, num)
);

CREATE TABLE userCert
(
	codeNum number NOT NULL,
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind number NOT NULL
);

CREATE TABLE userData
(
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind number NOT NULL,
	lecNum number,
	id varchar2(50) NOT NULL,
	pw varchar2(20) NOT NULL,
	name varchar2(30) NOT NULL,
	birth date,
	phone number,
	email varchar2(100),
	address varchar2(100),
	major varchar2(50),
	PRIMARY KEY (userNum, kind)
);


CREATE TABLE userKind
(
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	codeNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind varchar2(50),
	PRIMARY KEY (codeNum)
);


/* Create Foreign Keys */

ALTER TABLE userCert
	ADD FOREIGN KEY (codeNum)
	REFERENCES certification (codeNum)
;


ALTER TABLE lmsBbs
	ADD FOREIGN KEY (num)
	REFERENCES lecture (num)
;

ALTER TABLE userData
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num)
;

ALTER TABLE userCert
	ADD FOREIGN KEY (userNum, kind)
	REFERENCES userData (userNum, kind)
;


/*이하 더미데이터*/

/*
 유저분류
CREATE TABLE userKind
(
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	codeNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind varchar2(50),
	PRIMARY KEY (codeNum)
);
*/

insert into userKind values (00,'학생');
insert into userKind values (01,'강사');
insert into userKind values (02,'관리자');


/*
강의
CREATE TABLE lecture
(
	num number NOT NULL,
	name varchar2(60),
	startdate date,
	enddate date,
	classroom varchar2(21),
	content varchar2(2000),
	attach varchar2(1000),
	teacherName varchar2(30),
	PRIMARY KEY (num)
);
*/

insert into LECTURE values (lecture_seq.nextval, '응용 SW 엔지니어링 양성과정','2019-07-01','2019-09-30',
							'301호', '컴퓨터 프로그래밍 기술','응용_SW_엔지니어링_양성과정_커리큘럼.doc','홍길동');
							
insert into LECTURE values (lecture_seq.nextval, '자바 기반 웹&앱 개발자 양성과정','2019-08-01','2019-10-31',
							'302호', 'JAVA에 대해 기초부터 학습','자바_기반_웹&앱_개발자_양성과정_커리큘럼.doc','김철수');	
							
insert into LECTURE values (lecture_seq.nextval, '스마트 웹&앱 콘텐츠 제작 과정','2019-09-01','2019-11-30',
							'303호', '스마트기기에 적합한 문화콘텐츠 제작','스마트_웹&앱_콘텐츠_제작_과정_커리큘럼.doc','이철수');
													

/*
회원정보
CREATE TABLE userData
(
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind number NOT NULL,
	lecNum number,
	id varchar2(50) NOT NULL,
	pw varchar2(20) NOT NULL,
	name varchar2(30) NOT NULL,
	birth date,
	phone number,
	email varchar2(100),
	address varchar2(100),
	major varchar2(50),
	PRIMARY KEY (userNum, kind)
);
*/
select * from USERDATA;
/*학생*/
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu01','stu01','학생01','1999-09-19',01012345678,'stu01@bit.com','경기도 안양시','회계');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu02','stu02','학생02','1998-08-18',01023456789,'stu02@bit.com','경기도 안양시','영문');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu03','stu03','학생03','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu04','stu04','학생04','1996-06-16',01045678912,'stu04@bit.com','경기도 안양시','컴퓨터');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu05','stu05','학생05','1995-05-15',01056789123,'stu05@bit.com','경기도 안양시','경영');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu06','stu06','학생06','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');

/*강사*/
insert into userData values (userData_1_seq.nextval, 1, 1, 'tea01','tea01','강사01','1985-05-15',01012345678,'tea01@bit.com','경기도 안양시','건축');
insert into userData values (userData_1_seq.nextval, 1, 2, 'tea02','tea02','강사02','1985-06-16',01023456789,'tea02@bit.com','경기도 안양시','디지털기계');
insert into userData values (userData_1_seq.nextval, 1, 3, 'tea03','tea03','강사03','1985-07-17',01023456788,'tea03@bit.com','경기도 안양시','역사교육');


/*관리자*/
insert into userData values (userData_2_seq.nextval, 2, '', 'adm01','adm01','관리자01','1975-05-15',01012345678,'adm01@bit.com','경기도 안양시','');
insert into userData values (userData_2_seq.nextval, 2, '', 'adm02','adm02','관리자02','1965-05-15',01011111111,'adm02@bit.com','경기도','');


/*
자격증 
CREATE TABLE certification
(
	codeNum number NOT NULL,
	kind varchar2(50),
	PRIMARY KEY (codeNum)
);
*/

insert into certification values (certification_seq.nextval,'정보처리기사');
insert into certification values (certification_seq.nextval,'정보관리기능사');
insert into certification values (certification_seq.nextval,'멀티미디어콘텐츠제작전문가');

commit
select * from certification;

/*
자격증을 보유한 회원
CREATE TABLE userCert
(
	codeNum number NOT NULL,
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	kind number NOT NULL
);

*/

insert into userCert values(1,1,1);
insert into userCert values(1,2,1);
insert into userCert values(1,3,1);

insert into userCert values(2,2,1);
insert into userCert values(3,3,1);

commit
select * from userCert;

select kind from certification where codenum IN (select codenum from userCert where kind=1 AND usernum=3);

insert into bbsKind values (00,'공지사항');
insert into bbsKind values (01,'수업자료');
insert into bbsKind values (02,'과제');
insert into bbsKind values (03,'질문');


/*강의넘버 1 sw엔지니어링 강의실 게시판*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice','welcome',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice1','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice2','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice3','welcome3',
		'adm02','2019-07-04',44,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice4','welcome4',
		'adm02','2019-07-05',55,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data','for class',
		'tea01','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data2','for class2',
		'tea01','2019-07-03',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data3','for class3',
		'tea01','2019-07-07',33,'3.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data4','for class4',
		'tea01','2019-07-09',44,'4.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'assigment','hello, world!',
		'tea01','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'assigment2','data type',
		'tea01','2019-07-03',22,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'assigment3','loop',
		'tea01','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'q1','help',
		'stu01','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'qu2','help me',
		'stu01','2019-07-03',22,'ex03.java');

/*강의넘버 2 자바 기반 강의실 게시판*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice','welcome to class2',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice1','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice2','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice3','welcome3',
		'adm02','2019-07-04',44,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'data','for class',
		'tea02','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'data2','for class2',
		'tea02','2019-07-03',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'data3','for class3',
		'tea02','2019-07-07',33,'3.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'assigment','hello, world!',
		'tea02','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'assigment2','data type',
		'tea02','2019-07-03',22,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'assigment3','loop',
		'tea02','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'q1 class2','help',
		'stu02','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'qu2','help me',
		'stu02','2019-07-03',22,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'qu3','hellllp me',
		'stu03','2019-07-05',23,'ex05.java');


/*강의넘버 3 스마트 웹앱 게시판*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice','welcome to class3',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice1','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice2','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice3','welcome3',
		'adm02','2019-07-04',44,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'data','for class',
		'tea03','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'data2','for class3',
		'tea03','2019-07-03',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'data3','for class3',
		'tea03','2019-07-07',33,'3.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'assigment','hello, world!',
		'tea03','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'assigment2','data type',
		'tea03','2019-07-03',22,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'assigment3','loop',
		'tea03','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'q1 class3','help',
		'stu03','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'qu2','help me',
		'stu04','2019-07-03',22,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'qu3','hellllp me',
		'stu05','2019-07-05',23,'ex05.java');

		
/*강의게시판 분류넘버*/
insert into bbsKind values (00,'공지사항');
insert into bbsKind values (01,'수업자료');
insert into bbsKind values (02,'과제');
insert into bbsKind values (03,'질문');
		


/*게시판 더미*/
/*강의넘버 1 sw엔지니어링 강의실 게시판*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice','welcome',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice1','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice2','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice3','welcome3',
		'adm02','2019-07-04',44,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'notice4','welcome4',
		'adm02','2019-07-05',55,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data','for class',
		'tea01','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data2','for class2',
		'tea01','2019-07-03',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data3','for class3',
		'tea01','2019-07-07',33,'3.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'data4','for class4',
		'tea01','2019-07-09',44,'4.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'assigment','hello, world!',
		'tea01','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'assigment2','data type',
		'tea01','2019-07-03',22,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'assigment3','loop',
		'tea01','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'q1','help',
		'stu01','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'qu2','help me',
		'stu01','2019-07-03',22,'ex03.java');


/*강의넘버 2 자바 기반 강의실 게시판*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice','welcome to class2',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice1','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice2','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'notice3','welcome3',
		'adm02','2019-07-04',44,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'data','for class',
		'tea02','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'data2','for class2',
		'tea02','2019-07-03',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'data3','for class3',
		'tea02','2019-07-07',33,'3.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'assigment','hello, world!',
		'tea02','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'assigment2','data type',
		'tea02','2019-07-03',22,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'assigment3','loop',
		'tea02','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'q1 class2','help',
		'stu02','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'qu2','help me',
		'stu02','2019-07-03',22,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'qu3','hellllp me',
		'stu03','2019-07-05',23,'ex05.java');


/*강의넘버 3 스마트 웹앱 게시판*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice','welcome to class3',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice1','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice2','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'notice3','welcome3',
		'adm02','2019-07-04',44,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'data','for class',
		'tea03','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'data2','for class3',
		'tea03','2019-07-03',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'data3','for class3',
		'tea03','2019-07-07',33,'3.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'assigment','hello, world!',
		'tea03','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'assigment2','data type',
		'tea03','2019-07-03',22,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'assigment3','loop',
		'tea03','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'q1 class3','help',
		'stu03','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'qu2','help me',
		'stu04','2019-07-03',22,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'qu3','hellllp me',
		'stu05','2019-07-05',23,'ex05.java');
commit


--select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,classroom,content,attach,teacherName from lecture where num=1;