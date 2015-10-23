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

Alter table Person drop FOREIGN KEY FK_Person_marriageUuid
;

Alter table Person drop FOREIGN KEY FK_Person_employmentStatusUuid
;

Alter table Person drop marriageUuid
;

Alter table Person drop realAddress
;

Alter table Person drop qq
;

Alter table Person drop parentName
;

Alter table Person drop parentPhone
;

Alter table Person drop specialExpertise
;

Alter table Person drop foreignLanguageAndQualification
;

Alter table Person drop estAge
;

Alter table Person drop employmentStatusUuid
;

Alter table Person drop employer
;

Update Menu Set description = '课程咨询报名管理' where uuid = '11000000010030002000000000800000'
;

Delete from Menu where uuid = '11000000010030002000000000900000'
;

Update Menu Set uuid = '11000000010030002000000000701000' where uuid = '11000000010030002000000000701020'
;

Delete from Menu where uuid = '11000000010030002000000000801000'
;

insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000701010', 'ungraduate_info', '在校生信息', '11000000010030002000000000701000', '01', '/pages/content/student/manage/student/info/ungraduate/info/query_ungraduate_info.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000701020', 'graduate_info', '毕业生信息', '11000000010030002000000000701000', '02', '/pages/content/student/manage/student/info/graduate/info/query_graduate_info.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000702010', 'pause_class', '休学', '11000000010030002000000000702000', '01', '/pages/content/student/manage/student/change/pause/class/query_pause_class.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000702020', 'stop_class', '停学', '11000000010030002000000000702000', '02', '/pages/content/student/manage/student/change/stop/class/query_stop_class.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801000', 'consult_manage', '课程咨询报名管理', '11000000010030002000000000800000', '01', '/pages/content/consult/manage/consult/manage/query_consult_manage.html', 'content');



Delete from Menu where uuid = '11000000010030002000000000801010'
;

Delete from Menu where uuid = '11000000010030002000000000901000'
;

Delete from ServiceConfiguration where uuid = '11000000080010001000000000000010'
;