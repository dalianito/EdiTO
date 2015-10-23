package com.ito.edito.ejb.Contract;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.Contract;
import com.ito.edito.schema.ContractMould;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>ContractMould_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * ContractMould<br>
 * Contract<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class ContractServiceBean extends CastorDataManager implements ContractServiceRemote {
	/**
	 * <b>创建合同模板</b>
	 * 
	 * @param contractMould ContractMould对象
	 * @param userName 执行者的账户名
	 * @return 创建的ContractMould的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertContractMould(ContractMould contractMould, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(contractMould, userName);
	}

	/**
	 * <b>更新合同模板</b>
	 * 
	 * @param contractMould ContractMould对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateContractMould(ContractMould contractMould, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(contractMould, userName);
	}

	/**
	 * <b>查询合同模板(uuid)</b>
	 * 
	 * @param uuid ContractMould的uuid
	 * @return 查询到的ContractMould
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ContractMould selectContractMouldByUuid(String uuid) throws Exception, RemoteException {
		return (ContractMould) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询合同模板</b>
	 * 
	 * @param constraint ContractMould的约束条件
	 * @return 查询到的ContractMould
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public ContractMould selectContractMould(Constraint constraint) throws Exception, RemoteException {
		return (ContractMould) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询合同模板(list)</b>
	 * 
	 * @param constraint ContractMould的约束条件
	 * @return 查询到的ContractMould的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<ContractMould> selectContractMoulds(Constraint constraint) throws Exception, RemoteException {
		return (List<ContractMould>) DataManagerStatic.getInstances(constraint);
	}

	/**
	 * <b>创建合同</b>
	 * 
	 * @param contract Contract对象
	 * @param userName 执行者的账户名
	 * @return 创建的Contract的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertContract(Contract contract, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(contract, userName);
	}

	/**
	 * <b>更新合同</b>
	 * 
	 * @param contract Contract对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateContract(Contract contract, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(contract, userName);
	}

	/**
	 * <b>查询合同(uuid)</b>
	 * 
	 * @param uuid Contract的uuid
	 * @return 查询到的Contract
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Contract selectContractByUuid(String uuid) throws Exception, RemoteException {
		return (Contract) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询合同</b>
	 * 
	 * @param constraint Contract的约束条件
	 * @return 查询到的Contract
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Contract selectContract(Constraint constraint) throws Exception, RemoteException {
		return (Contract) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询合同(list)</b>
	 * 
	 * @param constraint Contract的约束条件
	 * @return 查询到的Contract的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Contract> selectContracts(Constraint constraint) throws Exception, RemoteException {
		return (List<Contract>) DataManagerStatic.getInstances(constraint);
	}
}
