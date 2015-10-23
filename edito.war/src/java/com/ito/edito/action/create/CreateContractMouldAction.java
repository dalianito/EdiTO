package com.ito.edito.action.create;

import java.util.Date;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Contract.ContractService;
import com.ito.edito.schema.ContractMould;
import com.ito.fai.util.JndiFactory;

public class CreateContractMouldAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		ContractService contractService = (ContractService) JndiFactory.lookup("contractService");

		ContractMould contractMould = (ContractMould) carrier.fetchInstance("ContractMould");
		contractMould.setIfHasChild(false);
		contractMould.setIfUsing(true);
		contractMould.setCreateTime(new Date());
		contractMould.setCreatorUuid(EMPLOYEE.getUuid(), false);

		ut.begin();
		if (contractMould.getUuid() != null) {
			contractService.updateContractMould(contractMould, USER.getAccount());
		}
		else {
			contractService.insertContractMould(contractMould, USER.getAccount());
		}
		ut.commit();
	}
}
