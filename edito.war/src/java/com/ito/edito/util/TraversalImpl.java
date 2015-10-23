package com.ito.edito.util;

import java.lang.reflect.Method;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

import com.ito.edito.ejb.BaseData.BaseDataService;
import com.ito.edito.schema.BaseData;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.srt.Traversal;
import com.ito.fai.util.JndiFactory;

@SuppressWarnings("serial")
public class TraversalImpl extends UnicastRemoteObject implements Traversal {

	public TraversalImpl() throws RemoteException {
		super();
	}

	public String collectionSubNodeUuid(String uuid) throws RemoteException {
		return getChildItemUuid(uuid);
	}

	private String getChildItemUuid(String parentUuid) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("'").append(parentUuid).append("'");
		try {
			BaseDataService baseDataService = (BaseDataService) JndiFactory.lookup("baseDataService");
			BaseData bd = baseDataService.selectBaseDataByUuid(parentUuid);
			Class<?> cls = bd.getClass();
			String className = cls.getName();
			className = className.substring(className.lastIndexOf(".") + 1);
			String tmp = getChildItemUuid(bd, className);
			buffer.append(tmp);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}

	private String getChildItemUuid(BaseData bd, String className) {
		StringBuffer buffer = new StringBuffer();
		Constraint c = new Constraint(className);
		c.addCondition("parentUuid", bd.getUuid());
		try {
			BaseDataService baseDataService = (BaseDataService) JndiFactory.lookup("baseDataService");
			List<BaseData> list = baseDataService.selectBaseDatas(c);
			for (int i = 0; i < list.size(); i++) {
				BaseData in = list.get(i);
				buffer.append(",");
				buffer.append("'").append(in.getUuid()).append("'");
				Method method = in.getClass().getMethod("getIfHasChild");
				boolean ifHasChild = (Boolean) method.invoke(in);
				if (ifHasChild) {
					String tmp = getChildItemUuid(in, className);
					buffer.append(tmp);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
}
