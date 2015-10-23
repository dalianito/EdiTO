package com.ito.edito.action.update;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.ContractMould;
import com.ito.fai.util.JndiFactory;

public class UpdateContractMouldAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");
		String uuid = request.getParameter("uuid");

		ContractMould contractMould = contractService.selectContractMouldByUuid(uuid);
		contractMould.setIfUsing(false);

		ut.begin();
		try {
			contractService.updateContractMould(contractMould, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
