package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.ContractMould;
import com.ito.fai.util.JndiFactory;

public class GetContractMouldAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		String uuid = request.getParameter("uuid");

		if (uuid != null) {
			ContractMould contractMould = contractService.selectContractMouldByUuid(uuid);
			request.setAttribute("contractMould", contractMould);
		}
	}
}
