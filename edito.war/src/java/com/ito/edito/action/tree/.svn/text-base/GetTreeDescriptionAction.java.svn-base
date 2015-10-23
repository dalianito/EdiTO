package com.ito.edito.action.tree;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.BaseData.BaseDataService;
import com.ito.edito.schema.BaseData;
import com.ito.fai.util.JndiFactory;

public class GetTreeDescriptionAction extends AjaxAction {

	public void executeAutoUT() throws Exception {
		String uuid = request.getParameter("uuid");
		String nodeLevel = request.getParameter("nodeLevel");

		BaseDataService baseDataService = (BaseDataService) JndiFactory.lookup("baseDataService");

		StringBuffer sb = new StringBuffer();

		BaseData bd = baseDataService.selectBaseDataByUuid(uuid);
		if (nodeLevel.equals("all")) {
			for (BaseData parent = bd.getParent(); parent != null;) {
				sb.insert(0, " ");
				sb.insert(0, parent.getDescription());
				parent = parent.getParent();
			}
		}
		sb.append(bd.getDescription());
		setResponseText(sb.toString());
	}
}
