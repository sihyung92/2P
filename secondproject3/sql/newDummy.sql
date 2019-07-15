/* Drop Tables */

DROP TABLE attendance CASCADE CONSTRAINTS;
DROP TABLE attendanceKind CASCADE CONSTRAINTS;
DROP TABLE bbsKind CASCADE CONSTRAINTS;
DROP TABLE career CASCADE CONSTRAINTS;
DROP TABLE userCert CASCADE CONSTRAINTS;
DROP TABLE certification CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE lmsBbs CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE userData CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE userKind CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE attendanceKind_seq;
DROP SEQUENCE attendance_seq;
DROP SEQUENCE bbsKind_seq;
DROP SEQUENCE career_seq;
DROP SEQUENCE certification_seq;
DROP SEQUENCE lecture_seq;
DROP SEQUENCE lmsBbs_0_seq;
DROP SEQUENCE lmsBbs_1_seq;
DROP SEQUENCE lmsBbs_2_seq;
DROP SEQUENCE lmsBbs_3_seq;
DROP SEQUENCE lmsBbs_4_seq;
DROP SEQUENCE reply_seq;
DROP SEQUENCE schedule_seq;
DROP SEQUENCE score_seq;
DROP SEQUENCE userData_0_seq;
DROP SEQUENCE userData_1_seq;
DROP SEQUENCE userData_2_seq;
DROP SEQUENCE userKind_seq;




/* Create Sequences */

CREATE SEQUENCE attendanceKind_seq;
CREATE SEQUENCE attendance_seq;
CREATE SEQUENCE bbsKind_seq;
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
CREATE SEQUENCE score_seq;
CREATE SEQUENCE userData_0_seq;
CREATE SEQUENCE userData_1_seq;
CREATE SEQUENCE userData_2_seq;
CREATE SEQUENCE userKind_seq;



/* Create Tables */

CREATE TABLE attendance
(
	attendanceNum number NOT NULL,
	day date NOT NULL,
	-- 0정상출석
	-- 1결석
	-- 2지각
	-- 3조퇴
	-- 
	type number NOT NULL,
	lecNum number NOT NULL,
	startTime date,
	endTime date,
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	userKind number NOT NULL,
	PRIMARY KEY (attendanceNum)
);

CREATE TABLE attendanceKind
(
	-- 0 정상출석
	-- 1 결석
	-- 2 지각
	-- 3 조퇴
	codeNum number NOT NULL,
	num number,
	PRIMARY KEY (codeNum)
);


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
	userKind number NOT NULL,
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
	lecNum number NOT NULL,
	title varchar2(100),
	content varchar2(2000),
	id varchar2(50),
	nalja date,
	views number,
	attach varchar2(1000),
	PRIMARY KEY (listNum, bbsNum, lecNum)
);


CREATE TABLE reply
(
	num number NOT NULL,
	content varchar2(2000),
	nalja date,
	id varchar2(50),
	listNum number NOT NULL,
	-- 00 공지사항
	-- 01 수업자료
	-- 02 과제
	-- 03 질문_질의
	bbsNum number NOT NULL,
	lecNum number NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE schedule
(
	num number NOT NULL,
	startdate date,
	enddate date,
	category varchar2(20),
	title varchar2(100),
	content varchar2(2000),
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	userKind number NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE score
(
	scoreNum number NOT NULL,
	lecNum number NOT NULL,
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	userKind number NOT NULL,
	firstTest varchar2(10),
	secondTest varchar2(10),
	thirdTest varchar2(10),
	PRIMARY KEY (scoreNum)
);


CREATE TABLE userCert
(
	codeNum number NOT NULL,
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	userKind number NOT NULL
);


CREATE TABLE userData
(
	userNum number NOT NULL,
	-- 00 학생
	-- 01 강사
	-- 02 관리자
	userKind number NOT NULL,
	lecNum number,
	id varchar2(50) NOT NULL,
	pw varchar2(50) NOT NULL,
	name varchar2(30) NOT NULL,
	birth date,
	phone number,
	email varchar2(100),
	address varchar2(100),
	major varchar2(50),
	PRIMARY KEY (userNum, userKind)
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
	REFERENCES certification (codeNum) on delete cascade
;


ALTER TABLE attendance
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num) on delete set null
;


ALTER TABLE lmsBbs
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num) on  delete cascade
;


ALTER TABLE score
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num) on delete cascade
;


ALTER TABLE userData
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num) on delete set null
;


ALTER TABLE reply
	ADD FOREIGN KEY (listNum, bbsNum, lecNum)
	REFERENCES lmsBbs (listNum, bbsNum, lecNum) on delete cascade
