insert into userKind values (00,'�л�');
insert into userKind values (01,'����');
insert into userKind values (02,'������');


insert into LECTURE values (lecture_seq.nextval, '���� SW �����Ͼ �缺����','2019-07-01','2019-09-30',
							'301ȣ', '��ǻ�� ���α׷��� ���','����_SW_�����Ͼ_�缺����_Ŀ��ŧ��.doc');
							
insert into LECTURE values (lecture_seq.nextval, '�ڹ� ��� ��&�� ������ �缺����','2019-08-01','2019-10-31',
							'302ȣ', 'JAVA�� ���� ���ʺ��� �н�','�ڹ�_���_��&��_������_�缺����_Ŀ��ŧ��.doc');	
							
insert into LECTURE values (lecture_seq.nextval, '����Ʈ ��&�� ������ ���� ����','2019-09-01','2019-11-30',
							'303ȣ', '����Ʈ��⿡ ������ ��ȭ������ ����','����Ʈ_��&��_������_����_����_Ŀ��ŧ��.doc');
							
							
/*�л�*/
insert into userData values (userData_0_seq.nextval, 0, 1, 'stu01','stu01','�л�01','1999-09-19',01012345678,'stu01@bit.com','��⵵ �Ⱦ��','ȸ��');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu02','stu02','�л�02','1998-08-18',01023456789,'stu02@bit.com','��⵵ �Ⱦ��','����');
insert into userData values (userData_0_seq.nextval, 0, 2, 'stu03','stu03','�л�03','1997-07-17',01034567891,'stu03@bit.com','��⵵ �Ⱦ��','�����̼�');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu04','stu04','�л�04','1996-06-16',01045678912,'stu04@bit.com','��⵵ �Ⱦ��','��ǻ��');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu05','stu05','�л�05','1995-05-15',01056789123,'stu05@bit.com','��⵵ �Ⱦ��','�濵');
insert into userData values (userData_0_seq.nextval, 0, 3, 'stu06','stu06','�л�06','1994-04-14',01067891234,'stu06@bit.com','��⵵ �Ⱦ��','��輳��');

/*����*/
insert into userData values (userData_1_seq.nextval, 1, 1, 'tea01','tea01','����01','1985-05-15',01012345678,'tea01@bit.com','��⵵ �Ⱦ��','����');
insert into userData values (userData_1_seq.nextval, 1, 2, 'tea02','tea02','����02','1985-06-16',01023456789,'tea02@bit.com','��⵵ �Ⱦ��','�����б��');
insert into userData values (userData_1_seq.nextval, 1, 3, 'tea03','tea03','����03','1985-07-17',01023456788,'tea03@bit.com','��⵵ �Ⱦ��','���米��');


/*������*/
insert into userData values (userData_2_seq.nextval, 2, '', 'adm01','adm01','������01','1975-05-15',01012345678,'adm01@bit.com','��⵵ �Ⱦ��','');
insert into userData values (userData_2_seq.nextval, 2, '', 'adm02','adm02','������02','1965-05-15',01011111111,'adm02@bit.com','��⵵','');


insert into certification values (certification_seq.nextval,'����ó�����');
insert into certification values (certification_seq.nextval,'����������ɻ�');
insert into certification values (certification_seq.nextval,'��Ƽ�̵������������������');



insert into userCert values(1,1,1);
insert into userCert values(1,2,1);
insert into userCert values(1,3,1);

insert into userCert values(2,2,1);
insert into userCert values(3,3,1);
