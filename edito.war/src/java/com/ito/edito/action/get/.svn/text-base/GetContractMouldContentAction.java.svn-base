package com.ito.edito.action.get;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.ContractMould;
import com.ito.fai.util.JndiFactory;

public class GetContractMouldContentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		String uuid = request.getParameter("uuid");

		if (uuid != null && uuid.length() > 0) {
			ContractMould contractMould = contractService.selectContractMouldByUuid(uuid);
			setResponseText(contractMould.getContent());
		}
	}
}
