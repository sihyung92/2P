DROP TABLE attendance CASCADE CONSTRAINTS;
DROP TABLE attendanceKind CASCADE CONSTRAINTS;
DROP TABLE bbsKind CASCADE CONSTRAINTS;
DROP TABLE career CASCADE CONSTRAINTS;
DROP TABLE userCert CASCADE CONSTRAINTS;
DROP TABLE certification CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE lms_bbs CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE userData CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE userKind CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE attendance
(
	num number NOT NULL,
	day date NOT NULL,
	-- 0�����⼮
	-- 1�Ἦ
	-- 2����
	-- 3����
	-- 
	type number NOT NULL,
	lecNum number NOT NULL,
	startTime date,
	endTime date,
	userNum number NOT NULL,
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	kind number NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE attendanceKind
(
	-- 0 �����⼮
	-- 1 �Ἦ
	-- 2 ����
	-- 3 ����
	codeNum number NOT NULL,
	num number,
	PRIMARY KEY (codeNum)
);


CREATE TABLE bbsKind
(
	-- 00 ��������
	-- 01 �����ڷ�
	-- 02 ����
	-- 03 ����_����
	codeNum number NOT NULL,
	-- 00 ��������
	-- 01 �����ڷ�
	-- 02 ����
	-- 03 ����_����
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
	-- 00 �л�
	-- 01 ����
	-- 02 ������
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


CREATE TABLE lms_bbs
(
	listNum number NOT NULL,
	-- 00 ��������
	-- 01 �����ڷ�
	-- 02 ����
	-- 03 ����_����
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


CREATE TABLE reply
(
	num number NOT NULL,
	content varchar2(2000),
	nalja date,
	id varchar2(50),
	listNum number NOT NULL,
	-- 00 ��������
	-- 01 �����ڷ�
	-- 02 ����
	-- 03 ����_����
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
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	kind number NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE score
(
	scoreNum number NOT NULL,
	lecNum number NOT NULL,
	userNum number NOT NULL,
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	kind number NOT NULL,
	firstTest varchar2(10),
	secondTest varchar2(10),
	thirdTest varchar2(10),
	PRIMARY KEY (scoreNum)
);


CREATE TABLE userCert
(
	codeNum number NOT NULL,
	userNum number NOT NULL,
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	kind number NOT NULL
);


CREATE TABLE userData
(
	userNum number NOT NULL,
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	kind number NOT NULL,
	lecNum number,
	id varchar2(50) NOT NULL,
	pw number NOT NULL,
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
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	codeNum number NOT NULL,
	-- 00 �л�
	-- 01 ����
	-- 02 ������
	kind varchar2(50),
	PRIMARY KEY (codeNum)
);



/* Create Foreign Keys */

ALTER TABLE userCert
	ADD FOREIGN KEY (codeNum)
	REFERENCES certification (codeNum);


ALTER TABLE attendance
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num);


ALTER TABLE lms_bbs
	ADD FOREIGN KEY (num)
	REFERENCES lecture (num);


ALTER TABLE score
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num);


ALTER TABLE userData
	ADD FOREIGN KEY (lecNum)
	REFERENCES lecture (num);


ALTER TABLE reply
	ADD FOREIGN KEY (listNum, bbsNum, lecNum)
	REFERENCES lms_bbs (listNum, bbsNum, num);


ALTER TABLE attendance
	ADD FOREIGN KEY (userNum, kind)
	REFERENCES userData (userNum, kind);


ALTER TABLE career
	ADD FOREIGN KEY (userNum, kind)
	REFERENCES userData (userNum, kind);


ALTER TABLE schedule
	ADD FOREIGN KEY (userNum, kind)
	REFERENCES userData (userNum, kind);


ALTER TABLE score
	ADD FOREIGN KEY (userNum, kind)
	REFERENCES userData (userNum, kind);


ALTER TABLE userCert
	ADD FOREIGN KEY (userNum, kind)
	REFERENCES userData (userNum, kind);

--dummy
insert into lecture(num,name,startdate,enddate,classroom,content) values(1,'���� SW�����Ͼ �缺����','2019-03-01','2019-08-31','301ȣ','content');
insert into lecture(num,name,startdate,enddate,classroom,content) values(2,'UI/UX�����Ͼ �缺����','2019-04-01','2019-09-30','302ȣ','content');
insert into lecture(num,name,startdate,enddate,classroom,content) values(3,'�ڹٱ�� ��&�� ������ �缺����','2019-04-01','2019-09-30','303ȣ','content');
insert into lecture(num,name,startdate,enddate,classroom,content) values(4,'UI/UX�����Ͼ �缺����','2019-05-01','2019-10-31','304ȣ','content');
insert into lecture(num,name,startdate,enddate,classroom,content) values(5,'���� SW�����Ͼ �缺����','2019-05-01','2019-10-31','305ȣ','content');
insert into lecture(num,name,startdate,enddate,classroom,content) values(6,'�ڹٱ�� ��&�� ������ �缺����','2019-06-01','2019-11-30','306ȣ','content');
commit;






