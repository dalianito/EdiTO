package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.Contract;
import com.ito.fai.util.JndiFactory;

public class UpdateContractAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");
		String uuid = request.getParameter("uuid");

		Contract contract = contractService.selectContractByUuid(uuid);
		contract.setIfUsing(false);

		ut.begin();
		try {
			contractService.updateContract(contract, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
