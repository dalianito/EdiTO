package com.ito.edito.ejb.Contract;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Contract;
import com.ito.edito.schema.ContractMould;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>ContractMould_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * ContractMould<br>
 * Contract<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

public interface ContractService {
	/**
	 * <b>创建合同模板</b>
	 * 
	 * @param contractMould ContractMould对象
	 * @param userName 执行者的账户名
	 * @return 创建的ContractMould的uuid
	 */
	public String insertContractMould(ContractMould contractMould, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新合同模板</b>
	 * 
	 * @param contractMould ContractMould对象
	 * @param userName 执行者的账户名
	 */
	public void updateContractMould(ContractMould contractMould, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询合同模板(uuid)</b>
	 * 
	 * @param uuid ContractMould的uuid
	 * @return 查询到的ContractMould
	 */
	public ContractMould selectContractMouldByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询合同模板</b>
	 * 
	 * @param constraint ContractMould的约束条件
	 * @return 查询到的ContractMould
	 */
	public ContractMould selectContractMould(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询合同模板(list)</b>
	 * 
	 * @param constraint ContractMould的约束条件
	 * @return 查询到的ContractMould的list
	 */
	public List<ContractMould> selectContractMoulds(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>创建合同</b>
	 * 
	 * @param contract Contract对象
	 * @param userName 执行者的账户名
	 * @return 创建的Contract的uuid
	 */
	public String insertContract(Contract contract, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新合同</b>
	 * 
	 * @param contract Contract对象
	 * @param userName 执行者的账户名
	 */
	public void updateContract(Contract contract, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询合同(uuid)</b>
	 * 
	 * @param uuid Contract的uuid
	 * @return 查询到的Contract
	 */
	public Contract selectContractByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询合同</b>
	 * 
	 * @param constraint Contract的约束条件
	 * @return 查询到的Contract
	 */
	public Contract selectContract(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询合同(list)</b>
	 * 
	 * @param constraint Contract的约束条件
	 * @return 查询到的Contract的list
	 */
	public List<Contract> selectContracts(Constraint constraint) throws Exception, RemoteException;
}
