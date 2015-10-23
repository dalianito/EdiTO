DROP TABLE IF EXISTS WorkingStateType
;

DROP TABLE IF EXISTS Job
;

DROP TABLE IF EXISTS Campus
;

DROP TABLE IF EXISTS FileType
;

DROP TABLE IF EXISTS RelatedFile
;

DROP TABLE IF EXISTS Country
;

DROP TABLE IF EXISTS Education
;

DROP TABLE IF EXISTS EmploymentStatus
;

DROP TABLE IF EXISTS Political
;

DROP TABLE IF EXISTS Gender
;

DROP TABLE IF EXISTS Nationality
;

DROP TABLE IF EXISTS MarriageState
;

DROP TABLE IF EXISTS Person
;

DROP TABLE IF EXISTS Department
;

DROP TABLE IF EXISTS Employee
;

DROP TABLE IF EXISTS ReviewState
;

DROP TABLE IF EXISTS WorkRecord
;

DROP TABLE IF EXISTS WorkExperienceInfo
;

DROP TABLE IF EXISTS WechatNotificiationMessage
;

DROP TABLE IF EXISTS User
;

DROP TABLE IF EXISTS Tuition
;

DROP TABLE IF EXISTS TrainingType
;

DROP TABLE IF EXISTS ExaminationState
;

DROP TABLE IF EXISTS TrainingPlan
;

DROP TABLE IF EXISTS Title
;

DROP TABLE IF EXISTS TeacherType
;

DROP TABLE IF EXISTS ServiceState
;

DROP TABLE IF EXISTS Teacher
;

DROP TABLE IF EXISTS ArrangeClassTime
;

DROP TABLE IF EXISTS Room
;

DROP TABLE IF EXISTS TimePositionTeacherInfo
;

DROP TABLE IF EXISTS Supplier
;

DROP TABLE IF EXISTS Consultant
;

DROP TABLE IF EXISTS Student
;

DROP TABLE IF EXISTS ServiceConfiguration
;

DROP TABLE IF EXISTS SelfAssessType
;

DROP TABLE IF EXISTS AssessRes
;

DROP TABLE IF EXISTS SelfAssessExamine
;

DROP TABLE IF EXISTS AssessState
;

DROP TABLE IF EXISTS SelfAssess
;

DROP TABLE IF EXISTS ReturnState
;

DROP TABLE IF EXISTS ResultType
;

DROP TABLE IF EXISTS ApplicationType
;

DROP TABLE IF EXISTS Apply
;

DROP TABLE IF EXISTS Relationship
;

DROP TABLE IF EXISTS ApprovalState
;

DROP TABLE IF EXISTS RegularApproval
;

DROP TABLE IF EXISTS RegularApplication
;

DROP TABLE IF EXISTS RecruitState
;

DROP TABLE IF EXISTS LevelType
;

DROP TABLE IF EXISTS OtherType
;

DROP TABLE IF EXISTS Recruitment
;

DROP TABLE IF EXISTS RecordStatus
;

DROP TABLE IF EXISTS ReceiverInfo
;

DROP TABLE IF EXISTS ReceiptState
;

DROP TABLE IF EXISTS DepartureType
;

DROP TABLE IF EXISTS Quit
;

DROP TABLE IF EXISTS PublicityApplication
;

DROP TABLE IF EXISTS ApplicationMaterialType
;

DROP TABLE IF EXISTS ApplicationMaterialColor
;

DROP TABLE IF EXISTS ProductionUnit
;

DROP TABLE IF EXISTS ApplicationMaterialSize
;

DROP TABLE IF EXISTS ApplicationMaterialTexture
;

DROP TABLE IF EXISTS PropagandaMaterialInfo
;

DROP TABLE IF EXISTS PreTeachingExpInfo
;

DROP TABLE IF EXISTS PreParticipatorInfo
;

DROP TABLE IF EXISTS PosterInfo
;

DROP TABLE IF EXISTS EmployeePerformance
;

DROP TABLE IF EXISTS PerfTeaching
;

DROP TABLE IF EXISTS PerfShortTerm
;

DROP TABLE IF EXISTS PerfSecurityClean
;

DROP TABLE IF EXISTS PerfRecruit
;

DROP TABLE IF EXISTS PerfReception
;

DROP TABLE IF EXISTS PerfPropaganda
;

DROP TABLE IF EXISTS PerfOther
;

DROP TABLE IF EXISTS PerformanceType
;

DROP TABLE IF EXISTS PerfObtain
;

DROP TABLE IF EXISTS PerfMaterial
;

DROP TABLE IF EXISTS PerfLongTerm
;

DROP TABLE IF EXISTS PerfLession
;

DROP TABLE IF EXISTS PerfIncharge
;

DROP TABLE IF EXISTS PerfFinancial
;

DROP TABLE IF EXISTS PerfFacility
;

DROP TABLE IF EXISTS PerfDriver
;

DROP TABLE IF EXISTS PerfChildren
;

DROP TABLE IF EXISTS PerfBehaviour
;

DROP TABLE IF EXISTS PerfAttendance
;

DROP TABLE IF EXISTS PerfAdmin
;

DROP TABLE IF EXISTS ParticipatorInfo
;

DROP TABLE IF EXISTS MaterialType
;

DROP TABLE IF EXISTS Material
;

DROP TABLE IF EXISTS OrderGenerate
;

DROP TABLE IF EXISTS OfficeApplicationInfo
;

DROP TABLE IF EXISTS OfficeApplication
;

DROP TABLE IF EXISTS Mistake
;

DROP TABLE IF EXISTS Menu
;

DROP TABLE IF EXISTS MaterialStorage
;

DROP TABLE IF EXISTS MaterialScrap
;

DROP TABLE IF EXISTS MaterialInfo
;

DROP TABLE IF EXISTS MaterialImport
;

DROP TABLE IF EXISTS MaterialExport
;

DROP TABLE IF EXISTS MaterialAllocate
;

DROP TABLE IF EXISTS LeaveType
;

DROP TABLE IF EXISTS LeaveApplication
;

DROP TABLE IF EXISTS JoinState
;

DROP TABLE IF EXISTS JobPerfType
;

DROP TABLE IF EXISTS JobAuthority
;

DROP TABLE IF EXISTS JdoVirtual
;

DROP TABLE IF EXISTS InterviewRecord
;

DROP TABLE IF EXISTS InternetPublicity
;

DROP TABLE IF EXISTS Form
;

DROP TABLE IF EXISTS EnrollmentState
;

DROP TABLE IF EXISTS EmployeePerfType
;

DROP TABLE IF EXISTS EducationExpInfo
;

DROP TABLE IF EXISTS EducateInfo
;

DROP TABLE IF EXISTS DefaultOption
;

DROP TABLE IF EXISTS CurTeachingExpInfo
;

DROP TABLE IF EXISTS CourseCategoryType
;

DROP TABLE IF EXISTS Course
;

DROP TABLE IF EXISTS ContractMould
;

DROP TABLE IF EXISTS Contract
;

DROP TABLE IF EXISTS Communication
;

DROP TABLE IF EXISTS CommunicationFollowUp
;

DROP TABLE IF EXISTS ClassState
;

DROP TABLE IF EXISTS ClassroomType
;

DROP TABLE IF EXISTS Classroom
;

DROP TABLE IF EXISTS ClassManagement
;

DROP TABLE IF EXISTS ArrangeClass
;

DROP TABLE IF EXISTS ClassEnrollment
;

DROP TABLE IF EXISTS Candidates
;

DROP TABLE IF EXISTS BehaviourStandardType
;

DROP TABLE IF EXISTS BehaviourStandard
;

DROP TABLE IF EXISTS Authority
;

DROP TABLE IF EXISTS AttendanceType
;

DROP TABLE IF EXISTS Attendance
;

DROP TABLE IF EXISTS Assessment
;

DROP TABLE IF EXISTS ArrangeClassTimeInfo
;

DROP TABLE IF EXISTS ApprovalAuthorityType
;

DROP TABLE IF EXISTS ApprovalAuthority
;

DROP TABLE IF EXISTS ApplyInfo
;

DROP TABLE IF EXISTS ApplicationNo
;

CREATE TABLE WorkingStateType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_WorkingStateType PRIMARY KEY (uuid)
)
;


CREATE TABLE Job(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Job PRIMARY KEY (uuid)
)
;


CREATE TABLE Campus(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
address VARCHAR(50) NULL,
contact VARCHAR(20) NULL,
telephone VARCHAR(20) NULL,
instruction text NULL,
headmasterUuid VARCHAR(32) NULL,
sequence INT NULL
, CONSTRAINT PK_Campus PRIMARY KEY (uuid)
)
;


