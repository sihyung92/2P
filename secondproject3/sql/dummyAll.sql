insert into userKind values (0,'학생');
insert into userKind values (1,'강사');
insert into userKind values (2,'관리자');


insert into LECTURE values (lecture_seq.nextval, '응용 SW 엔지니어링 양성과정','2019-07-01','2019-09-30',
							'301호', '컴퓨터 프로그래밍 기술','응용_SW_엔지니어링_양성과정_커리큘럼.doc','김영조');
insert into LECTURE values (lecture_seq.nextval, '자바 기반 웹앱 개발자 양성과정','2019-08-01','2019-10-31',
							'302호', 'JAVA에 대해 기초부터 학습','자바_기반_웹앱_개발자_양성과정_커리큘럼.doc','김영조');	
insert into LECTURE values (lecture_seq.nextval, '스마트 웹앱 콘텐츠 제작 과정','2019-09-01','2019-11-30',
							'303호', '스마트기기에 적합한 문화콘텐츠 제작','스마트_웹앱_콘텐츠_제작_과정_커리큘럼.doc','김영조');
							
/*학생*/
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu01','stu01','학생01','1999-09-19',01012345678,'stu01@bit.com','경기도 안양시','회계');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu02','stu02','학생02','1998-08-18',01023456789,'stu02@bit.com','경기도 안양시','영문');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu03','stu03','학생03','1997-07-17',01034567891,'stu03@bit.com','경기도 안양시','순수미술');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu04','stu04','학생04','1996-06-16',01045678912,'stu04@bit.com','경기도 안양시','컴퓨터');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu05','stu05','학생05','1995-05-15',01056789123,'stu05@bit.com','경기도 안양시','경영');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu06','stu06','학생06','1994-04-14',01067891234,'stu06@bit.com','경기도 안양시','기계설계');

<<<<<<< HEAD
/*
ȸ������
CREATE TABLE userData
(
	userNum number NOT NULL,
	-- 00 �л�
	-- 01 ����
	-- 02 ������
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

/*�л�*/
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu01','stu01','�л�01','1999-09-19',01012345678,'stu01@bit.com','��⵵ �Ⱦ��','ȸ��');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu02','stu02','�л�02','1998-08-18',01023456789,'stu02@bit.com','��⵵ �Ⱦ��','����');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu03','stu03','�л�03','1997-07-17',01034567891,'stu03@bit.com','��⵵ �Ⱦ��','�����̼�');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu04','stu04','�л�04','1996-06-16',01045678912,'stu04@bit.com','��⵵ �Ⱦ��','��ǻ��');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu05','stu05','�л�05','1995-05-15',01056789123,'stu05@bit.com','��⵵ �Ⱦ��','�濵');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu06','stu06','�л�06','1994-04-14',01067891234,'stu06@bit.com','��⵵ �Ⱦ��','��輳��');
select * from USERDATA;

/*����*/
insert into userData values (userData_1_seq.nextval, 1, 1, 'tea01','tea01','����01','1985-05-15',01012345678,'tea01@bit.com','��⵵ �Ⱦ��','����');
insert into userData values (userData_1_seq.nextval, 1, 2, 'tea02','tea02','����02','1985-06-16',01023456789,'tea02@bit.com','��⵵ �Ⱦ��','�����б��');
insert into userData values (userData_1_seq.nextval, 1, 3, 'tea03','tea03','����03','1985-07-17',01023456788,'tea03@bit.com','��⵵ �Ⱦ��','���米��');
=======
/*강사*/
insert into userData values (userData_1_seq.nextval, 1, 1, 'tea01','tea01','강사01','1985-05-15',01012345678,'tea01@bit.com','경기도 안양시','건축');
insert into userData values (userData_1_seq.nextval, 1, 2, 'tea02','tea02','강사02','1985-06-16',01023456789,'tea02@bit.com','경기도 안양시','디지털기계');
insert into userData values (userData_1_seq.nextval, 1, 3, 'tea03','tea03','강사03','1985-07-17',01023456788,'tea03@bit.com','경기도 안양시','역사교육');
>>>>>>> refs/remotes/origin/master


/*관리자*/
insert into userData values (userData_2_seq.nextval, 2, '', 'adm01','adm01','관리자01','1975-05-15',01012345678,'adm01@bit.com','경기도 안양시','');
insert into userData values (userData_2_seq.nextval, 2, '', 'adm02','adm02','관리자02','1965-05-15',01011111111,'adm02@bit.com','경기도','');


insert into certification values (certification_seq.nextval,'정보처리기사');
insert into certification values (certification_seq.nextval,'정보관리기능사');
insert into certification values (certification_seq.nextval,'멀티미디어콘텐츠제작전문가');


insert into userCert values(1,1,1);
insert into userCert values(1,2,1);
insert into userCert values(1,3,1);

insert into userCert values(2,2,1);
insert into userCert values(3,3,1);
commit;
