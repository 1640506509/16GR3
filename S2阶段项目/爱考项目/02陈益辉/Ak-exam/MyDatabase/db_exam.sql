/*
�������ݿ�
*/
create database db_exam;
--ʹ�����ݿ�
use db_exam;
GO

/*
�������ݱ�
*/
--��ʦ��
create table t_teacher(
	tid VARCHAR(20) PRIMARY key,--���
	tname varchar(20) not null,--����
	sex varchar(2) not null,--�Ա�
	birthday VARCHAR(20),--����
	education varchar(20),--ѧ��
	tel varchar(11),--�ֻ�
	post varchar(10) not null,--��λ
	remarks varchar(100)--��ע
);
--ѧ����
create table t_student(
	sid VARCHAR(20) PRIMARY key,--���
	sname varchar(20) not null,--����
	sex varchar(2) not null,--�Ա�
	enterSchool varchar(4) not null,--��ѧ���
	cCode varchar(20) not null,--�����༶
	photo VARCHAR(50),--ͷ��
	birthday varchar(20),--����
	IDCard VARCHAR(18),--���֤��
	pOutlook VARCHAR(10),--������ò
	province VARCHAR(20),--ʡ��
	city VARCHAR(20),--����
	tel VARCHAR(11),--��ϵ�绰
	address VARCHAR(40),--��ͥסַ
	ptel VARCHAR(11),--�ҳ���ϵ�绰
	pRelation VARCHAR(10),--�ҳ���ѧ����ϵ
	hostelBuil VARCHAR(10),--����¥
	hostelNo VARCHAR(10),--�����
	baseInfo VARCHAR(50),--�������
	eduBg VARCHAR(20),--��������
	remarks VARCHAR(20)--��ע
);
--�˻���
create table t_user(
	name VARCHAR(20) PRIMARY key,--�˻���
	pwd VARCHAR(20) not null,--�˻�����
	role int not null--��ɫ��1��ѧ������2����ʦ����4������Ա��
);

--��ӹ���Ա�˻�
insert into t_user values ('admin','123456',4);

--�༶��
create table t_classInfo(
	cCode varchar(20) primary key,	--�༶����
	cName varchar(20) not null,	--�༶����
	major varchar(10) not null,	--����רҵ(SCME\SCCE)
	insId int not null,	--����Ա��teacher�������
	iecId int not null,	--��ʦ��teacher�������
	cDate date not null,	--��������
	g1Num int,	--�༶����
	g2Num int,	--�༶����
	g3Num int,	--�༶����
	cCodeId int DEFAULT 0,	--�༶״̬(0:���ã�1������)
	cRemark varchar(50)		--��ע
);

INSERT INTO t_classInfo VALUES ('16GR3','��������','SCME',101,102,'2016-09-07',36,36,36,1,'��')
INSERT INTO t_classInfo VALUES ('16SP1','ʳƷһ��','SCME',101,102,'2016-09-07',36,36,36,1,'��')
INSERT INTO t_classInfo VALUES ('16GR1','����һ��','SCME',103,104,'2016-09-07',35,35,35,1,'��')


--��Ŀ��
create table t_course(
	csId int primary key identity(1,1),	--��Ŀ���
	csName varchar(20) not null,	--��Ŀ����
	stage varchar(2) not null,	--�׶Σ�G1��G2��G3��
	major varchar(10) not null	--רҵ����(SCME\SCCE)
);

--Java
insert into t_course values ('���������','G1','SCME');
insert into t_course values ('PS','G1','SCME');
insert into t_course values ('SQLServer','G1','SCME');
insert into t_course values ('Java','G1','SCME');
insert into t_course values ('JSP','G2','SCME');
insert into t_course values ('JavaScript','G2','SCME');
insert into t_course values ('Struts2','G2','SCME');
insert into t_course values ('Hibernate','G2','SCME');
insert into t_course values ('Spring','G3','SCME');
insert into t_course values ('MyBatis','G3','SCME');
--ʵʩ����
insert into t_course values ('Liunx','G3','SCCE');
insert into t_course values ('QT','G3','SCCE');
insert into t_course values ('MySQL','G3','SCCE');

--������Ŀ��
create table t_writtenTest(
	qId int primary key identity(1001,1),--��Ŀ���
	qType varchar(10) not null,--��Ŀ���ͣ���ѡ����ѡ��
	qTitle varchar(100) not null,	--��Ŀ����
	optionA varchar(100) not null,	--ѡ��A
	optionB varchar(100) not null,	--ѡ��B
	optionC varchar(100) not null,	--ѡ��C
	optionD varchar(100) not null,	--ѡ��D
	answer varchar(4) DEFAULT '��',	--��
	degree varchar(4) not null,	--���׳̶�
	csId int not null,	--������Ŀ
	chapter varchar(2)--��Ӧ�½�
);

--������Ŀ��
create table t_machineTest(
	qId int primary key identity(1001,1),--��Ŀ���
	qTitle varchar(100) not null,	--��Ŀ����
	degree varchar(4) not null,	--���׳̶�
	csId int not null,	--������Ŀ
	chapter varchar(2)--��Ӧ�½�
);


--�Ծ��
create table t_paper(
	pId int primary key identity(1,1),	--�Ծ���
	pName varchar(20) not null,	--�Ծ�����
	pTime int not null,	--����ʱ��
	pTotalScore int not null,	--�ܷ�
	csId int not null,	--������Ŀ
	qTotal int not null,	--��ѡ��Ŀ��
	qScore int not null,	--ÿ�����
	pType varchar(10) not null,		--���ͣ����ԡ����ԣ�
	pState varchar(10) not null,	--�Ծ��״̬(δ�����������С����Խ���)
);

insert into t_paper values ('�������������01',60,100,1,50,2,'����','δ����');

--�༶-�Ծ��ϵ��
create table paper_class(
	pcId int primary key identity(1,1),	--��ϵ���
	pId int not null,	--�Ծ���
	cCode varchar(20) not null,	--�༶���
	examDate varchar(30) not null,--����ʱ��
	endDate varchar(30) not null--����ʱ��
);
insert into paper_class values (1,'16GR3','2018-03-06 08:00','2018-03-06 09:00');
insert into paper_class values (1,'16GR1','2018-03-06 08:00','2018-03-06 09:00');

--���߿���--�ɼ���ѯ
�û�id,�Ծ�id,�Ծ��������id.�û������,�÷�
create table t_userScores(
usId int primary key identity(1,1),-�û��ɼ�����������
name varchar(20),--�û�����--id
pId int,--�Ծ�id
qids varchar,--�������id����ַ���
answers varchar,--�û��������������ַ���
score int,--�ɼ�
);


