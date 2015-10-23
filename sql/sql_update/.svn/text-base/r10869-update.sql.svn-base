DROP TABLE IF EXISTS EmploymentStatus
;

DROP TABLE IF EXISTS MarriageState
;

DROP TABLE IF EXISTS WechatNotificiationMessage
;

DROP TABLE IF EXISTS ArrangeClassTime
;

DROP TABLE IF EXISTS TimePositionTeacherInfo
;

DROP TABLE IF EXISTS ServiceConfiguration
;

DROP TABLE IF EXISTS EducationExpInfo
;

DROP TABLE IF EXISTS DefaultOption
;

DROP TABLE IF EXISTS ClassState
;

DROP TABLE IF EXISTS ArrangeClassTimeInfo
;

DROP TABLE IF EXISTS ArrangeClass
;

DROP TABLE IF EXISTS Student
;

CREATE TABLE EmploymentStatus(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_EmploymentStatus PRIMARY KEY (uuid)
)
;

CREATE TABLE MarriageState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_MarriageState PRIMARY KEY (uuid)
)
;

ALTER TABLE Person ADD marriageUuid VARCHAR(32) NULL AFTER email
;

ALTER TABLE Person ADD realAddress VARCHAR(30) NULL AFTER marriageUuid
;

ALTER TABLE Person ADD qq VARCHAR(20) NULL AFTER realAddress
;

ALTER TABLE Person ADD parentName VARCHAR(30) NULL AFTER qq
;

ALTER TABLE Person ADD parentPhone VARCHAR(30) NULL AFTER parentName
;

ALTER TABLE Person ADD specialExpertise text NULL AFTER parentPhone
;

ALTER TABLE Person ADD foreignLanguageAndQualification text NULL AFTER specialExpertise
;

ALTER TABLE Person ADD estAge INT NULL AFTER ifUsing
;

ALTER TABLE Person ADD employmentStatusUuid VARCHAR(32) NULL AFTER estAge
;

ALTER TABLE Person ADD employer VARCHAR(60) NULL AFTER employmentStatusUuid
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_marriageUuid FOREIGN KEY (marriageUuid) REFERENCES MarriageState(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_employmentStatusUuid FOREIGN KEY (employmentStatusUuid) REFERENCES EmploymentStatus(uuid)
;

CREATE TABLE WechatNotificiationMessage(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
subject VARCHAR(50) NULL,
receiverOpenId VARCHAR(50) NULL,
wechatMsgId VARCHAR(50) NULL,
status VARCHAR(50) NULL,
content text NULL,
create_at DATETIME NULL,
update_at DATETIME NULL,
ifUsing CHAR(1) NULL,
ifShow CHAR(1) NULL
, CONSTRAINT PK_WechatNotificiationMessage PRIMARY KEY (uuid)
)
;

CREATE TABLE ArrangeClassTime(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
attendClsTP VARCHAR(6) NULL,
attendClsFreqTP VARCHAR(20) NULL,
attendClsFreqBWK VARCHAR(2) NULL,
attendClsFreqBMon VARCHAR(2) NULL,
attendClsOnMon VARCHAR(2) NULL,
attendClsOnTues VARCHAR(2) NULL,
attendClsOnWeb VARCHAR(2) NULL,
attendClsOnThurs VARCHAR(2) NULL,
attendClsOnFri VARCHAR(2) NULL,
attendClsOnSat VARCHAR(2) NULL,
attendClsOnSun VARCHAR(2) NULL,
clsBeginDate DATETIME NULL,
clsEndDateTP VARCHAR(20) NULL,
clsEndDate DATETIME NULL,
clsEndTimes VARCHAR(5) NULL,
clsStartTimeH VARCHAR(3) NULL,
clsStartTimeM VARCHAR(3) NULL,
clsFinishTimeH VARCHAR(3) NULL,
clsFinishTimeM VARCHAR(3) NULL,
description VARCHAR(100) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ArrangeClassTime PRIMARY KEY (uuid)
)
;

CREATE TABLE TimePositionTeacherInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
arrangeClsTimeUuid VARCHAR(32) NULL,
arrangeRmUuid VARCHAR(32) NULL,
arrangeClsTeacherUuid VARCHAR(32) NULL
, CONSTRAINT PK_TimePositionTeacherInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE TimePositionTeacherInfo ADD CONSTRAINT FK_TimePositionTeacherInfo_arrangeClsTimeUuid FOREIGN KEY (arrangeClsTimeUuid) REFERENCES ArrangeClassTime(uuid)
;

ALTER TABLE TimePositionTeacherInfo ADD CONSTRAINT FK_TimePositionTeacherInfo_arrangeRmUuid FOREIGN KEY (arrangeRmUuid) REFERENCES Room(uuid)
;

ALTER TABLE TimePositionTeacherInfo ADD CONSTRAINT FK_TimePositionTeacherInfo_arrangeClsTeacherUuid FOREIGN KEY (arrangeClsTeacherUuid) REFERENCES Teacher(uuid)
;

CREATE TABLE Student(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
personUuid VARCHAR(32) NULL,
studentID VARCHAR(20) NULL,
note VARCHAR(200) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Student PRIMARY KEY (uuid)
)
;

ALTER TABLE Student ADD CONSTRAINT FK_Student_personUuid FOREIGN KEY (personUuid) REFERENCES Person(uuid)
;

CREATE TABLE ServiceConfiguration(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
entity VARCHAR(50) NULL,
attribution VARCHAR(50) NULL,
content text NULL,
create_at DATETIME NULL,
update_at DATETIME NULL,
ifUsing CHAR(1) NULL,
ifShow CHAR(1) NULL
, CONSTRAINT PK_ServiceConfiguration PRIMARY KEY (uuid)
)
;

CREATE TABLE EducationExpInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
school VARCHAR(50) NULL,
degree VARCHAR(50) NULL,
beginDate DATETIME NULL,
endDate DATETIME NULL
, CONSTRAINT PK_EducationExpInfo PRIMARY KEY (uuid)
)
;

