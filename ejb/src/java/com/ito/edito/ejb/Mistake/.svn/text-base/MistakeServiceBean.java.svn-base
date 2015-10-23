package com.ito.edito.ejb.Mistake;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.Mistake;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;
/**
 * <p>
 * <b>Mistake_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Mistake<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class MistakeServiceBean extends CastorDataManager implements MistakeServiceRemote {
	/**
	 * <b>创建差错</b>
	 * 
	 * @param mistake Mistake对象
	 * @param userName 执行者的账户名
	 * @return 创建的Mistake的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertMistake(Mistake mistake, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(mistake, userName);
	}

	/**
	 * <b>更新差错</b>
	 * 
	 * @param mistake Mistake对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateMistake(Mistake mistake, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(mistake, userName);
	}

	/**
	 * <b>删除差错</b>
	 * 
	 * @param mistake Mistake对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteMistake(Mistake mistake, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(mistake, userName);
	}

	/**
	 * <b>查询差错(uuid)</b>
	 * 
	 * @param uuid Mistake的uuid
	 * @return 查询到的Mistake
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Mistake selectMistakeByUuid(String uuid) throws Exception, RemoteException {
		return (Mistake) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询差错</b>
	 * 
	 * @param constraint Mistake的约束条件
	 * @return 查询到的Mistake
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Mistake selectMistake(Constraint constraint) throws Exception, RemoteException {
		return (Mistake) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询差错(list)</b>
	 * 
	 * @param constraint Mistake的约束条件
	 * @return 查询到的Mistake的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Mistake> selectMistakes(Constraint constraint) throws Exception, RemoteException {
		return (List<Mistake>) DataManagerStatic.getInstances(constraint);
	}
}
