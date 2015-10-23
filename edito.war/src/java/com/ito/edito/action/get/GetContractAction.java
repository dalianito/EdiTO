package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.Contract;
import com.ito.fai.util.JndiFactory;

public class GetContractAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			Contract contract = contractService.selectContractByUuid(uuid);
			request.setAttribute("contract", contract);
		}
	}
}
