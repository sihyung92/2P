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
CREATE SEQUENCE bbsKind_seq START WITH 0;
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
CREATE SEQUENCE userKind_seq START WITH 0;

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
	PRIMARY KEY (num)
);
*/

insert into LECTURE values (lecture_seq.nextval, '응용 SW 엔지니어링 양성과정','2019-07-01','2019-09-30',
							'301호', '컴퓨터 프로그래밍 기술','응용_SW_엔지니어링_양성과정_커리큘럼.doc');
							
insert into LECTURE values (lecture_seq.nextval, '자바 기반 웹&앱 개발자 양성과정','2019-08-01','2019-10-31',
							'302호', 'JAVA에 대해 기초부터 학습','자바_기반_웹&앱_개발자_양성과정_커리큘럼.doc');	
							
insert into LECTURE values (lecture_seq.nextval, '스마트 웹&앱 콘텐츠 제작 과정','2019-09-01','2019-11-30',
							'303호', '스마트기기에 적합한 문화콘텐츠 제작','스마트_웹&앱_콘텐츠_제작_과정_커리큘럼.doc');
							
							

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




