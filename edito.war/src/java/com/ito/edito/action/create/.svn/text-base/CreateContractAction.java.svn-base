package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.Contract;
import com.ito.fai.util.JndiFactory;

public class CreateContractAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		Contract contract = (Contract) carrier.fetchInstance("Contract");
		contract.setRecorderUuid(EMPLOYEE.getUuid(), false);
		contract.setSignTime(new Date());
		contract.setIfUsing(true);

		ut.begin();
		if (contract.getUuid() != null) {
			contractService.updateContract(contract, USER.getAccount());
		}
		else {
			contractService.insertContract(contract, USER.getAccount());
		}
		ut.commit();
	}
}
