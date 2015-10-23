package com.ito.edito.ejb.BaseData;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.BaseData;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>BaseData_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * 所有基表<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class BaseDataServiceBean extends CastorDataManager implements BaseDataServiceRemote {
	/**
	 * <b>创建基表数据</b>
	 * 
	 * @param baseData BaseData对象
	 * @param userName 执行者的账户名
	 * @return 创建的BaseData的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertBaseData(BaseData baseData, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(baseData, userName);
	}

	/**
	 * <b>更新基表数据</b>
	 * 
	 * @param baseData BaseData对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateBaseData(BaseData baseData, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(baseData, userName);
	}

	/**
	 * <b>查询基表数据(uuid)</b>
	 * 
	 * @param uuid BaseData的uuid
	 * @return 查询到的BaseData
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public BaseData selectBaseDataByUuid(String uuid) throws Exception, RemoteException {
		return (BaseData) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询基表数据</b>
	 * 
	 * @param constraint BaseData的约束条件
	 * @return 查询到的BaseData
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public BaseData selectBaseData(Constraint constraint) throws Exception, RemoteException {
		return (BaseData) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询基表数据(list)</b>
	 * 
	 * @param constraint BaseData的约束条件
	 * @return 查询到的BaseData的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<BaseData> selectBaseDatas(Constraint constraint) throws Exception, RemoteException {
		return (List<BaseData>) DataManagerStatic.getInstances(constraint);
	}
}