;


ALTER TABLE attendance
	ADD FOREIGN KEY (userNum, userKind)
	REFERENCES userData (userNum, userKind) on delete set null
;


ALTER TABLE career
	ADD FOREIGN KEY (userNum, userKind)
	REFERENCES userData (userNum, userKind) on delete cascade
;


ALTER TABLE schedule
	ADD FOREIGN KEY (userNum, userKind)
	REFERENCES userData (userNum, userKind) on delete set null
;


ALTER TABLE score
	ADD FOREIGN KEY (userNum, userKind)
	REFERENCES userData (userNum, userKind) on delete cascade
;


ALTER TABLE userCert
	ADD FOREIGN KEY (userNum, userKind)
	REFERENCES userData (userNum, userKind) on delete cascade
;

/*dummy*/

insert into userKind values (00,'학생');
insert into userKind values (01,'강사');
insert into userKind values (02,'관리자');

insert into LECTURE values (lecture_seq.nextval, '응용 SW 엔지니어링 양성과정','2019-07-01','2019-09-30',
							'301호', '컴퓨터 프로그래밍 기술','응용_SW_엔지니어링_양성과정_커리큘럼.doc','김영조');
					
insert into LECTURE values (lecture_seq.nextval, '자바 기반 웹앱 개발자 양성과정','2019-08-01','2019-10-31',
							'302호', 'JAVA에 대해 기초부터 학습','자바_기반_웹앱_개발자_양성과정_커리큘럼.doc','김영조');	
							
insert into LECTURE values (lecture_seq.nextval, '스마트 웹앱 콘텐츠 제작 과정','2019-09-01','2019-11-30',
							'303호', '스마트기기에 적합한 문화콘텐츠 제작','스마트_웹앱_콘텐츠_제작_과정_커리큘럼.doc','김영조');

					
							
/*회원정보*/

/*학생*/
/*1반*/
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu01','stu01','학생01','1999-09-19',01012345678,'stu01@bit.com','경기도 안양시','회계');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu02','stu02','학생02','1999-09-19',01012345678,'stu02@bit.com','경기도 안양시','영문');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu03','stu03','학생03','1999-09-19',01012345678,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu04','stu04','학생04','1999-09-19',01012345678,'stu04@bit.com','경기도 안양시','컴퓨터');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu05','stu05','학생05','1999-09-19',01012345678,'stu05@bit.com','경기도 안양시','경영');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu06','stu06','학생06','1999-09-19',01012345678,'stu06@bit.com','경기도 안양시','회계');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu07','stu07','학생07','1999-09-19',01012345678,'stu07@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu08','stu08','학생08','1999-09-19',01012345678,'stu08@bit.com','경기도 안양시','전기');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu09','stu09','학생09','1999-09-19',01012345678,'stu09@bit.com','경기도 안양시','철학');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu10','stu10','학생10','1999-09-19',01012345678,'stu10@bit.com','경기도 안양시','국문');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu11','stu11','학생11','1999-09-19',01012345678,'stu11@bit.com','경기도 안양시','피아노');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu12','stu12','학생12','1999-09-19',01012345678,'stu12@bit.com','경기도 안양시','불어');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu13','stu13','학생13','1999-09-19',01012345678,'stu13@bit.com','경기도 안양시','체육');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu14','stu14','학생14','1999-09-19',01012345678,'stu14@bit.com','경기도 안양시','노어');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu15','stu15','학생15','1999-09-19',01012345678,'stu15@bit.com','경기도 안양시','물리');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu16','stu16','학생16','1999-09-19',01012345678,'stu16@bit.com','경기도 안양시','신소재공학');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu17','stu17','학생17','1999-09-19',01012345678,'stu17@bit.com','경기도 안양시','일어');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu18','stu18','학생18','1999-09-19',01012345678,'stu18@bit.com','경기도 안양시','로봇');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu19','stu19','학생19','1999-09-19',01012345678,'stu19@bit.com','경기도 안양시','에너지공학');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu20','stu20','학생20','1999-09-19',01012345678,'stu20@bit.com','경기도 안양시','소방방재');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu21','stu21','학생21','1999-09-19',01012345678,'stu21@bit.com','경기도 안양시','건축도시환경');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu22','stu22','학생22','1999-09-19',01012345678,'stu22@bit.com','경기도 안양시','건축도시환경');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu23','stu23','학생23','1999-09-19',01012345678,'stu22@bit.com','경기도 안양시','건축도시환경');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu24','stu24','학생24','1999-09-19',01012345678,'stu22@bit.com','경기도 안양시','건축도시환경');
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu25','stu25','학생25','1999-09-19',01012345678,'stu22@bit.com','경기도 안양시','건축도시환경');


