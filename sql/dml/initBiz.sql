##########################################
# edito 初始化业务数据
##########################################

# Department
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000010', 0, '校长', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000020', 0, '校长助理', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000030', 0, '行政副校长', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000040', 0, '教学副校长', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000050', 0, '财务处', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000060', 1, '校办公室', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000070', 0, '总务部', '11000000010010001000000000000060', 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000080', 0, '人力资源处', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000090', 0, '招生就业处', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000100', 1, '学生处', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000110', 0, '舍务部', '11000000010010001000000000000100', 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000120', 0, '资产处', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000130', 0, '教务处', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000140', 0, '黑石礁分校', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000150', 0, '青泥洼分校', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000160', 0, '三八分校', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000170', 0, '千山路分校', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000180', 0, '沙河口分校', null, 1);
insert into Department (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010010001000000000000190', 0, '罗斯福分校', null, 1);

# Job
insert into Job (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010190001000000000000000', 0, '元合', null, 0);
insert into Job (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010190001000000000000010', 0, '系统管理员', null, 1);
insert into Job (uuid, ifHasChild, description, parentUuid, ifUsing)
values ('11000000010190001000000000000020', 0, '人力资源', null, 1);

# Person
insert into Person (uuid, personNo, name, genderUuid, birthDate, idNo, educationUuid,  cellPhone,  email, ifUsing)
values ('11000000010020001000000000000000', '00000', '元合', '10000000010020001001000000000010', '2014-01-01 00:00:00', '210104199001011234', '10000000010050001001000000000010', '13912345678', 'test@ito.com.cn', 1);

# Employee
insert into Employee (uuid, personUuid, jobUuid, departmentUuid, workPhone, fromDate, workingStateUuid, ifUsing)
values ('11000000010050001000000000000000', '11000000010020001000000000000000', '11000000010190001000000000000000', '11000000010010001000000000000080', '12345678', '2014-01-01 00:00:00', '10000000010140001001000000000010', 1);

# User
insert into User (uuid, account, password, personUuid, ifUsing)
values ('11000000010040001000000000000000', 'test', 'test', '11000000010020001000000000000000', 1);

# Menu
# 内部资源规划平台
# 根目录
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000100000', 'human_manage', '人力资源管理', null, '01', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000200000', 'campus_manage', '校区管理', null, '02', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000300000', 'material_manage', '物资管理', null, '03', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000400000', 'approval_manage', '审批管理', null, '04', '/pages/resource/approval/manage/query_approval_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000500000', 'performance_manage', '绩效管理', null, '05', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000600000', 'system_manage', '系统管理', null, '06', null, 'resource');

# 人力资源管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000101000', 'employee_manage', '员工信息管理', '11000000010030001000000000100000', '01', '/pages/resource/human/manage/employee/manage/query_employee_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000102000', 'department_manage', '组织机构管理', '11000000010030001000000000100000', '02', '/pages/resource/human/manage/department/manage/query_department_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000103000', 'job_manage', '岗位管理', '11000000010030001000000000100000', '03', '/pages/resource/human/manage/job/manage/query_job_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000104000', 'apply_manage', '申请管理', '11000000010030001000000000100000', '04', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000104010', 'recruitment_apply', '人员需求申请', '11000000010030001000000000104000', '01', '/pages/resource/human/manage/apply/manage/recruitment/apply/query_recruitment_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000104020', 'relationship_apply', '关系调动申请', '11000000010030001000000000104000', '02', '/pages/resource/human/manage/apply/manage/relationship/apply/query_relationship_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000104030', 'quit_apply', '员工离职申请', '11000000010030001000000000104000', '03', '/pages/resource/human/manage/apply/manage/quit/apply/query_quit_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000104040', 'apply_inquiry', '申请查询', '11000000010030001000000000104000', '04', '/pages/resource/human/manage/apply/manage/apply/inquiry/query_apply_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000105000', 'recruit_manage', '招聘管理', '11000000010030001000000000100000', '05', '/pages/resource/human/manage/recruit/manage/query_recruit_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000106000', 'probation_manage', '员工转正管理', '11000000010030001000000000100000', '06', '/pages/resource/human/manage/probation/manage/query_probation_assessment.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000107000', 'self_assess', '员工自评管理', '11000000010030001000000000100000', '07', '/pages/resource/human/manage/self/assessment/query_employee_assess.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000108000', 'interview_manage', '员工面谈管理', '11000000010030001000000000100000', '08', '/pages/resource/human/manage/interview/manage/query_interview_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000109000', 'leave_manage', '员工请假管理', '11000000010030001000000000100000', '09', '/pages/resource/human/manage/leave/manage/query_leave_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000110000', 'mistake_manage', '员工差错管理', '11000000010030001000000000100000', '10', '/pages/resource/human/manage/mistake/manage/query_mistake_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000111000', 'relation_manage', '员工关系管理', '11000000010030001000000000100000', '11', '/pages/resource/human/manage/relation/manage/query_relation_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000112000', 'quit_manage', '员工离职管理', '11000000010030001000000000100000', '12', '/pages/resource/human/manage/quit/manage/query_quit_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000113000', 'training_manage', '培训管理', '11000000010030001000000000100000', '13', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000113010', 'training_plan', '培训计划', '11000000010030001000000000106000', '01', '/pages/resource/human/manage/training/manage/training/plan/query_training_plan.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000113020', 'training_manage', '培训人员', '11000000010030001000000000106000', '02', '/pages/resource/human/manage/training/manage/training/manage/query_training_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000113030', 'training_summary', '培训总结', '11000000010030001000000000106000', '03', '/pages/resource/human/manage/training/manage/training/summary/query_training_summary.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000114000', 'contract_manage', '合同管理', '11000000010030001000000000100000', '14', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000114010', 'mould_manage', '合同模板管理', '11000000010030001000000000114000', '01', '/pages/resource/human/manage/contract/manage/mould/manage/query_mould_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000114020', 'info_manage', '合同信息管理', '11000000010030001000000000114000', '02', '/pages/resource/human/manage/contract/manage/info/manage/query_info_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000114030', 'expire_manage', '合同期限管理', '11000000010030001000000000114000', '03', '/pages/resource/human/manage/contract/manage/expire/manage/query_expire_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000115000', 'left_manage', '离职员工管理', '11000000010030001000000000100000', '15', '/pages/resource/human/manage/left/manage/query_left_manage.html', 'resource');


# 校区管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000201000', 'campus_resource', '校区资源', '11000000010030001000000000200000', '01', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000201010', 'employee_info', '员工信息', '11000000010030001000000000201000', '01', '/pages/resource/campus/manage/campus/resource/employee/info/query_employee_info.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000201020', 'classroom_manage', '教室管理', '11000000010030001000000000201000', '02', '/pages/resource/campus/manage/campus/resource/classroom/manage/query_classroom_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202000', 'campus_human', '校区人力', '11000000010030001000000000200000', '02', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202010', 'attendance_record', '考勤记录', '11000000010030001000000000202000', '01', '/pages/resource/campus/manage/campus/human/attendance/record/query_attendance_record.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202020', 'behavior_record', '行为规范', '11000000010030001000000000202000', '02', '/pages/resource/campus/manage/campus/human/behavior/record/query_behavior_record.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202030', 'work_review', '工作日志审阅', '11000000010030001000000000202000', '03', '/pages/resource/campus/manage/campus/human/work/review/query_work_review.', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202040', 'network_review', '网络宣传审阅 ', '11000000010030001000000000202000', '04', '/pages/resource/campus/manage/campus/human/network/review/query_network_review.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202050', 'work_inquiry', '工作日志总览', '11000000010030001000000000202000', '05', '/pages/resource/campus/manage/campus/human/work/inquiry/query_work_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202060', 'network_inquiry', '网络宣传总览', '11000000010030001000000000202000', '06', '/pages/resource/campus/manage/campus/human/network/inquiry/query_network_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202070', 'attendance_inquiry', '考勤记录总览', '11000000010030001000000000202000', '07', '/pages/resource/campus/manage/campus/human/attendance/inquiry/query_attendance_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000202080', 'behavior_inquiry', '行为规范总览', '11000000010030001000000000202000', '08', '/pages/resource/campus/manage/campus/human/behavior/inquiry/query_behavior_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000203000', 'campus_publicity', '校区市场活动', '11000000010030001000000000200000', '03', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000203010', 'publicity_apply', '活动申请', '11000000010030001000000000203000', '01', '/pages/resource/campus/manage/campus/publicity/publicity/apply/query_apply_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000203020', 'publicity_assess', '活动评估', '11000000010030001000000000203000', '02', '/pages/resource/campus/manage/campus/publicity/publicity/assess/query_publicity_assess.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204000', 'my_campus', '我的校区', '11000000010030001000000000200000', '04', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204010', 'work_record', '工作日志', '11000000010030001000000000204000', '01', '/pages/resource/campus/manage/my/campus/work/record/query_work_record.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204020', 'network_propaganda', '网络宣传', '11000000010030001000000000204000', '02', '/pages/resource/campus/manage/my/campus/network/propaganda/query_network_propaganda.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204030', 'leave_apply', '请假申请', '11000000010030001000000000204000', '03', '/pages/resource/campus/manage/my/campus/leave/apply/query_leave_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204040', 'relationships_apply', '调动申请', '11000000010030001000000000204000', '04', '/pages/resource/campus/manage/my/campus/relationships/apply/query_relationships_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204050', 'quits_apply', '离职申请', '11000000010030001000000000204000', '05', '/pages/resource/campus/manage/my/campus/quits/apply/query_quits_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204060', 'self_assess', '月度自评', '11000000010030001000000000204000', '06', '/pages/resource/campus/manage/my/campus/self/assess/query_employee_assess.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204070', 'performance_inquiry', '绩效查询', '11000000010030001000000000204000', '07', '/pages/resource/campus/manage/my/campus/performance/inquiry/query_performance_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204080', 'training_program', '培训规划', '11000000010030001000000000204000', '08', '/pages/resource/campus/manage/my/campus/training/program/query_training_program.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204090', 'regular_apply', '转正申请', '11000000010030001000000000204000', '09', '/pages/resource/campus/manage/my/campus/regular/apply/query_regular_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204100', 'interview_record', '面谈记录', '11000000010030001000000000204000', '10', '/pages/resource/campus/manage/my/campus/interview/record/query_interview_record.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000204110', 'month_assess', '月度考核', '11000000010030001000000000204000', '11', '/pages/resource/campus/manage/my/campus/month/assess/query_month_assess.html', 'resource');

# 物资管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000301000', 'type_manage', '物资类别管理', '11000000010030001000000000300000', '01', '/pages/resource/material/manage/type/manage/query_type_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000302000', 'material_generate', '物资信息管理', '11000000010030001000000000300000', '02', '/pages/resource/material/manage/material/generate/query_material_generate.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000303000', 'list_manage', '供方名录管理', '11000000010030001000000000300000', '03', '/pages/resource/material/manage/list/manage/query_list_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000304000', 'apply_manage', '申请管理', '11000000010030001000000000300000', '04', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000304010', 'material_apply', '采购申请', '11000000010030001000000000304000', '01', '/pages/resource/material/manage/apply/manage/material/apply/query_material_apply.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000304020', 'apply_inquiry', '申请查询', '11000000010030001000000000304000', '02', '/pages/resource/material/manage/apply/manage/apply/inquiry/query_apply_inquiry.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000305000', 'material_accept', '物资验收管理', '11000000010030001000000000300000', '05', null, 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000305010', 'order_generate', '采购单生成', '11000000010030001000000000305000', '01', '/pages/resource/material/manage/material/accept/order/generate/query_order_generate.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000305020', 'order_manage', '采购单管理', '11000000010030001000000000305000', '02', '/pages/resource/material/manage/material/accept/order/manage/query_order_manage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000305030', 'material_import', '物资验收', '11000000010030001000000000305000', '03', '/pages/resource/material/manage/material/accept/material/import/query_material_import.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000306000', 'material_usage', '物资使用', '11000000010030001000000000300000', '06', '/pages/resource/material/manage/material/usage/query_material_usage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000307000', 'material_allocate', '物资调配', '11000000010030001000000000300000', '07', '/pages/resource/material/manage/material/allocate/query_material_allocate.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000308000', 'material_damage', '物资报废', '11000000010030001000000000300000', '08', '/pages/resource/material/manage/material/damage/query_material_damage.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000309000', 'material_list', '物资清单', '11000000010030001000000000300000', '09', '/pages/resource/material/manage/material/list/query_material_list.html', 'resource');

# 绩效管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000501000', 'job_performance', '岗位绩效设置', '11000000010030001000000000500000', '01', '/pages/resource/performance/manage/job/performance/query_job_performance.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000502000', 'performance_calculate', '员工绩效考核', '11000000010030001000000000500000', '02', '/pages/resource/performance/manage/performance/calculate/query_performance_calculate.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000503000', 'performance_inquiry', '员工绩效查询', '11000000010030001000000000500000', '03', '/pages/resource/performance/manage/performance/inquiry/query_performance_inquiry.html', 'resource');

# 系统管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000601000', 'job_authority', '岗位权限管理', '11000000010030001000000000600000', '01', '/pages/resource/system/manage/job/authority/query_job_authority.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000602000', 'authority_manage', '审批权限管理', '11000000010030001000000000600000', '02', '/pages/resource/system/manage/authority/manage/query_authority.html', 'resource');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030001000000000603000', 'campus_info', '校区信息管理', '11000000010030001000000000600000', '03', '/pages/resource/system/manage/campus/info/query_campus_info.html', 'resource');


# 教学内容配置平台
# 根目录
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000200000', 'teacher_manage', '教师管理', null, '02', null, 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000300000', 'course_manage', '课程管理', null, '03', null, 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000600000', 'resources_manage', '教学资源管理', null, '06', null, 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000700000', 'student_manage', '学生管理', null, '07', null, 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000800000', 'consult_manage', '招生咨询', null, '08', null, 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000900000', 'class_manage', '班级管理', null, '09', null, 'content');

# 教师管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000201000', 'full_time', '全职教师查看', '11000000010030002000000000200000', '01', '/pages/content/teacher/manage/full/time/query_full_time.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000202000', 'part_time', '兼职教师查看', '11000000010030002000000000200000', '02', '/pages/content/teacher/manage/part/time/query_part_time.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000203000', 'post_teacher', '教师离岗查看', '11000000010030002000000000200000', '03', '/pages/content/teacher/manage/post/teacher/query_post_teacher.html', 'content');

# 课程管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000301000', 'course_apply', '排课申请', '11000000010030002000000000300000', '01', '/pages/content/course/manage/course/apply/query_course_apply.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000302000', 'course_inquiry', '课程管理', '11000000010030002000000000300000', '02', '/pages/content/course/manage/course/inquiry/query_course_inquiry.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000303000', 'course_table', '课程表', '11000000010030002000000000300000', '03', '/pages/content/course/manage/course/table/query_course_table.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000304000', 'course_type', '课程类别管理', '11000000010030002000000000300000', '04', '/pages/content/course/manage/course/type/query_course_type.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000305000', 'class_management', '班型管理', '11000000010030002000000000300000', '05', '/pages/content/course/manage/course/management/query_class_management.html', 'content');

# 教学资源管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000601000', 'class_resource', '教室资源管理', '11000000010030002000000000600000', '01', '/pages/content/resources/manage/class/manage/query_class_manage.html', 'content');

# 学生管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000701020', 'student_info', '学生信息', '11000000010030002000000000700000', '01', '/pages/content/student/manage/student/info/query_students.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000703000', 'student_apply', '报名', '11000000010030002000000000700000', '03', '/pages/content/student/manage/student/enrollment/query_enrollment.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000704000', 'student_quit', '退班', '11000000010030002000000000700000', '04', '/pages/content/student/manage/student/quit/query_quit.html', 'content');

# 招生咨询
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801050', 'my_dashboard', '我的工作', '11000000010030002000000000800000', '00', '/pages/content/consult/manage/consultant/dashboard.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801000', 'student_consult', '学生咨询', '11000000010030002000000000800000', '01', '/pages/content/consult/manage/communication/consult_student.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801010', 'consult_manage', '基表设置', '11000000010030002000000000800000', '02', '/pages/content/consult/manage/consult/manage/default_options.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801020', 'my_communications', '我的咨询', '11000000010030002000000000800000', '03', '/pages/content/consult/manage/communication/my_communications.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801030', 'my_todo_follow_ups', '我的待回访', '11000000010030002000000000800000', '04', '/pages/content/consult/manage/communication/my_todo_follow_ups.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000801040', 'manage_consultants', '管理咨询师', '11000000010030002000000000800000', '05', '/pages/content/consult/manage/consultant/manage_consultants.html', 'content');
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000802010', 'admin_dashboard', '业务总览', '11000000010030002000000000800000', '06', '/pages/content/consult/manage/admin/dashboard.html', 'content');

# 班级管理
insert into Menu (uuid, id, description, parentUuid, sequence, link, stationName)
values ('11000000010030002000000000901000', 'query_class', '查找班级', '11000000010030002000000000900000', '01', '/pages/content/class/manage/query/class/query_class.html', 'content');

# JobAuthority
insert into JobAuthority (uuid, menuUuid, jobUuid)
values ('11000000070040001000000000000010', '11000000010030001000000000600000', '11000000010190001000000000000000');
insert into JobAuthority (uuid, menuUuid, jobUuid)
values ('11000000070040001000000000000020', '11000000010030001000000000601000', '11000000010190001000000000000000');

# ServiceConfiguration
insert into ServiceConfiguration (uuid, entity, attribution, content, ifUsing,ifShow)
values ('11000000080010001000000000000010', 'Wechat', 'accessTokenStr', null, 1,1);


# DefaultOption
insert into DefaultOption (uuid, entity, attribute, description, ifUsing)
values ('22000000020030001000000000100000', 'consult', 'communication_type', '学生咨询', 0);
insert into DefaultOption (uuid, entity, attribute, description, ifUsing)
values ('22000000020030001000000000200000', 'consult', 'communication_type', '回访记录', 0);