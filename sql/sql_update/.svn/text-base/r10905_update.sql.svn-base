# Menu
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801020', 'my_communications', '我的咨询', '11000000010030002000000000800000', '03', '/pages/content/consult/manage/communication/my_communications.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801030', 'my_todo_follow_ups', '我的待回访', '11000000010030002000000000800000', '04', '/pages/content/consult/manage/communication/my_todo_follow_ups.html', 'content');

# DefaultOption
insert into DefaultOption (uuid, entity, attribute, description, ifUsing)
values ('22000000020030001000000000100000', 'consult', 'communication_type', '学生咨询', 0);
insert into DefaultOption (uuid, entity, attribute, description, ifUsing)
values ('22000000020030001000000000200000', 'consult', 'communication_type', '回访记录', 0);


# Communication

DROP TABLE IF EXISTS Communication
;
DROP TABLE IF EXISTS CommunicationFollowUp
;
DROP TABLE IF EXISTS Form
;

CREATE TABLE Communication(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
customerUuid VARCHAR(32) NULL,
employeeUuid VARCHAR(32) NULL,
typeUuid VARCHAR(32) NULL,
status VARCHAR(100) NULL,
startAt DATETIME NULL,
completeAt DATETIME NULL,
customerDecision VARCHAR(200) NULL
, CONSTRAINT PK_Communication PRIMARY KEY (uuid)
)
;

ALTER TABLE Communication ADD CONSTRAINT FK_Communication_customerUuid FOREIGN KEY (customerUuid) REFERENCES Person(uuid)
;

ALTER TABLE Communication ADD CONSTRAINT FK_Communication_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Communication ADD CONSTRAINT FK_Communication_typeUuid FOREIGN KEY (typeUuid) REFERENCES DefaultOption(uuid)
;


CREATE TABLE CommunicationFollowUp(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
communicationUuid VARCHAR(32) NULL,
scheduledDateTime DATETIME NULL,
ownerUuid VARCHAR(32) NULL,
type VARCHAR(200) NULL,
status VARCHAR(100) NULL,
note text NULL
, CONSTRAINT PK_CommunicationFollowUp PRIMARY KEY (uuid)
)
;

ALTER TABLE CommunicationFollowUp ADD CONSTRAINT FK_CommunicationFollowUp_communicationUuid FOREIGN KEY (communicationUuid) REFERENCES Communication(uuid)
;

ALTER TABLE CommunicationFollowUp ADD CONSTRAINT FK_CommunicationFollowUp_ownerUuid FOREIGN KEY (ownerUuid) REFERENCES Employee(uuid)
;

CREATE TABLE Form(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
data text NULL
, CONSTRAINT PK_Form PRIMARY KEY (uuid)
)
;
