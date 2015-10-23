ALTER TABLE `edito`.`Person` 
DROP COLUMN `employer`,
DROP COLUMN `employmentStatusUuid`,
DROP COLUMN `estAge`;

ALTER TABLE `edito`.`Student` 
DROP COLUMN `note`,
DROP COLUMN `studentID`,
ADD COLUMN `fromDate` DATETIME NULL COMMENT '' AFTER `personUuid`,
ADD COLUMN `toDate` DATETIME NULL COMMENT '' AFTER `fromDate`,
ADD COLUMN `summary` VARCHAR(200) NULL COMMENT '' AFTER `toDate`,
ADD COLUMN `introduction` TEXT NULL COMMENT '' AFTER `summary`,
ADD COLUMN `ifUsing` CHAR(1) NULL COMMENT '' AFTER `introduction`;

DROP TABLE `edito`.`EmploymentStatus`;
