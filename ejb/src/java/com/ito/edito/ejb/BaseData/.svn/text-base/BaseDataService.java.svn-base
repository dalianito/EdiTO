package com.ito.edito.ejb.BaseData;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.BaseData;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>BaseData_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * 所有基表<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

public interface BaseDataService {
	/**
	 * <b>创建基表数据</b>
	 * 
	 * @param baseData BaseData对象
	 * @param userName 执行者的账户名
	 * @return 创建的BaseData的uuid
	 */
	public String insertBaseData(BaseData baseData, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新基表数据</b>
	 * 
	 * @param baseData BaseData对象
	 * @param userName 执行者的账户名
	 */
	public void updateBaseData(BaseData baseData, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询基表数据(uuid)</b>
	 * 
	 * @param uuid BaseData的uuid
	 * @return 查询到的BaseData
	 */
	public BaseData selectBaseDataByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询基表数据</b>
	 * 
	 * @param constraint BaseData的约束条件
	 * @return 查询到的BaseData
	 */
	public BaseData selectBaseData(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询基表数据(list)</b>
	 * 
	 * @param constraint BaseData的约束条件
	 * @return 查询到的BaseData的list
	 */
	public List<BaseData> selectBaseDatas(Constraint constraint) throws Exception, RemoteException;
}
