package com.ito.edito.ejb.ClsFactory;

import java.rmi.RemoteException;
import java.util.HashMap;

/**
 * <p>
 * <b>ClsFactory_EJB的接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

public interface ClsFactoryService {
	/**
	 * 查询类(ucid)
	 * 
	 * @param ucid 类的ucid
	 * @return 包含该类的信息的HashMap
	 */
	public HashMap<String, String> selectClsByUcid(String ucid) throws Exception, RemoteException;

	/**
	 * 查询类(name)
	 * 
	 * @param name 类的name
	 * @return 包含该类的信息的HashMap
	 */
	public HashMap<String, String> selectClsByName(String name) throws Exception, RemoteException;

	/**
	 * 查询类(chineseName)
	 * 
	 * @param chineseName 类的chineseName
	 * @return 包含该类的信息的HashMap
	 */
	public HashMap<String, String> selectClsByChineseName(String chineseName) throws Exception, RemoteException;

	/**
	 * 查询类最大uuid
	 * 
	 * @param name 类的name
	 * @return 该类在数据库中存储的最大的uuid
	 */
	public String selectMaxUuid(String name) throws Exception, RemoteException;
}
