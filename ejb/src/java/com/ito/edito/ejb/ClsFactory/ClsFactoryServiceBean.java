package com.ito.edito.ejb.ClsFactory;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.ejb.Stateless;

import org.jboss.annotation.ejb.Clustered;
import org.jboss.annotation.ejb.RemoteBinding;
import org.jboss.annotation.ejb.RemoteBindings;

import com.ito.edito.ejb.DataManager.CastorDataManager;
import com.ito.fai.idp.DataManagerStatic;
import com.ito.fai.idp.core.Cls;
import com.ito.fai.idp.util.ClsFactory;

/**
 * <p>
 * <b>ClsFactory_EJB的实现文件</b>
 * </p>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Stateless
@Clustered
@RemoteBindings( { @RemoteBinding(factory = org.jboss.ejb3.iiop.IORFactory.class), @RemoteBinding() })
public class ClsFactoryServiceBean extends CastorDataManager implements ClsFactoryServiceRemote {
	/**
	 * 查询类(ucid)
	 * 
	 * @param ucid 类的ucid
	 * @return 包含该类的信息的HashMap
	 */
	public HashMap<String, String> selectClsByUcid(String ucid) throws Exception, RemoteException {
		// 查询类(ucid)
		Cls cls = ClsFactory.getClsByUCID(ucid);

		// 组装map
		HashMap<String, String> map = new HashMap<String, String>();
		if (cls != null) {
			map.put("ucid", cls.getUcid());
			map.put("name", cls.getName());
			map.put("chineseName", cls.getChinese());
		}

		return map;
	}

	/**
	 * 查询类(name)
	 * 
	 * @param name 类的name
	 * @return 包含该类的信息的HashMap
	 */
	public HashMap<String, String> selectClsByName(String name) throws Exception, RemoteException {
		// 查询类(name)
		Cls cls = ClsFactory.getClsByName(name);

		// 组装map
		HashMap<String, String> map = new HashMap<String, String>();
		if (cls != null) {
			map.put("ucid", cls.getUcid());
			map.put("name", cls.getName());
			map.put("chineseName", cls.getChinese());
		}

		return map;
	}

	/**
	 * 查询类(chineseName)
	 * 
	 * @param chineseName 类的chineseName
	 * @return 包含该类的信息的HashMap
	 */
	public HashMap<String, String> selectClsByChineseName(String chineseName) throws Exception, RemoteException {
		// 查询类(chineseName)
		Cls cls = ClsFactory.getClsByChinese(chineseName);

		// 组装map
		HashMap<String, String> map = new HashMap<String, String>();
		if (cls != null) {
			map.put("ucid", cls.getUcid());
			map.put("name", cls.getName());
			map.put("chineseName", cls.getChinese());
		}

		return map;
	}

	/**
	 * 查询类最大uuid
	 * 
	 * @param name 类的name
	 * @return 该类在数据库中存储的最大的uuid
	 */
	public String selectMaxUuid(String name) throws Exception, RemoteException {
		Cls cls = ClsFactory.getClsByName(name);
		StringBuffer sb = new StringBuffer("select max(c.uuid) from ").append(cls.getInstanceClassName()).append(" c where c.uuid like \"").append(cls.getUcid()).append("%\" ");
		ArrayList<?> resultList = DataManagerStatic.excuteQuery(cls.getSourceName(), sb.toString(), null);
		long sequence = Cls.DEFAULT_SEQUENCE;
		if (resultList.size() > 0) {
			String result = (String) resultList.get(0);
			if (result != null) {
				String ucidString = result.substring(Cls.UCID_LENGTH);
				long ucid = Long.parseLong(ucidString);
				if (ucid > sequence) {
					cls.setSequence(sequence = ucid);
				}
			}
		}

		return String.valueOf(sequence);
	}
}