CREATE TABLE DefaultOption(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
entity VARCHAR(200) NULL,
attribute text NULL,
description text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_DefaultOption PRIMARY KEY (uuid)
)
;

CREATE TABLE ClassState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ClassState PRIMARY KEY (uuid)
)
;

CREATE TABLE ArrangeClassTimeInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
arrangeClsDate DATETIME NULL
, CONSTRAINT PK_ArrangeClassTimeInfo PRIMARY KEY (uuid)
)
;

CREATE TABLE ArrangeClass(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
clsNo VARCHAR(20) NULL,
courseUuid VARCHAR(32) NULL,
clsTypeUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
actualHour VARCHAR(10) NULL,
actualCost VARCHAR(10) NULL,
courseCheckStateUuid VARCHAR(32) NULL,
classStateUuid VARCHAR(32) NULL,
notes VARCHAR(200) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ArrangeClass PRIMARY KEY (uuid)
)
;

ALTER TABLE ArrangeClass ADD CONSTRAINT FK_ArrangeClass_courseUuid FOREIGN KEY (courseUuid) REFERENCES Course(uuid)
;

ALTER TABLE ArrangeClass ADD CONSTRAINT FK_ArrangeClass_clsTypeUuid FOREIGN KEY (clsTypeUuid) REFERENCES ClassManagement(uuid)
;

ALTER TABLE ArrangeClass ADD CONSTRAINT FK_ArrangeClass_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE ArrangeClass ADD CONSTRAINT FK_ArrangeClass_courseCheckStateUuid FOREIGN KEY (courseCheckStateUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE ArrangeClass ADD CONSTRAINT FK_ArrangeClass_classStateUuid FOREIGN KEY (classStateUuid) REFERENCES ClassState(uuid)
;

insert into Education (uuid, ifHasChild, description, ifUsing)
values ('10000000010050001001000000000060', 0, '初中', 1);
insert into Education (uuid, ifHasChild, description, ifUsing)
values ('10000000010050001001000000000070', 0, '小学', 1);
insert into Education (uuid, ifHasChild, description, ifUsing)
values ('10000000010050001001000000000080', 0, '其他', 1);

# ClassState
insert into ClassState (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('20000000090010001001000000000010', 0, '已经结课', null, 1);
insert into ClassState (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('20000000090010001001000000000020', 0, '正在上课', null, 1);
insert into ClassState (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('20000000090010001001000000000030', 0, '即将开课', null, 1);

# MarriageState
insert into MarriageState (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('10000000010190001001000000000010', 0, '已婚', null, 1);
insert into MarriageState (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('10000000010190001001000000000020', 0, '未婚', null, 1);

Update Menu Set description = '招生咨询' where uuid = '11000000010030002000000000800000'
;

insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000900000', 'class_manage', '班级管理', null, '09', null, 'content');

Alter table JobAuthority drop constraint FK_JobAuthority_menuUuid
;

Delete from Menu where uuid = '11000000010030002000000000701010'
;

Delete from Menu where uuid = '11000000010030002000000000701020'
;

Delete from Menu where uuid = '11000000010030002000000000702010'
;

Delete from Menu where uuid = '11000000010030002000000000702020'
;

Update Menu Set uuid = '11000000010030002000000000701020' where uuid = '11000000010030002000000000701000'
;

Delete from Menu where uuid = '11000000010030002000000000801000'
;

insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801000', 'student_consult', '学生咨询', '11000000010030002000000000800000', '01', '/pages/content/consult/manage/communication/consult_student.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801010', 'consult_manage', '基表设置', '11000000010030002000000000800000', '02', '/pages/content/consult/manage/consult/manage/default_options.html', 'content');

insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000901000', 'query_class', '查找班级', '11000000010030002000000000900000', '01', '/pages/content/class/manage/query/class/query_class.html', 'content');

insert into ServiceConfiguration (uuid, entity, attribution, content, ifUsing,ifShow)
values ('11000000080010001000000000000010', 'Wechat', 'accessTokenStr', null, 1,1);

Delete from JobAuthority where menuUuid = '11000000010030002000000000701010'
;

Delete from JobAuthority where menuUuid = '11000000010030002000000000702010'
;

Delete from JobAuthority where menuUuid = '11000000010030002000000000702020'
;

Delete from JobAuthority where menuUuid = '11000000010030002000000000801000'
;

Update JobAuthority Set menuUuid = '11000000010030002000000000701020' where menuUuid = '11000000010030002000000000701000'
;

ALTER TABLE JobAuthority ADD CONSTRAINT FK_JobAuthority_menuUuid FOREIGN KEY (menuUuid) REFERENCES Menu(uuid)
;