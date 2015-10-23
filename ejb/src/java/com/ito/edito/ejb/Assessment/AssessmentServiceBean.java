package com.ito.edito.ejb.Assessment;

import java.rmi.RemoteException;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.Assessment;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Assessment_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * Assessment<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class AssessmentServiceBean extends CastorDataManager implements AssessmentServiceRemote {
	/**
	 * <b>创建差错</b>
	 * 
	 * @param Assessment Assessment对象
	 * @param userName 执行者的账户名
	 * @return 创建的Assessment的uuid
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public String insertAssessment(Assessment Assessment, String userName) throws Exception, RemoteException {
		return DataManagerStatic.createInstance(Assessment, userName);
	}

	/**
	 * <b>更新差错</b>
	 * 
	 * @param Assessment Assessment对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void updateAssessment(Assessment Assessment, String userName) throws Exception, RemoteException {
		DataManagerStatic.updateInstance(Assessment, userName);
	}

	/**
	 * <b>删除差错</b>
	 * 
	 * @param Assessment Assessment对象
	 * @param userName 执行者的账户名
	 */
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public void deleteAssessment(Assessment Assessment, String userName) throws Exception, RemoteException {
		DataManagerStatic.removeInstance(Assessment, userName);
	}

	/**
	 * <b>查询差错(uuid)</b>
	 * 
	 * @param uuid Assessment的uuid
	 * @return 查询到的Assessment
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Assessment selectAssessmentByUuid(String uuid) throws Exception, RemoteException {
		return (Assessment) DataManagerStatic.getInstance(uuid);
	}

	/**
	 * <b>查询差错</b>
	 * 
	 * @param constraint Assessment的约束条件
	 * @return 查询到的Assessment
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public Assessment selectAssessment(Constraint constraint) throws Exception, RemoteException {
		return (Assessment) DataManagerStatic.getInstance(constraint);
	}

	/**
	 * <b>查询差错(list)</b>
	 * 
	 * @param constraint Assessment的约束条件
	 * @return 查询到的Assessment的list
	 */
	@SuppressWarnings("unchecked")
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public List<Assessment> selectAssessments(Constraint constraint) throws Exception, RemoteException {
		return (List<Assessment>) DataManagerStatic.getInstances(constraint);
	}
}