/*2반*/
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu26','stu26','학생26','1998-08-18',01023456789,'stu02@bit.com','경기도 안양시','영문');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu27','stu27','학생27','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu28','stu28','학생28','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu29','stu29','학생29','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu30','stu30','학생30','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu31','stu31','학생31','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu32','stu32','학생32','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu33','stu33','학생33','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu34','stu34','학생34','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu35','stu35','학생35','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu36','stu36','학생36','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu37','stu37','학생37','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu38','stu38','학생38','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu39','stu39','학생39','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu40','stu40','학생40','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu41','stu41','학생41','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu42','stu42','학생42','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu43','stu43','학생43','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu44','stu44','학생44','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu45','stu45','학생45','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu46','stu46','학생46','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');



/*3반*/
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu47','stu47','학생47','1996-06-16',01045678912,'stu04@bit.com','경기도 안양시','컴퓨터');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu48','stu48','학생48','1995-05-15',01056789123,'stu05@bit.com','경기도 안양시','경영');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu49','stu49','학생49','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu50','stu50','학생50','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu51','stu51','학생51','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu52','stu52','학생52','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu53','stu53','학생53','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu54','stu54','학생54','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu55','stu55','학생55','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu56','stu56','학생56','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu56','stu57','학생57','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu56','stu58','학생58','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu56','stu59','학생59','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');


/*강사*/
insert into userData values (userData_1_seq.nextval, 1, 1, 'tea01','tea01','강사01','1985-05-15',01012345678,'tea01@bit.com','경기도 안양시','건축');
insert into userData values (userData_1_seq.nextval, 1, 2, 'tea02','tea02','강사02','1985-06-16',01023456789,'tea02@bit.com','경기도 안양시','디지털기계');
insert into userData values (userData_1_seq.nextval, 1, 3, 'tea03','tea03','강사03','1985-07-17',01023456788,'tea03@bit.com','경기도 안양시','역사교육');


/*관리자*/
insert into userData values (userData_2_seq.nextval, 2, '', 'adm01','adm01','관리자01','1975-05-15',01012345678,'adm01@bit.com','경기도 안양시','');
insert into userData values (userData_2_seq.nextval, 2, '', 'adm02','adm02','관리자02','1965-05-15',01011111111,'adm02@bit.com','경기도','');


/*자격증*/
insert into certification values (certification_seq.nextval,'정보처리기사');
insert into certification values (certification_seq.nextval,'정보관리기능사');
insert into certification values (certification_seq.nextval,'멀티미디어콘텐츠제작전문가');

/*보유회원*/
insert into userCert values(1,1,1);
insert into userCert values(1,2,1);
insert into userCert values(1,3,1);
insert into userCert values(2,2,1);
insert into userCert values(3,3,1);

/*게시판분류번호*/
insert into bbsKind values (00,'공지사항');
insert into bbsKind values (01,'수업자료');
insert into bbsKind values (02,'과제');
insert into bbsKind values (03,'질문');


/*강의넘버 1 sw엔지니어링 강의실 게시판*/
/*공지사항*/

insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'공지사항','강의 공지사항 게시판입니다.',
		'adm01','2019-07-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'수업안내','welcome1',
		'adm01','2019-07-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'교재안내','welcome2',
		'adm01','2019-07-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'결석안내','welcome3',
		'adm02','2019-07-04',44,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'무더운 여름입니다','welcome4',
		'adm01','2019-07-05',55,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'만족도 조사 안내','welcome5',
		'adm02','2019-07-07',66'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,1,'7월 17일은 휴일입니다.','welcome6',
		'adm02','2019-07-10',77,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'자바개요','for class',
		'tea01','2019-07-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'언어의 기본구조','for class2',
		'tea01','2019-07-01',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'자료형','for class3',
		'tea01','2019-07-01',33,'3.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'연산자','for class4',
		'tea01','2019-07-02',44,'4.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,1,'제어문','for class5',
		'tea01','2019-07-02',49,'5.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'hello, world!','콘솔창에 hello, world를 출력해보세요.',
		'tea01','2019-07-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'자료형','다음 첨부된 문서를 참고하여 형변환 및 연산을 완료하시오',
		'tea01','2019-07-03',22,'Data Type.txt');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,1,'반복문 응용','세자리 정수를 입력 받아 각 자리의 수를 따로 출력하시오.',
		'tea01','2019-07-07',33,'resources.txt');

