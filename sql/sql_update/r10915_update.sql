CREATE TABLE Consultant(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
employeeUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Consultant PRIMARY KEY (uuid)
)
;

ALTER TABLE Consultant ADD CONSTRAINT FK_Consultant_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;



ALTER TABLE Student 
ADD COLUMN consultantUuid VARCHAR(32) NULL DEFAULT NULL AFTER ifUsing;

ALTER TABLE Student ADD CONSTRAINT FK_Student_consultantUuid FOREIGN KEY (consultantUuid) REFERENCES Consultant(uuid);

insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801040', 'manage_consultants', '管理咨询师', '11000000010030002000000000800000', '05', '/pages/content/consult/manage/consultant/manage_consultants.html', 'content');

insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801050', 'my_dashboard', '我的工作', '11000000010030002000000000800000', '00', '/pages/content/consult/manage/consultant/dashboard.html', 'content');