CREATE TABLE FileType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_FileType PRIMARY KEY (uuid)
)
;


CREATE TABLE RelatedFile(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
typeUuid VARCHAR(32) NULL,
name VARCHAR(100) NULL,
path VARCHAR(100) NULL,
uploadPersonUuid VARCHAR(32) NULL,
uploadTime DATETIME NULL
, CONSTRAINT PK_RelatedFile PRIMARY KEY (uuid)
)
;

ALTER TABLE RelatedFile ADD CONSTRAINT FK_RelatedFile_typeUuid FOREIGN KEY (typeUuid) REFERENCES FileType(uuid)
;


CREATE TABLE Country(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Country PRIMARY KEY (uuid)
)
;


CREATE TABLE Education(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Education PRIMARY KEY (uuid)
)
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


CREATE TABLE Political(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Political PRIMARY KEY (uuid)
)
;


CREATE TABLE Gender(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Gender PRIMARY KEY (uuid)
)
;


CREATE TABLE Nationality(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Nationality PRIMARY KEY (uuid)
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


CREATE TABLE Person(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
photoUuid VARCHAR(32) NULL,
personNo VARCHAR(20) NULL,
name VARCHAR(15) NULL,
genderUuid VARCHAR(32) NULL,
birthDate DATETIME NULL,
nativePlace VARCHAR(30) NULL,
idNo VARCHAR(20) NULL,
address VARCHAR(30) NULL,
nationalityUuid VARCHAR(32) NULL,
countryUuid VARCHAR(32) NULL,
educationUuid VARCHAR(32) NULL,
politicalUuid VARCHAR(32) NULL,
cellPhone VARCHAR(15) NULL,
email VARCHAR(50) NULL,
marriageUuid VARCHAR(32) NULL,
realAddress VARCHAR(30) NULL,
qq VARCHAR(20) NULL,
parentName VARCHAR(30) NULL,
parentPhone VARCHAR(30) NULL,
specialExpertise text NULL,
foreignLanguageAndQualification text NULL,
ifUsing CHAR(1) NULL,
estAge INT NULL,
employmentStatusUuid VARCHAR(32) NULL,
employer VARCHAR(60) NULL
, CONSTRAINT PK_Person PRIMARY KEY (uuid)
)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_photoUuid FOREIGN KEY (photoUuid) REFERENCES RelatedFile(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_genderUuid FOREIGN KEY (genderUuid) REFERENCES Gender(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_nationalityUuid FOREIGN KEY (nationalityUuid) REFERENCES Nationality(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_countryUuid FOREIGN KEY (countryUuid) REFERENCES Country(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_educationUuid FOREIGN KEY (educationUuid) REFERENCES Education(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_politicalUuid FOREIGN KEY (politicalUuid) REFERENCES Political(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_marriageUuid FOREIGN KEY (marriageUuid) REFERENCES MarriageState(uuid)
;

ALTER TABLE Person ADD CONSTRAINT FK_Person_employmentStatusUuid FOREIGN KEY (employmentStatusUuid) REFERENCES EmploymentStatus(uuid)
;


CREATE TABLE Department(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Department PRIMARY KEY (uuid)
)
;


CREATE TABLE Employee(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
personUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
jobUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
workPhone VARCHAR(15) NULL,
fromDate DATETIME NULL,
toDate DATETIME NULL,
workingStateUuid VARCHAR(32) NULL,
summary text NULL,
introduction text NULL,
openId VARCHAR(50) NULL,
ifUsing CHAR(1) NULL,
ifShow CHAR(1) NULL
, CONSTRAINT PK_Employee PRIMARY KEY (uuid)
)
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_personUuid FOREIGN KEY (personUuid) REFERENCES Person(uuid)
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_jobUuid FOREIGN KEY (jobUuid) REFERENCES Job(uuid)
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_workingStateUuid FOREIGN KEY (workingStateUuid) REFERENCES WorkingStateType(uuid)
;


CREATE TABLE ReviewState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ReviewState PRIMARY KEY (uuid)
)
;


CREATE TABLE WorkRecord(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
recordUuid VARCHAR(32) NULL,
recordTime DATETIME NULL,
summary text NULL,
schedule text NULL,
share text NULL,
fileUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
reviewFlagUuid VARCHAR(32) NULL,
reviewComment text NULL,
reviewEmployeeUuid VARCHAR(32) NULL,
reviewTime DATETIME NULL
, CONSTRAINT PK_WorkRecord PRIMARY KEY (uuid)
)
;

ALTER TABLE WorkRecord ADD CONSTRAINT FK_WorkRecord_recordUuid FOREIGN KEY (recordUuid) REFERENCES Employee(uuid)
;

ALTER TABLE WorkRecord ADD CONSTRAINT FK_WorkRecord_fileUuid FOREIGN KEY (fileUuid) REFERENCES RelatedFile(uuid)
;

ALTER TABLE WorkRecord ADD CONSTRAINT FK_WorkRecord_reviewFlagUuid FOREIGN KEY (reviewFlagUuid) REFERENCES ReviewState(uuid)
;

ALTER TABLE WorkRecord ADD CONSTRAINT FK_WorkRecord_reviewEmployeeUuid FOREIGN KEY (reviewEmployeeUuid) REFERENCES Employee(uuid)
;


CREATE TABLE WorkExperienceInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
sequence INT NULL,
beginDate DATETIME NULL,
endDate DATETIME NULL,
name VARCHAR(50) NULL,
position VARCHAR(50) NULL,
reference VARCHAR(10) NULL,
referencePhone VARCHAR(15) NULL
, CONSTRAINT PK_WorkExperienceInfo PRIMARY KEY (uuid)
)
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


CREATE TABLE User(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
account VARCHAR(50) NULL,
password VARCHAR(50) NULL,
personUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_User PRIMARY KEY (uuid)
)
;

ALTER TABLE User ADD CONSTRAINT FK_User_personUuid FOREIGN KEY (personUuid) REFERENCES Person(uuid)
;


CREATE TABLE Tuition(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
preDiscountAmount VARCHAR(10) NULL,
discount VARCHAR(10) NULL,
discountReason VARCHAR(200) NULL,
actualTotalAmount VARCHAR(10) NULL,
amountPaid VARCHAR(10) NULL,
amountReturn VARCHAR(10) NULL
, CONSTRAINT PK_Tuition PRIMARY KEY (uuid)
)
;


CREATE TABLE TrainingType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_TrainingType PRIMARY KEY (uuid)
)
;


CREATE TABLE ExaminationState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ExaminationState PRIMARY KEY (uuid)
)
;


CREATE TABLE TrainingPlan(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
title text NULL,
lecturerUuid VARCHAR(32) NULL,
trainingTime DATETIME NULL,
departmentUuid VARCHAR(32) NULL,
content text NULL,
stateUuid VARCHAR(32) NULL,
publisherUuid VARCHAR(32) NULL,
typeUuid VARCHAR(32) NULL,
curriculum text NULL,
effect text NULL,
situation text NULL,
suggest text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_TrainingPlan PRIMARY KEY (uuid)
)
;

ALTER TABLE TrainingPlan ADD CONSTRAINT FK_TrainingPlan_lecturerUuid FOREIGN KEY (lecturerUuid) REFERENCES Employee(uuid)
;

ALTER TABLE TrainingPlan ADD CONSTRAINT FK_TrainingPlan_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE TrainingPlan ADD CONSTRAINT FK_TrainingPlan_stateUuid FOREIGN KEY (stateUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE TrainingPlan ADD CONSTRAINT FK_TrainingPlan_publisherUuid FOREIGN KEY (publisherUuid) REFERENCES Employee(uuid)
;

ALTER TABLE TrainingPlan ADD CONSTRAINT FK_TrainingPlan_typeUuid FOREIGN KEY (typeUuid) REFERENCES TrainingType(uuid)
;


CREATE TABLE Title(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Title PRIMARY KEY (uuid)
)
;


CREATE TABLE TeacherType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_TeacherType PRIMARY KEY (uuid)
)
;


CREATE TABLE ServiceState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ServiceState PRIMARY KEY (uuid)
)
;


CREATE TABLE Teacher(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
employeeUuid VARCHAR(32) NULL,
teacherTypeUuid VARCHAR(32) NULL,
graduateInstitution VARCHAR(100) NULL,
titleUuid VARCHAR(32) NULL,
workUnit VARCHAR(100) NULL,
duty VARCHAR(100) NULL,
homePhone VARCHAR(15) NULL,
feature VARCHAR(200) NULL,
notes VARCHAR(200) NULL,
teachingCourse text NULL,
serviceStateUuid VARCHAR(32) NULL,
recordTime DATETIME NULL,
recorderUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Teacher PRIMARY KEY (uuid)
)
;

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_teacherTypeUuid FOREIGN KEY (teacherTypeUuid) REFERENCES TeacherType(uuid)
;

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_titleUuid FOREIGN KEY (titleUuid) REFERENCES Title(uuid)
;

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_serviceStateUuid FOREIGN KEY (serviceStateUuid) REFERENCES ServiceState(uuid)
;

ALTER TABLE Teacher ADD CONSTRAINT FK_Teacher_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
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


CREATE TABLE Room(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
classroomName VARCHAR(50) NULL,
numberOf INT NULL,
campusUuid VARCHAR(32) NULL,
remarks text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Room PRIMARY KEY (uuid)
)
;

ALTER TABLE Room ADD CONSTRAINT FK_Room_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
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


CREATE TABLE Supplier(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
contact VARCHAR(20) NULL,
telephone VARCHAR(20) NULL,
address VARCHAR(200) NULL,
summary VARCHAR(200) NULL,
recorderUuid VARCHAR(32) NULL,
recordTime DATETIME NULL
, CONSTRAINT PK_Supplier PRIMARY KEY (uuid)
)
;

ALTER TABLE Supplier ADD CONSTRAINT FK_Supplier_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
;


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


CREATE TABLE Student(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
personUuid VARCHAR(32) NULL,
studentID VARCHAR(20) NULL,
note text NULL,
ifUsing CHAR(1) NULL,
consultantUuid VARCHAR(32) NULL
, CONSTRAINT PK_Student PRIMARY KEY (uuid)
)
;

ALTER TABLE Student ADD CONSTRAINT FK_Student_personUuid FOREIGN KEY (personUuid) REFERENCES Person(uuid)
;

ALTER TABLE Student ADD CONSTRAINT FK_Student_consultantUuid FOREIGN KEY (consultantUuid) REFERENCES Consultant(uuid)
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


CREATE TABLE SelfAssessType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_SelfAssessType PRIMARY KEY (uuid)
)
;


CREATE TABLE AssessRes(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_AssessRes PRIMARY KEY (uuid)
)
;


CREATE TABLE SelfAssessExamine(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
attendanceMark INT NULL,
leaveCount INT NULL,
lateCount INT NULL,
absenceCount INT NULL,
behaviorMark INT NULL,
responsibilityMark INT NULL,
diligenceMark INT NULL,
skillMark INT NULL,
coordinationMark INT NULL,
planMark INT NULL,
executeMark INT NULL,
qualityMark INT NULL,
efficiencyMark INT NULL,
totalScore INT NULL,
comprehensiveEvaluation text NULL,
assessResUuid VARCHAR(32) NULL,
assessmentPersonUuid VARCHAR(32) NULL,
assessmentTime DATETIME NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_SelfAssessExamine PRIMARY KEY (uuid)
)
;

ALTER TABLE SelfAssessExamine ADD CONSTRAINT FK_SelfAssessExamine_assessResUuid FOREIGN KEY (assessResUuid) REFERENCES AssessRes(uuid)
;

ALTER TABLE SelfAssessExamine ADD CONSTRAINT FK_SelfAssessExamine_assessmentPersonUuid FOREIGN KEY (assessmentPersonUuid) REFERENCES Employee(uuid)
;


CREATE TABLE AssessState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_AssessState PRIMARY KEY (uuid)
)
;