/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'for문 질문이요','please help save me',
		'stu01','2019-07-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'while일 경우 다른 점에서','help me',
		'stu12','2019-07-03',22,'ex09.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'코드가 실행이 안돼요ㅠㅠ','help me',
		'stu15','2019-07-03',33,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,1,'배열에서 에러가 납니다.','help me',
		'stu06','2019-07-07',33,'ex10.java');
		
/*강의넘버 2 자바*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'공지사항','강의 공지사항 게시판입니다.',
		'adm01','2019-08-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'수업안내','welcome1',
		'adm01','2019-08-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'교재안내','welcome2',
		'adm01','2019-08-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'결석안내','welcome3',
		'adm02','2019-08-04',44,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'안내사항','welcome4',
		'adm01','2019-08-05',55,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'만족도 조사 안내','welcome5',
		'adm02','2019-08-07',66'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,2,'8월 17일은 휴일입니다.','welcome6',
		'adm02','2019-08-10',77,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'자바개요','for class',
		'tea02','2019-08-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'언어의 기본구조','for class2',
		'tea02','2019-08-01',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'자료형','for class3',
		'tea02','2019-08-01',33,'3.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'연산자','for class4',
		'tea02','2019-08-02',44,'4.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,2,'제어문','for class5',
		'tea02','2019-08-02',49,'5.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'hello, world!','콘솔창에 hello, world를 출력해보세요.',
		'tea02','2019-08-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'반복문 응용','세자리 정수를 입력 받아 각 자리의 수를 따로 출력하시오.',
		'tea02','2019-08-03',33,'resources.txt');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,2,'자료형','다음 첨부된 문서를 참고하여 형변환 및 연산을 완료하시오',
		'tea02','2019-08-07',22,'Data Type.txt');


/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'for문 질문이요','please help save me',
		'stu27','2019-08-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'while일 경우 다른 점에서','help me',
		'stu30','2019-08-03',22,'ex09.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'코드가 실행이 안돼요ㅠㅠ','help me',
		'stu33','2019-08-03',33,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,2,'배열에서 에러가 납니다.','help me',
		'stu34','2019-08-07',33,'ex10.java');
		

/*강의넘버 3 웹앱*/
/*공지사항*/
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'공지사항','강의 공지사항 게시판입니다.',
		'adm01','2019-09-01',11,'curriculum.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'수업안내','welcome1',
		'adm01','2019-09-02',22,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'교재안내','welcome2',
		'adm01','2019-09-03',33,'information.doc');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'결석안내','welcome3',
		'adm02','2019-09-04',44,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'무더운 여름입니다','welcome4',
		'adm01','2019-09-05',55,'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'만족도 조사 안내','welcome5',
		'adm02','2019-09-07',66'');
insert into lmsBbs values (lmsBbs_0_seq.nextval,00,3,'9월 17일은 휴일입니다.','welcome6',
		'adm02','2019-09-10',77,'');

/*수업자료*/
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'자바개요','for class',
		'tea03','2019-09-01',11,'1.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'언어의 기본구조','for class2',
		'tea03','2019-09-01',22,'2.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'자료형','for class3',
		'tea03','2019-09-01',33,'3.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'연산자','for class4',
		'tea03','2019-09-02',44,'4.ppt');
insert into lmsBbs values (lmsBbs_1_seq.nextval,01,3,'제어문','for class5',
		'tea03','2019-09-02',49,'5.ppt');

/*과제*/
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'hello, world!','콘솔창에 hello, world를 출력해보세요.',
		'tea03','2019-09-01',11,'');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'반복문 응용','세자리 정수를 입력 받아 각 자리의 수를 따로 출력하시오.',
		'tea03','2019-09-03',33,'resources.txt');
insert into lmsBbs values (lmsBbs_2_seq.nextval,02,3,'자료형','다음 첨부된 문서를 참고하여 형변환 및 연산을 완료하시오',
		'tea03','2019-09-07',22,'Data Type.txt');


/*질문*/
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'for문 질문이요','please help save me',
		'stu47','2019-09-01',11,'TT.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'while일 경우 다른 점에서','help me',
		'stu55','2019-09-03',22,'ex09.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'코드가 실행이 안돼요ㅠㅠ','help me',
		'stu51','2019-09-03',33,'ex03.java');
insert into lmsBbs values (lmsBbs_3_seq.nextval,03,3,'배열에서 에러가 납니다.','help me',
		'stu52','2019-09-07',33,'ex10.java');

