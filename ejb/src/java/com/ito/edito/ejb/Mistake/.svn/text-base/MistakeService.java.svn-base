package com.ito.edito.ejb.Mistake;

import java.rmi.RemoteException;
import java.util.List;

import com.ito.edito.schema.Mistake;
import com.ito.fai.idp.core.Constraint;

/**
 * <p>
 * <b>Mistake_EJB的接口文件</b>
 * </p>
 * 提供对下列表进行数据库操作的接口：<br>
 * Mistake<br>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

public interface MistakeService {
	/**
	 * <b>创建差错</b>
	 * 
	 * @param mistake Mistake对象
	 * @param userName 执行者的账户名
	 * @return 创建的Mistake的uuid
	 */
	public String insertMistake(Mistake mistake, String userName) throws Exception, RemoteException;

	/**
	 * <b>更新差错</b>
	 * 
	 * @param mistake Mistake对象
	 * @param userName 执行者的账户名
	 */
	public void updateMistake(Mistake mistake, String userName) throws Exception, RemoteException;

	/**
	 * <b>删除差错</b>
	 * 
	 * @param mistake Mistake对象
	 * @param userName 执行者的账户名
	 */
	public void deleteMistake(Mistake mistake, String userName) throws Exception, RemoteException;

	/**
	 * <b>查询差错(uuid)</b>
	 * 
	 * @param uuid Mistake的uuid
	 * @return 查询到的Mistake
	 */
	public Mistake selectMistakeByUuid(String uuid) throws Exception, RemoteException;

	/**
	 * <b>查询差错</b>
	 * 
	 * @param constraint Mistake的约束条件
	 * @return 查询到的Mistake
	 */
	public Mistake selectMistake(Constraint constraint) throws Exception, RemoteException;

	/**
	 * <b>查询差错(list)</b>
	 * 
	 * @param constraint Mistake的约束条件
	 * @return 查询到的Mistake的list
	 */
	public List<Mistake> selectMistakes(Constraint constraint) throws Exception, RemoteException;

}
