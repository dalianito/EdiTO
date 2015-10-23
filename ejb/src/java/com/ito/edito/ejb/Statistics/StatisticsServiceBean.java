package com.ito.edito.ejb.Statistics;

import java.rmi.RemoteException;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.edito.schema.JdoVirtual;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Statistics_EJB的实现文件</b>
 * </p>
 * 实现对下列表进行数据库操作：<br>
 * JdoVirtual<br>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class StatisticsServiceBean extends CastorDataManager implements StatisticsServiceRemote {
	/**
	 * <b>查询JAVA数据对象虚拟表</b>
	 * 
	 * @param constraint JdoVirtual的约束条件
	 * @return 查询到的JdoVirtual
	 */
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public JdoVirtual selectJdoVirtual(Constraint constraint) throws Exception, RemoteException {
		return (JdoVirtual) DataManagerStatic.getInstance(constraint);
	}
}