CREATE TABLE SelfAssess(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
selfAssessEmployeeUuid VARCHAR(32) NULL,
selfAssessTime DATETIME NULL,
examineUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
jobUuid VARCHAR(32) NULL,
fromDt DATETIME NULL,
toDt DATETIME NULL,
workContant text NULL,
thinkings text NULL,
harvest text NULL,
reflect text NULL,
selfAssessTypeUuid VARCHAR(32) NULL,
assessStateUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_SelfAssess PRIMARY KEY (uuid)
)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_selfAssessEmployeeUuid FOREIGN KEY (selfAssessEmployeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_examineUuid FOREIGN KEY (examineUuid) REFERENCES SelfAssessExamine(uuid)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_jobUuid FOREIGN KEY (jobUuid) REFERENCES Job(uuid)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_selfAssessTypeUuid FOREIGN KEY (selfAssessTypeUuid) REFERENCES SelfAssessType(uuid)
;

ALTER TABLE SelfAssess ADD CONSTRAINT FK_SelfAssess_assessStateUuid FOREIGN KEY (assessStateUuid) REFERENCES AssessState(uuid)
;


CREATE TABLE ReturnState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ReturnState PRIMARY KEY (uuid)
)
;


CREATE TABLE ResultType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ResultType PRIMARY KEY (uuid)
)
;


CREATE TABLE ApplicationType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApplicationType PRIMARY KEY (uuid)
)
;


