package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.OrderGenerate;
import com.ito.edito.schema.Person;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryOrderAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		String materialTypeUuid = request.getParameter("materialTypeUuid");
		String generator = request.getParameter("generator");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");
		String sql = "select distinct O.* from OrderGenerate O ,Material M ,MaterialType MT ,Employee E ,Person P ";
		sql += "where E.personUuid = P.uuid and E.uuid = O.generatorUuid and M.uuid = O.materialUuid  and M.typeUuid = MT.uuid and E.ifUsing = true and P.ifUsing = true and M.ifUsing = true and O.ifUsing = true ";
		if (materialTypeUuid != null && materialTypeUuid.length() > 0) {
			sql += " and MT.uuid = '" + materialTypeUuid + "' ";
		}
		if (generator != null && generator.length() > 0) {
			sql += " and P.name like '%" + generator + "%' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sql += " and O.generateTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and O.generateTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}
		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from OrderGenerate O where O.ifUsing = true) as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;
		Constraint c1 = new Constraint("OrderGenerate");
		c1.addSQLCondition(sql, null);

		List<OrderGenerate> orderGeneratesTemp = materialService.selectOrderGenerates(c1);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < orderGeneratesTemp.size(); i++) {
			String ifReceipt = "receipt";
			OrderGenerate orderGenerate = orderGeneratesTemp.get(i);
			Employee employee = orderGenerate.getGenerator();
			Person person = employee.getPerson();
			String orderGenerateUuid = orderGenerate.getUuid();
			Constraint c = new Constraint("OfficeApplicationInfo");
			c.addCondition("orderGenerateUuid", orderGenerateUuid);
			List<OfficeApplicationInfo> officeApplicationInfosTemp = materialService.selectOfficeApplicationInfos(c);
			for(int j = 0; j < officeApplicationInfosTemp.size(); j++){
				OfficeApplicationInfo officeApplicationInfo = officeApplicationInfosTemp.get(j);
				if((officeApplicationInfo.getStateUuid()!=null)
						&&(officeApplicationInfo.getReceipStateUuid()!=null)
						&&(officeApplicationInfo.getStateUuid().equals(Constants.EXAMINATION_STATE_PASSED))
						&&(officeApplicationInfo.getReceipStateUuid().equals(Constants.RECEIPT_STATE_UNDONE))){
					ifReceipt = "unReceipt";
				}
			}
			
			String[] str = new String[11];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = orderGenerate.getMaterialUuid() == null ? "" : orderGenerate.getMaterial().getType().getDescription();
			str[2] = orderGenerate.getMaterialUuid() == null ? "" : orderGenerate.getMaterial().getMaterialNo();
			str[3] = orderGenerate.getMaterialUuid() == null ? "" : orderGenerate.getMaterial().getSpecification();
			str[4] = orderGenerate.getMaterialUuid() == null ? "" : orderGenerate.getMaterial().getUnit();
			str[5] = String.valueOf(orderGenerate.getMaterialAmount()) == null ? "" : String.valueOf(orderGenerate.getMaterialAmount());// 通过申请数
			str[6] = person.getName() == null ? "" : person.getName();// 生成人
			str[7] = orderGenerate.getGenerateTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(orderGenerate.getGenerateTime());// 生成时间
			str[8] = orderGenerate.getUuid();
			str[9] = ifReceipt;// 验收状态
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
