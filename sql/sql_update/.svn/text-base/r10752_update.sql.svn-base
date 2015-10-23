ALTER TABLE `edito`.`Person` 
ADD COLUMN `estAge` INT NULL DEFAULT NULL COMMENT '' AFTER `ifUsing`,
ADD COLUMN `employmentStatusUuid` VARCHAR(32) NULL COMMENT '' AFTER `estAge`,
ADD COLUMN `employer` VARCHAR(60) NULL COMMENT '' AFTER `employmentStatusUuid`;

ALTER TABLE `edito`.`Student` 
DROP COLUMN `ifUsing`,
DROP COLUMN `introduction`,
DROP COLUMN `summary`,
DROP COLUMN `toDate`,
DROP COLUMN `fromDate`,
ADD COLUMN `studentID` VARCHAR(20) NULL COMMENT '' AFTER `personUuid`,
ADD COLUMN `note` VARCHAR(200) NULL COMMENT '' AFTER `studentID`;


CREATE TABLE EmploymentStatus(
	uuid VARCHAR(32) NOT NULL,
	timeStamp BIGINT NOT NULL DEFAULT 1,
	ifHasChild CHAR(1) NULL,
	description VARCHAR(50) NULL,
	parentUuid VARCHAR(32) NULL,
	ifUsing CHAR(1) NULL
	, CONSTRAINT PK_EmploymentStatus PRIMARY KEY (uuid)
);