CREATE TABLE Apply(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
typeUuid VARCHAR(32) NULL,
applicationTime DATETIME NULL,
applicantUuid VARCHAR(32) NULL,
checkTimeOne DATETIME NULL,
checkerOneUuid VARCHAR(32) NULL,
notesOne VARCHAR(100) NULL,
checkStateOneUuid VARCHAR(32) NULL,
checkTimeTwo DATETIME NULL,
checkerTwoUuid VARCHAR(32) NULL,
notesTwo VARCHAR(100) NULL,
checkStateTwoUuid VARCHAR(32) NULL,
checkTimeThree DATETIME NULL,
checkerThreeUuid VARCHAR(32) NULL,
notesThree VARCHAR(100) NULL,
checkStateThreeUuid VARCHAR(32) NULL,
checkTimeFour DATETIME NULL,
checkerFourUuid VARCHAR(32) NULL,
notesFour VARCHAR(100) NULL,
checkStateFourUuid VARCHAR(32) NULL,
checkTimeFive DATETIME NULL,
checkerFiveUuid VARCHAR(32) NULL,
notesFive VARCHAR(100) NULL,
checkStateFiveUuid VARCHAR(32) NULL,
stateUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Apply PRIMARY KEY (uuid)
)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_typeUuid FOREIGN KEY (typeUuid) REFERENCES ApplicationType(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_applicantUuid FOREIGN KEY (applicantUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkerOneUuid FOREIGN KEY (checkerOneUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkStateOneUuid FOREIGN KEY (checkStateOneUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkerTwoUuid FOREIGN KEY (checkerTwoUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkStateTwoUuid FOREIGN KEY (checkStateTwoUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkerThreeUuid FOREIGN KEY (checkerThreeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkStateThreeUuid FOREIGN KEY (checkStateThreeUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkerFourUuid FOREIGN KEY (checkerFourUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkStateFourUuid FOREIGN KEY (checkStateFourUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkerFiveUuid FOREIGN KEY (checkerFiveUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_checkStateFiveUuid FOREIGN KEY (checkStateFiveUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE Apply ADD CONSTRAINT FK_Apply_stateUuid FOREIGN KEY (stateUuid) REFERENCES ExaminationState(uuid)
;


CREATE TABLE Relationship(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
teacherUuid VARCHAR(32) NULL,
originalUuid VARCHAR(32) NULL,
transferUuid VARCHAR(32) NULL,
postTime DATETIME NULL,
arrivalTime DATETIME NULL,
ifDeal CHAR(1) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Relationship PRIMARY KEY (uuid)
)
;

ALTER TABLE Relationship ADD CONSTRAINT FK_Relationship_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE Relationship ADD CONSTRAINT FK_Relationship_teacherUuid FOREIGN KEY (teacherUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Relationship ADD CONSTRAINT FK_Relationship_originalUuid FOREIGN KEY (originalUuid) REFERENCES Department(uuid)
;

ALTER TABLE Relationship ADD CONSTRAINT FK_Relationship_transferUuid FOREIGN KEY (transferUuid) REFERENCES Department(uuid)
;


CREATE TABLE ApprovalState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApprovalState PRIMARY KEY (uuid)
)
;


CREATE TABLE RegularApproval(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
attendanceMark INT NULL,
leaveCount INT NULL,
lateCount INT NULL,
absenceCount INT NULL,
behaviorMark INT NULL,
responsibilityMark INT NULL,
diligenceMark INT NULL,
skillMark INT NULL,
coordinationMark INT NULL,
planMark INT NULL,
executeMark INT NULL,
qualityMark INT NULL,
efficiencyMark INT NULL,
totalScore INT NULL,
prolongMonth INT NULL,
teachPerformance text NULL,
teachEXInfo text NULL,
approvalStateUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_RegularApproval PRIMARY KEY (uuid)
)
;

ALTER TABLE RegularApproval ADD CONSTRAINT FK_RegularApproval_approvalStateUuid FOREIGN KEY (approvalStateUuid) REFERENCES ApprovalState(uuid)
;


CREATE TABLE RegularApplication(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
approvalUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
jobUuid VARCHAR(32) NULL,
fromDt DATETIME NULL,
toDt DATETIME NULL,
debrief text NULL,
workPlan text NULL,
suggestion text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_RegularApplication PRIMARY KEY (uuid)
)
;

ALTER TABLE RegularApplication ADD CONSTRAINT FK_RegularApplication_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE RegularApplication ADD CONSTRAINT FK_RegularApplication_approvalUuid FOREIGN KEY (approvalUuid) REFERENCES RegularApproval(uuid)
;

ALTER TABLE RegularApplication ADD CONSTRAINT FK_RegularApplication_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE RegularApplication ADD CONSTRAINT FK_RegularApplication_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE RegularApplication ADD CONSTRAINT FK_RegularApplication_jobUuid FOREIGN KEY (jobUuid) REFERENCES Job(uuid)
;


CREATE TABLE RecruitState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_RecruitState PRIMARY KEY (uuid)
)
;


CREATE TABLE LevelType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_LevelType PRIMARY KEY (uuid)
)
;


CREATE TABLE OtherType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_OtherType PRIMARY KEY (uuid)
)
;


CREATE TABLE Recruitment(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
existingNo INT NULL,
budgetNo INT NULL,
position VARCHAR(20) NULL,
demandNo INT NULL,
rankUuid VARCHAR(32) NULL,
leaderUuid VARCHAR(32) NULL,
subordinateUuid VARCHAR(32) NULL,
subordinatesNo INT NULL,
otherUuid VARCHAR(32) NULL,
probationLow DOUBLE(16,8) NULL,
probationHigh DOUBLE(16,8) NULL,
positiveLow DOUBLE(16,8) NULL,
positiveHigh DOUBLE(16,8) NULL,
welfare VARCHAR(200) NULL,
duty text NULL,
genderUuid VARCHAR(32) NULL,
ageLow INT NULL,
ageHigh INT NULL,
educationUuid VARCHAR(32) NULL,
major VARCHAR(50) NULL,
professional VARCHAR(200) NULL,
managementAbility VARCHAR(200) NULL,
background VARCHAR(200) NULL,
otherTechnology VARCHAR(100) NULL,
weeks VARCHAR(100) NULL,
specificTime DATETIME NULL,
director VARCHAR(200) NULL,
humanOpinion VARCHAR(200) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Recruitment PRIMARY KEY (uuid)
)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_rankUuid FOREIGN KEY (rankUuid) REFERENCES LevelType(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_leaderUuid FOREIGN KEY (leaderUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_subordinateUuid FOREIGN KEY (subordinateUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_otherUuid FOREIGN KEY (otherUuid) REFERENCES OtherType(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_genderUuid FOREIGN KEY (genderUuid) REFERENCES Gender(uuid)
;

ALTER TABLE Recruitment ADD CONSTRAINT FK_Recruitment_educationUuid FOREIGN KEY (educationUuid) REFERENCES Education(uuid)
;


CREATE TABLE RecordStatus(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_RecordStatus PRIMARY KEY (uuid)
)
;


CREATE TABLE ReceiverInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
receiverUuid VARCHAR(32) NULL
, CONSTRAINT PK_ReceiverInfo PRIMARY KEY (uuid)
)
;


CREATE TABLE ReceiptState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ReceiptState PRIMARY KEY (uuid)
)
;


CREATE TABLE DepartureType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_DepartureType PRIMARY KEY (uuid)
)
;


CREATE TABLE Quit(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
employeeUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
departureTime DATETIME NULL,
departureTypeUuid VARCHAR(32) NULL,
reason text NULL,
ifDeal CHAR(1) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Quit PRIMARY KEY (uuid)
)
;

ALTER TABLE Quit ADD CONSTRAINT FK_Quit_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE Quit ADD CONSTRAINT FK_Quit_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Quit ADD CONSTRAINT FK_Quit_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE Quit ADD CONSTRAINT FK_Quit_departureTypeUuid FOREIGN KEY (departureTypeUuid) REFERENCES DepartureType(uuid)
;


CREATE TABLE PublicityApplication(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
description text NULL,
activityTime DATETIME NULL,
location VARCHAR(100) NULL,
copyContent text NULL,
copyFileUuid VARCHAR(32) NULL,
preCost DOUBLE(16,8) NULL,
notes text NULL,
cost DOUBLE(16,8) NULL,
effect text NULL,
evaluate text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_PublicityApplication PRIMARY KEY (uuid)
)
;

ALTER TABLE PublicityApplication ADD CONSTRAINT FK_PublicityApplication_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE PublicityApplication ADD CONSTRAINT FK_PublicityApplication_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE PublicityApplication ADD CONSTRAINT FK_PublicityApplication_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE PublicityApplication ADD CONSTRAINT FK_PublicityApplication_copyFileUuid FOREIGN KEY (copyFileUuid) REFERENCES RelatedFile(uuid)
;


CREATE TABLE ApplicationMaterialType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApplicationMaterialType PRIMARY KEY (uuid)
)
;


CREATE TABLE ApplicationMaterialColor(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApplicationMaterialColor PRIMARY KEY (uuid)
)
;


CREATE TABLE ProductionUnit(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ProductionUnit PRIMARY KEY (uuid)
)
;


CREATE TABLE ApplicationMaterialSize(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApplicationMaterialSize PRIMARY KEY (uuid)
)
;


CREATE TABLE ApplicationMaterialTexture(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApplicationMaterialTexture PRIMARY KEY (uuid)
)
;


CREATE TABLE PropagandaMaterialInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
applicationMaterialUuid VARCHAR(32) NULL,
materialOther VARCHAR(100) NULL,
applicationNumber INT NULL,
applicationMaterialSizeUuid VARCHAR(32) NULL,
sizeOther VARCHAR(100) NULL,
applicationMaterialColorUuid VARCHAR(32) NULL,
applicationMaterialTextureUuid VARCHAR(32) NULL,
textureOther VARCHAR(100) NULL,
productionUnitUuid VARCHAR(32) NULL,
unitOther VARCHAR(100) NULL,
designer VARCHAR(20) NULL,
makeStartTime DATETIME NULL,
makeEndTime DATETIME NULL,
makeDays INT NULL,
acceptStateUuid VARCHAR(32) NULL,
usedNumber INT NULL
, CONSTRAINT PK_PropagandaMaterialInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE PropagandaMaterialInfo ADD CONSTRAINT FK_PropagandaMaterialInfo_applicationMaterialUuid FOREIGN KEY (applicationMaterialUuid) REFERENCES ApplicationMaterialType(uuid)
;

ALTER TABLE PropagandaMaterialInfo ADD CONSTRAINT FK_PropagandaMaterialInfo_applicationMaterialSizeUuid FOREIGN KEY (applicationMaterialSizeUuid) REFERENCES ApplicationMaterialSize(uuid)
;

ALTER TABLE PropagandaMaterialInfo ADD CONSTRAINT FK_PropagandaMaterialInfo_applicationMaterialColorUuid FOREIGN KEY (applicationMaterialColorUuid) REFERENCES ApplicationMaterialColor(uuid)
;

ALTER TABLE PropagandaMaterialInfo ADD CONSTRAINT FK_PropagandaMaterialInfo_applicationMaterialTextureUuid FOREIGN KEY (applicationMaterialTextureUuid) REFERENCES ApplicationMaterialTexture(uuid)
;

ALTER TABLE PropagandaMaterialInfo ADD CONSTRAINT FK_PropagandaMaterialInfo_productionUnitUuid FOREIGN KEY (productionUnitUuid) REFERENCES ProductionUnit(uuid)
;

ALTER TABLE PropagandaMaterialInfo ADD CONSTRAINT FK_PropagandaMaterialInfo_acceptStateUuid FOREIGN KEY (acceptStateUuid) REFERENCES ReceiptState(uuid)
;


CREATE TABLE PreTeachingExpInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
sequence INT NULL,
unitName VARCHAR(50) NULL,
className VARCHAR(50) NULL,
reference VARCHAR(10) NULL,
referencePhone VARCHAR(15) NULL,
beginDate DATETIME NULL,
endDate DATETIME NULL
, CONSTRAINT PK_PreTeachingExpInfo PRIMARY KEY (uuid)
)
;


CREATE TABLE PreParticipatorInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
employeeUuid VARCHAR(32) NULL
, CONSTRAINT PK_PreParticipatorInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE PreParticipatorInfo ADD CONSTRAINT FK_PreParticipatorInfo_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PosterInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
site VARCHAR(200) NULL
, CONSTRAINT PK_PosterInfo PRIMARY KEY (uuid)
)
;


CREATE TABLE EmployeePerformance(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
employeeUuid VARCHAR(32) NULL,
month VARCHAR(7) NULL
, CONSTRAINT PK_EmployeePerformance PRIMARY KEY (uuid)
)
;

ALTER TABLE EmployeePerformance ADD CONSTRAINT FK_EmployeePerformance_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfTeaching(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfTeaching PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfTeaching ADD CONSTRAINT FK_PerfTeaching_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfTeaching ADD CONSTRAINT FK_PerfTeaching_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfShortTerm(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfShortTerm PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfShortTerm ADD CONSTRAINT FK_PerfShortTerm_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfShortTerm ADD CONSTRAINT FK_PerfShortTerm_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfSecurityClean(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfSecurityClean PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfSecurityClean ADD CONSTRAINT FK_PerfSecurityClean_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfSecurityClean ADD CONSTRAINT FK_PerfSecurityClean_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfRecruit(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfRecruit PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfRecruit ADD CONSTRAINT FK_PerfRecruit_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfRecruit ADD CONSTRAINT FK_PerfRecruit_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfReception(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfReception PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfReception ADD CONSTRAINT FK_PerfReception_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfReception ADD CONSTRAINT FK_PerfReception_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfPropaganda(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfPropaganda PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfPropaganda ADD CONSTRAINT FK_PerfPropaganda_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfPropaganda ADD CONSTRAINT FK_PerfPropaganda_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfOther(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfOther PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfOther ADD CONSTRAINT FK_PerfOther_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfOther ADD CONSTRAINT FK_PerfOther_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerformanceType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
sequence VARCHAR(2) NULL
, CONSTRAINT PK_PerformanceType PRIMARY KEY (uuid)
)
;


CREATE TABLE PerfObtain(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfObtain PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfObtain ADD CONSTRAINT FK_PerfObtain_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfObtain ADD CONSTRAINT FK_PerfObtain_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfMaterial(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfMaterial PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfMaterial ADD CONSTRAINT FK_PerfMaterial_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfMaterial ADD CONSTRAINT FK_PerfMaterial_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfLongTerm(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfLongTerm PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfLongTerm ADD CONSTRAINT FK_PerfLongTerm_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfLongTerm ADD CONSTRAINT FK_PerfLongTerm_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfLession(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfLession PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfLession ADD CONSTRAINT FK_PerfLession_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfLession ADD CONSTRAINT FK_PerfLession_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfIncharge(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfIncharge PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfIncharge ADD CONSTRAINT FK_PerfIncharge_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfIncharge ADD CONSTRAINT FK_PerfIncharge_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfFinancial(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfFinancial PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfFinancial ADD CONSTRAINT FK_PerfFinancial_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfFinancial ADD CONSTRAINT FK_PerfFinancial_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfFacility(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfFacility PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfFacility ADD CONSTRAINT FK_PerfFacility_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfFacility ADD CONSTRAINT FK_PerfFacility_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfDriver(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfDriver PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfDriver ADD CONSTRAINT FK_PerfDriver_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfDriver ADD CONSTRAINT FK_PerfDriver_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfChildren(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfChildren PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfChildren ADD CONSTRAINT FK_PerfChildren_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfChildren ADD CONSTRAINT FK_PerfChildren_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfBehaviour(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
perfBehaviour0 INT NULL,
perfBehaviourS0 INT NULL,
perfBehaviour1 INT NULL,
perfBehaviourS1 INT NULL,
perfBehaviour2 INT NULL,
perfBehaviour3 INT NULL,
perfBehaviourM4 INT NULL,
perfBehaviourA4 INT NULL,
perfBehaviourE4 INT NULL,
perfBehaviourM5 INT NULL,
perfBehaviourA5 INT NULL,
perfBehaviourE5 INT NULL,
perfBehaviourM6 INT NULL,
perfBehaviourA6 INT NULL,
perfBehaviourE6 INT NULL,
perfBehaviourM7 INT NULL,
perfBehaviourA7 INT NULL,
perfBehaviourE7 INT NULL,
perfBehaviourM8 INT NULL,
perfBehaviourA8 INT NULL,
perfBehaviourE8 INT NULL,
perfBehaviourM9 INT NULL,
perfBehaviourA9 INT NULL,
perfBehaviourE9 INT NULL,
perfBehaviourM10 INT NULL,
perfBehaviourA10 INT NULL,
perfBehaviourE10 INT NULL,
perfBehaviourM11 INT NULL,
perfBehaviourA11 INT NULL,
perfBehaviourE11 INT NULL,
perfBehaviourM12 INT NULL,
perfBehaviourA12 INT NULL,
perfBehaviourE12 INT NULL,
perfBehaviour13 INT NULL,
result text NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfBehaviour PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfBehaviour ADD CONSTRAINT FK_PerfBehaviour_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfBehaviour ADD CONSTRAINT FK_PerfBehaviour_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfAttendance(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
perfAttendanceM0 INT NULL,
perfAttendanceA0 INT NULL,
perfAttendanceM1 INT NULL,
perfAttendanceA1 INT NULL,
perfAttendanceM2 INT NULL,
perfAttendanceA2 INT NULL,
perfAttendanceM3 INT NULL,
perfAttendanceA3 INT NULL,
perfAttendanceM4 INT NULL,
perfAttendanceA4 INT NULL,
perfAttendanceM5 INT NULL,
perfAttendanceA5 INT NULL,
perfAttendanceM6 INT NULL,
perfAttendanceA6 INT NULL,
perfAttendanceM7 INT NULL,
perfAttendanceA7 INT NULL,
perfAttendanceM8 INT NULL,
perfAttendanceA8 INT NULL,
perfAttendanceM9 INT NULL,
perfAttendanceA9 INT NULL,
perfAttendanceM10 INT NULL,
perfAttendanceA10 INT NULL,
perfAttendanceM11 INT NULL,
perfAttendanceA11 INT NULL,
perfAttendanceM12 INT NULL,
perfAttendanceA12 INT NULL,
perfAttendanceM13 INT NULL,
perfAttendanceA13 INT NULL,
perfAttendanceM14 INT NULL,
perfAttendanceA14 INT NULL,
perfAttendanceM15 INT NULL,
perfAttendanceA15 INT NULL,
perfAttendanceE0 INT NULL,
perfAttendanceE1 INT NULL,
perfAttendanceE2 INT NULL,
result text NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfAttendance PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfAttendance ADD CONSTRAINT FK_PerfAttendance_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfAttendance ADD CONSTRAINT FK_PerfAttendance_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE PerfAdmin(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
performanceUuid VARCHAR(32) NULL,
result VARCHAR(200) NULL,
checkerUuid VARCHAR(32) NULL,
checkTime DATETIME NULL
, CONSTRAINT PK_PerfAdmin PRIMARY KEY (uuid)
)
;

ALTER TABLE PerfAdmin ADD CONSTRAINT FK_PerfAdmin_performanceUuid FOREIGN KEY (performanceUuid) REFERENCES EmployeePerformance(uuid)
;

ALTER TABLE PerfAdmin ADD CONSTRAINT FK_PerfAdmin_checkerUuid FOREIGN KEY (checkerUuid) REFERENCES Employee(uuid)
;


CREATE TABLE ParticipatorInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
employeeUuid VARCHAR(32) NULL
, CONSTRAINT PK_ParticipatorInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE ParticipatorInfo ADD CONSTRAINT FK_ParticipatorInfo_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;


CREATE TABLE MaterialType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_MaterialType PRIMARY KEY (uuid)
)
;


CREATE TABLE Material(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
materialNo VARCHAR(20) NULL,
specification VARCHAR(50) NULL,
unit VARCHAR(5) NULL,
typeUuid VARCHAR(32) NULL,
minValue INT NULL,
notes VARCHAR(200) NULL,
recorderUuid VARCHAR(32) NULL,
recordTime DATETIME NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Material PRIMARY KEY (uuid)
)
;

ALTER TABLE Material ADD CONSTRAINT FK_Material_typeUuid FOREIGN KEY (typeUuid) REFERENCES MaterialType(uuid)
;

ALTER TABLE Material ADD CONSTRAINT FK_Material_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
;


CREATE TABLE OrderGenerate(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
materialUuid VARCHAR(32) NULL,
materialAmount INT NULL,
supplierUuid VARCHAR(32) NULL,
generatorUuid VARCHAR(32) NULL,
generateTime DATETIME NULL,
acceptStateUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_OrderGenerate PRIMARY KEY (uuid)
)
;

ALTER TABLE OrderGenerate ADD CONSTRAINT FK_OrderGenerate_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE OrderGenerate ADD CONSTRAINT FK_OrderGenerate_supplierUuid FOREIGN KEY (supplierUuid) REFERENCES Supplier(uuid)
;

ALTER TABLE OrderGenerate ADD CONSTRAINT FK_OrderGenerate_generatorUuid FOREIGN KEY (generatorUuid) REFERENCES Employee(uuid)
;

ALTER TABLE OrderGenerate ADD CONSTRAINT FK_OrderGenerate_acceptStateUuid FOREIGN KEY (acceptStateUuid) REFERENCES ReceiptState(uuid)
;


CREATE TABLE OfficeApplicationInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
materialUuid VARCHAR(32) NULL,
materialAmount INT NULL,
approvalAmount INT NULL,
stateUuid VARCHAR(32) NULL,
notes VARCHAR(200) NULL,
orderGenerateUuid VARCHAR(32) NULL,
ifGenerate CHAR(1) NULL,
receipStateUuid VARCHAR(32) NULL
, CONSTRAINT PK_OfficeApplicationInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE OfficeApplicationInfo ADD CONSTRAINT FK_OfficeApplicationInfo_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE OfficeApplicationInfo ADD CONSTRAINT FK_OfficeApplicationInfo_stateUuid FOREIGN KEY (stateUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE OfficeApplicationInfo ADD CONSTRAINT FK_OfficeApplicationInfo_orderGenerateUuid FOREIGN KEY (orderGenerateUuid) REFERENCES OrderGenerate(uuid)
;

ALTER TABLE OfficeApplicationInfo ADD CONSTRAINT FK_OfficeApplicationInfo_receipStateUuid FOREIGN KEY (receipStateUuid) REFERENCES ReceiptState(uuid)
;


CREATE TABLE OfficeApplication(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_OfficeApplication PRIMARY KEY (uuid)
)
;

ALTER TABLE OfficeApplication ADD CONSTRAINT FK_OfficeApplication_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE OfficeApplication ADD CONSTRAINT FK_OfficeApplication_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE OfficeApplication ADD CONSTRAINT FK_OfficeApplication_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;


CREATE TABLE Mistake(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
title VARCHAR(100) NULL,
content text NULL,
recordTime DATETIME NULL,
recorderUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Mistake PRIMARY KEY (uuid)
)
;

ALTER TABLE Mistake ADD CONSTRAINT FK_Mistake_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
;


CREATE TABLE Menu(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
id VARCHAR(50) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
sequence VARCHAR(2) NULL,
link VARCHAR(200) NULL,
stationName VARCHAR(20) NULL
, CONSTRAINT PK_Menu PRIMARY KEY (uuid)
)
;


CREATE TABLE MaterialStorage(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
materialUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
amount INT NULL,
total INT NULL
, CONSTRAINT PK_MaterialStorage PRIMARY KEY (uuid)
)
;

ALTER TABLE MaterialStorage ADD CONSTRAINT FK_MaterialStorage_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE MaterialStorage ADD CONSTRAINT FK_MaterialStorage_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;


CREATE TABLE MaterialScrap(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
materialUuid VARCHAR(32) NULL,
amount INT NULL,
keeperUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
materialStorageUuid VARCHAR(32) NULL,
recordTime DATETIME NULL,
remarks text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_MaterialScrap PRIMARY KEY (uuid)
)
;

ALTER TABLE MaterialScrap ADD CONSTRAINT FK_MaterialScrap_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE MaterialScrap ADD CONSTRAINT FK_MaterialScrap_keeperUuid FOREIGN KEY (keeperUuid) REFERENCES Employee(uuid)
;

ALTER TABLE MaterialScrap ADD CONSTRAINT FK_MaterialScrap_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE MaterialScrap ADD CONSTRAINT FK_MaterialScrap_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE MaterialScrap ADD CONSTRAINT FK_MaterialScrap_materialStorageUuid FOREIGN KEY (materialStorageUuid) REFERENCES MaterialStorage(uuid)
;


CREATE TABLE MaterialInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
materialUuid VARCHAR(32) NULL
, CONSTRAINT PK_MaterialInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE MaterialInfo ADD CONSTRAINT FK_MaterialInfo_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;


CREATE TABLE MaterialImport(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applicationInfoUuid VARCHAR(32) NULL,
materialUuid VARCHAR(32) NULL,
supplierUuid VARCHAR(32) NULL,
amount INT NULL,
unit VARCHAR(5) NULL,
price DOUBLE(16,8) NULL,
recorderUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
materialStorageUuid VARCHAR(32) NULL,
importDate DATETIME NULL
, CONSTRAINT PK_MaterialImport PRIMARY KEY (uuid)
)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_applicationInfoUuid FOREIGN KEY (applicationInfoUuid) REFERENCES OfficeApplicationInfo(uuid)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_supplierUuid FOREIGN KEY (supplierUuid) REFERENCES Supplier(uuid)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE MaterialImport ADD CONSTRAINT FK_MaterialImport_materialStorageUuid FOREIGN KEY (materialStorageUuid) REFERENCES MaterialStorage(uuid)
;


CREATE TABLE MaterialExport(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
materialUuid VARCHAR(32) NULL,
amount INT NULL,
keeperUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
materialStorageUuid VARCHAR(32) NULL,
exportDate DATETIME NULL,
stateUuid VARCHAR(32) NULL,
returnDate DATETIME NULL,
remarks text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_MaterialExport PRIMARY KEY (uuid)
)
;

ALTER TABLE MaterialExport ADD CONSTRAINT FK_MaterialExport_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE MaterialExport ADD CONSTRAINT FK_MaterialExport_keeperUuid FOREIGN KEY (keeperUuid) REFERENCES Employee(uuid)
;

ALTER TABLE MaterialExport ADD CONSTRAINT FK_MaterialExport_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE MaterialExport ADD CONSTRAINT FK_MaterialExport_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE MaterialExport ADD CONSTRAINT FK_MaterialExport_materialStorageUuid FOREIGN KEY (materialStorageUuid) REFERENCES MaterialStorage(uuid)
;

ALTER TABLE MaterialExport ADD CONSTRAINT FK_MaterialExport_stateUuid FOREIGN KEY (stateUuid) REFERENCES ReturnState(uuid)
;


CREATE TABLE MaterialAllocate(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
materialUuid VARCHAR(32) NULL,
amount INT NULL,
keeperUuid VARCHAR(32) NULL,
demandSectorUuid VARCHAR(32) NULL,
demandCampusUuid VARCHAR(32) NULL,
deployedSectorUuid VARCHAR(32) NULL,
deployedCampusUuid VARCHAR(32) NULL,
demandInventoryUuid VARCHAR(32) NULL,
deployedInventoryUuid VARCHAR(32) NULL,
recordTime DATETIME NULL,
remarks text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_MaterialAllocate PRIMARY KEY (uuid)
)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_materialUuid FOREIGN KEY (materialUuid) REFERENCES Material(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_keeperUuid FOREIGN KEY (keeperUuid) REFERENCES Employee(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_demandSectorUuid FOREIGN KEY (demandSectorUuid) REFERENCES Department(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_demandCampusUuid FOREIGN KEY (demandCampusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_deployedSectorUuid FOREIGN KEY (deployedSectorUuid) REFERENCES Department(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_deployedCampusUuid FOREIGN KEY (deployedCampusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_demandInventoryUuid FOREIGN KEY (demandInventoryUuid) REFERENCES MaterialStorage(uuid)
;

ALTER TABLE MaterialAllocate ADD CONSTRAINT FK_MaterialAllocate_deployedInventoryUuid FOREIGN KEY (deployedInventoryUuid) REFERENCES MaterialStorage(uuid)
;


CREATE TABLE LeaveType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
notes text NULL
, CONSTRAINT PK_LeaveType PRIMARY KEY (uuid)
)
;


CREATE TABLE LeaveApplication(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
applyUuid VARCHAR(32) NULL,
departmentUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
position VARCHAR(50) NULL,
leaveTypeUuid VARCHAR(32) NULL,
leaveReason text NULL,
fromDt DATETIME NULL,
toDt DATETIME NULL,
days INT NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_LeaveApplication PRIMARY KEY (uuid)
)
;

ALTER TABLE LeaveApplication ADD CONSTRAINT FK_LeaveApplication_applyUuid FOREIGN KEY (applyUuid) REFERENCES Apply(uuid)
;

ALTER TABLE LeaveApplication ADD CONSTRAINT FK_LeaveApplication_departmentUuid FOREIGN KEY (departmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE LeaveApplication ADD CONSTRAINT FK_LeaveApplication_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE LeaveApplication ADD CONSTRAINT FK_LeaveApplication_leaveTypeUuid FOREIGN KEY (leaveTypeUuid) REFERENCES LeaveType(uuid)
;


CREATE TABLE JoinState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_JoinState PRIMARY KEY (uuid)
)
;


CREATE TABLE JobPerfType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
typeUuid VARCHAR(32) NULL,
jobUuid VARCHAR(32) NULL
, CONSTRAINT PK_JobPerfType PRIMARY KEY (uuid)
)
;

ALTER TABLE JobPerfType ADD CONSTRAINT FK_JobPerfType_typeUuid FOREIGN KEY (typeUuid) REFERENCES PerformanceType(uuid)
;

ALTER TABLE JobPerfType ADD CONSTRAINT FK_JobPerfType_jobUuid FOREIGN KEY (jobUuid) REFERENCES Job(uuid)
;


CREATE TABLE JobAuthority(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
menuUuid VARCHAR(32) NULL,
jobUuid VARCHAR(32) NULL
, CONSTRAINT PK_JobAuthority PRIMARY KEY (uuid)
)
;

ALTER TABLE JobAuthority ADD CONSTRAINT FK_JobAuthority_menuUuid FOREIGN KEY (menuUuid) REFERENCES Menu(uuid)
;

ALTER TABLE JobAuthority ADD CONSTRAINT FK_JobAuthority_jobUuid FOREIGN KEY (jobUuid) REFERENCES Job(uuid)
;


CREATE TABLE JdoVirtual(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
count DOUBLE(16,8) NULL
, CONSTRAINT PK_JdoVirtual PRIMARY KEY (uuid)
)
;


CREATE TABLE InterviewRecord(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
interviewerUuid VARCHAR(32) NULL,
intervieweeUuid VARCHAR(32) NULL,
interviewerCampusUuid VARCHAR(32) NULL,
intervieweeCampusUuid VARCHAR(32) NULL,
interviewerDepartmentUuid VARCHAR(32) NULL,
intervieweeDepartmentUuid VARCHAR(32) NULL,
interviewerJobUuid VARCHAR(32) NULL,
intervieweeJobUuid VARCHAR(32) NULL,
createTime DATETIME NULL,
interviewDate DATETIME NULL,
interviewPurpose text NULL,
interviewContent text NULL,
interviewSummary text NULL,
ifUsing CHAR(1) NULL,
ifShow CHAR(1) NULL
, CONSTRAINT PK_InterviewRecord PRIMARY KEY (uuid)
)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_interviewerUuid FOREIGN KEY (interviewerUuid) REFERENCES Employee(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_intervieweeUuid FOREIGN KEY (intervieweeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_interviewerCampusUuid FOREIGN KEY (interviewerCampusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_intervieweeCampusUuid FOREIGN KEY (intervieweeCampusUuid) REFERENCES Campus(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_interviewerDepartmentUuid FOREIGN KEY (interviewerDepartmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_intervieweeDepartmentUuid FOREIGN KEY (intervieweeDepartmentUuid) REFERENCES Department(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_interviewerJobUuid FOREIGN KEY (interviewerJobUuid) REFERENCES Job(uuid)
;

ALTER TABLE InterviewRecord ADD CONSTRAINT FK_InterviewRecord_intervieweeJobUuid FOREIGN KEY (intervieweeJobUuid) REFERENCES Job(uuid)
;


CREATE TABLE InternetPublicity(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
recordUuid VARCHAR(32) NULL,
recordTime DATETIME NULL,
notes text NULL,
ifUsing CHAR(1) NULL,
reviewFlagUuid VARCHAR(32) NULL,
reviewComment text NULL,
reviewEmployeeUuid VARCHAR(32) NULL,
reviewTime DATETIME NULL
, CONSTRAINT PK_InternetPublicity PRIMARY KEY (uuid)
)
;

ALTER TABLE InternetPublicity ADD CONSTRAINT FK_InternetPublicity_recordUuid FOREIGN KEY (recordUuid) REFERENCES Employee(uuid)
;

ALTER TABLE InternetPublicity ADD CONSTRAINT FK_InternetPublicity_reviewFlagUuid FOREIGN KEY (reviewFlagUuid) REFERENCES ReviewState(uuid)
;

ALTER TABLE InternetPublicity ADD CONSTRAINT FK_InternetPublicity_reviewEmployeeUuid FOREIGN KEY (reviewEmployeeUuid) REFERENCES Employee(uuid)
;


CREATE TABLE Form(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
data text NULL
, CONSTRAINT PK_Form PRIMARY KEY (uuid)
)
;


CREATE TABLE EnrollmentState(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_EnrollmentState PRIMARY KEY (uuid)
)
;


CREATE TABLE EmployeePerfType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
typeUuid VARCHAR(32) NULL,
employeeUuid VARCHAR(32) NULL
, CONSTRAINT PK_EmployeePerfType PRIMARY KEY (uuid)
)
;

ALTER TABLE EmployeePerfType ADD CONSTRAINT FK_EmployeePerfType_typeUuid FOREIGN KEY (typeUuid) REFERENCES PerformanceType(uuid)
;

ALTER TABLE EmployeePerfType ADD CONSTRAINT FK_EmployeePerfType_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
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


CREATE TABLE EducateInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
sequence INT NULL,
beginDate DATETIME NULL,
endDate DATETIME NULL,
graduateSchool VARCHAR(100) NULL,
professional VARCHAR(100) NULL,
reference VARCHAR(10) NULL,
referencePhone VARCHAR(15) NULL
, CONSTRAINT PK_EducateInfo PRIMARY KEY (uuid)
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


CREATE TABLE CurTeachingExpInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
sequence INT NULL,
name VARCHAR(50) NULL,
teachingObject VARCHAR(100) NULL,
instructTimes VARCHAR(5) NULL,
teachingHours VARCHAR(5) NULL,
beginDate DATETIME NULL,
endDate DATETIME NULL
, CONSTRAINT PK_CurTeachingExpInfo PRIMARY KEY (uuid)
)
;


CREATE TABLE CourseCategoryType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_CourseCategoryType PRIMARY KEY (uuid)
)
;


CREATE TABLE Course(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
courseNo VARCHAR(20) NULL,
courseName VARCHAR(60) NULL,
courseTypeUuid VARCHAR(32) NULL,
expectedHour VARCHAR(10) NULL,
semesterTime VARCHAR(10) NULL,
expectedCost VARCHAR(10) NULL,
fitableStudent VARCHAR(100) NULL,
courseDescription text NULL,
teachingTarget text NULL,
teachingContent text NULL,
teachingFeature text NULL,
relatedMaterials VARCHAR(150) NULL,
notes VARCHAR(200) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Course PRIMARY KEY (uuid)
)
;

ALTER TABLE Course ADD CONSTRAINT FK_Course_courseTypeUuid FOREIGN KEY (courseTypeUuid) REFERENCES CourseCategoryType(uuid)
;


CREATE TABLE ContractMould(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
creatorUuid VARCHAR(32) NULL,
createTime DATETIME NULL,
content MEDIUMTEXT NULL
, CONSTRAINT PK_ContractMould PRIMARY KEY (uuid)
)
;

ALTER TABLE ContractMould ADD CONSTRAINT FK_ContractMould_creatorUuid FOREIGN KEY (creatorUuid) REFERENCES Employee(uuid)
;


CREATE TABLE Contract(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
mouldUuid VARCHAR(32) NULL,
contractNo VARCHAR(20) NULL,
recorderUuid VARCHAR(32) NULL,
signer VARCHAR(20) NULL,
signTime DATETIME NULL,
expireTime DATETIME NULL,
content MEDIUMTEXT NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Contract PRIMARY KEY (uuid)
)
;

ALTER TABLE Contract ADD CONSTRAINT FK_Contract_mouldUuid FOREIGN KEY (mouldUuid) REFERENCES ContractMould(uuid)
;

ALTER TABLE Contract ADD CONSTRAINT FK_Contract_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
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


CREATE TABLE ClassroomType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ClassroomType PRIMARY KEY (uuid)
)
;


CREATE TABLE Classroom(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
doorplate INT NULL,
address VARCHAR(50) NULL,
numberOf INT NULL,
classroomTypeUuid VARCHAR(32) NULL,
campusUuid VARCHAR(32) NULL,
remarks text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Classroom PRIMARY KEY (uuid)
)
;

ALTER TABLE Classroom ADD CONSTRAINT FK_Classroom_classroomTypeUuid FOREIGN KEY (classroomTypeUuid) REFERENCES ClassroomType(uuid)
;

ALTER TABLE Classroom ADD CONSTRAINT FK_Classroom_campusUuid FOREIGN KEY (campusUuid) REFERENCES Campus(uuid)
;


CREATE TABLE ClassManagement(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ClassManagement PRIMARY KEY (uuid)
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
maxNoP VARCHAR(5) NULL,
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


CREATE TABLE ClassEnrollment(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
arrangeClassUuid VARCHAR(32) NULL,
studentUuid VARCHAR(32) NULL,
tuitionUuid VARCHAR(32) NULL,
consultantUuid VARCHAR(32) NULL,
enrollmentTime DATETIME NULL,
ifFree CHAR(1) NULL,
enrollmentStateUuid VARCHAR(32) NULL,
quitReason VARCHAR(200) NULL,
remark VARCHAR(200) NULL
, CONSTRAINT PK_ClassEnrollment PRIMARY KEY (uuid)
)
;

ALTER TABLE ClassEnrollment ADD CONSTRAINT FK_ClassEnrollment_arrangeClassUuid FOREIGN KEY (arrangeClassUuid) REFERENCES ArrangeClass(uuid)
;

ALTER TABLE ClassEnrollment ADD CONSTRAINT FK_ClassEnrollment_studentUuid FOREIGN KEY (studentUuid) REFERENCES Student(uuid)
;

ALTER TABLE ClassEnrollment ADD CONSTRAINT FK_ClassEnrollment_tuitionUuid FOREIGN KEY (tuitionUuid) REFERENCES Tuition(uuid)
;

ALTER TABLE ClassEnrollment ADD CONSTRAINT FK_ClassEnrollment_consultantUuid FOREIGN KEY (consultantUuid) REFERENCES Consultant(uuid)
;

ALTER TABLE ClassEnrollment ADD CONSTRAINT FK_ClassEnrollment_enrollmentStateUuid FOREIGN KEY (enrollmentStateUuid) REFERENCES EnrollmentState(uuid)
;


CREATE TABLE Candidates(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
personUuid VARCHAR(32) NULL,
years INT NULL,
certificate VARCHAR(200) NULL,
post VARCHAR(200) NULL,
hobby VARCHAR(200) NULL,
pay VARCHAR(200) NULL,
inviteDate DATETIME NULL,
recruitStateUuid VARCHAR(32) NULL,
remarks text NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Candidates PRIMARY KEY (uuid)
)
;

ALTER TABLE Candidates ADD CONSTRAINT FK_Candidates_personUuid FOREIGN KEY (personUuid) REFERENCES Person(uuid)
;

ALTER TABLE Candidates ADD CONSTRAINT FK_Candidates_recruitStateUuid FOREIGN KEY (recruitStateUuid) REFERENCES RecruitState(uuid)
;


CREATE TABLE BehaviourStandardType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_BehaviourStandardType PRIMARY KEY (uuid)
)
;


CREATE TABLE BehaviourStandard(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
employeeUuid VARCHAR(32) NULL,
timesFlag VARCHAR(1) NULL,
checkDate VARCHAR(12) NULL,
recordTime DATETIME NULL,
recorderUuid VARCHAR(32) NULL,
typeUuid VARCHAR(32) NULL,
introduction VARCHAR(200) NULL
, CONSTRAINT PK_BehaviourStandard PRIMARY KEY (uuid)
)
;

ALTER TABLE BehaviourStandard ADD CONSTRAINT FK_BehaviourStandard_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE BehaviourStandard ADD CONSTRAINT FK_BehaviourStandard_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
;

ALTER TABLE BehaviourStandard ADD CONSTRAINT FK_BehaviourStandard_typeUuid FOREIGN KEY (typeUuid) REFERENCES BehaviourStandardType(uuid)
;


CREATE TABLE Authority(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
menuUuid VARCHAR(32) NULL,
userUuid VARCHAR(32) NULL
, CONSTRAINT PK_Authority PRIMARY KEY (uuid)
)
;

ALTER TABLE Authority ADD CONSTRAINT FK_Authority_menuUuid FOREIGN KEY (menuUuid) REFERENCES Menu(uuid)
;

ALTER TABLE Authority ADD CONSTRAINT FK_Authority_userUuid FOREIGN KEY (userUuid) REFERENCES User(uuid)
;


CREATE TABLE AttendanceType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_AttendanceType PRIMARY KEY (uuid)
)
;


CREATE TABLE Attendance(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
employeeUuid VARCHAR(32) NULL,
timesFlag VARCHAR(1) NULL,
checkDate VARCHAR(12) NULL,
recordTime DATETIME NULL,
recorderUuid VARCHAR(32) NULL,
typeUuid VARCHAR(32) NULL,
introduction VARCHAR(200) NULL
, CONSTRAINT PK_Attendance PRIMARY KEY (uuid)
)
;

ALTER TABLE Attendance ADD CONSTRAINT FK_Attendance_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Attendance ADD CONSTRAINT FK_Attendance_recorderUuid FOREIGN KEY (recorderUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Attendance ADD CONSTRAINT FK_Attendance_typeUuid FOREIGN KEY (typeUuid) REFERENCES AttendanceType(uuid)
;


CREATE TABLE Assessment(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
employeeUuid VARCHAR(32) NULL,
month INT NULL,
assessmentTime DATETIME NULL,
evaluation text NULL,
evaluationTime DATETIME NULL,
opinion text NULL,
leaderUuid VARCHAR(32) NULL,
opinionTime DATETIME NULL,
attendance INT NULL,
duty INT NULL,
cost INT NULL,
diligence INT NULL,
standard INT NULL,
skill INT NULL,
capacity INT NULL,
plan INT NULL,
communicate INT NULL,
execution INT NULL,
expand INT NULL,
complete INT NULL,
efficiency INT NULL,
quality INT NULL,
targetCompletion INT NULL,
resultsUuid VARCHAR(32) NULL,
score INT NULL,
remarks VARCHAR(200) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_Assessment PRIMARY KEY (uuid)
)
;

ALTER TABLE Assessment ADD CONSTRAINT FK_Assessment_employeeUuid FOREIGN KEY (employeeUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Assessment ADD CONSTRAINT FK_Assessment_leaderUuid FOREIGN KEY (leaderUuid) REFERENCES Employee(uuid)
;

ALTER TABLE Assessment ADD CONSTRAINT FK_Assessment_resultsUuid FOREIGN KEY (resultsUuid) REFERENCES ResultType(uuid)
;


CREATE TABLE ArrangeClassTimeInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
arrangeClsDate DATETIME NULL
, CONSTRAINT PK_ArrangeClassTimeInfo PRIMARY KEY (uuid)
)
;


CREATE TABLE ApprovalAuthorityType(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL,
sequence VARCHAR(2) NULL,
fullSequence VARCHAR(5) NULL
, CONSTRAINT PK_ApprovalAuthorityType PRIMARY KEY (uuid)
)
;


CREATE TABLE ApprovalAuthority(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
authorityUuid VARCHAR(32) NULL,
userUuid VARCHAR(32) NULL
, CONSTRAINT PK_ApprovalAuthority PRIMARY KEY (uuid)
)
;

ALTER TABLE ApprovalAuthority ADD CONSTRAINT FK_ApprovalAuthority_authorityUuid FOREIGN KEY (authorityUuid) REFERENCES ApprovalAuthorityType(uuid)
;

ALTER TABLE ApprovalAuthority ADD CONSTRAINT FK_ApprovalAuthority_userUuid FOREIGN KEY (userUuid) REFERENCES User(uuid)
;


CREATE TABLE ApplyInfo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
bizDataUuid VARCHAR(32) NULL,
applicantUuid VARCHAR(32) NULL,
stateUuid VARCHAR(32) NULL,
joinStateUuid VARCHAR(32) NULL,
curriculum text NULL,
effect text NULL,
situation text NULL,
suggest text NULL
, CONSTRAINT PK_ApplyInfo PRIMARY KEY (uuid)
)
;

ALTER TABLE ApplyInfo ADD CONSTRAINT FK_ApplyInfo_applicantUuid FOREIGN KEY (applicantUuid) REFERENCES Employee(uuid)
;

ALTER TABLE ApplyInfo ADD CONSTRAINT FK_ApplyInfo_stateUuid FOREIGN KEY (stateUuid) REFERENCES ExaminationState(uuid)
;

ALTER TABLE ApplyInfo ADD CONSTRAINT FK_ApplyInfo_joinStateUuid FOREIGN KEY (joinStateUuid) REFERENCES JoinState(uuid)
;


CREATE TABLE ApplicationNo(
uuid VARCHAR(32) NOT NULL,
timeStamp BIGINT NOT NULL DEFAULT 1,
ifHasChild CHAR(1) NULL,
description VARCHAR(50) NULL,
parentUuid VARCHAR(32) NULL,
ifUsing CHAR(1) NULL
, CONSTRAINT PK_ApplicationNo PRIMARY KEY (uuid)
)
;


