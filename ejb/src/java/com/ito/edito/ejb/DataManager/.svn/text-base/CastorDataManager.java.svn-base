package com.ito.edito.ejb.DataManager;

import java.rmi.RemoteException;
import java.util.Hashtable;

import javax.ejb.EJBHome;
import javax.ejb.EJBObject;
import javax.ejb.Handle;
import javax.ejb.RemoveException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import org.omg.CORBA.ORB;

import com.ito.fai.idp.DataManager;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public abstract class CastorDataManager {
	private static final String DATA_MANAGER_NAME = "DataManager";
	private static final String DISTRIBUTED = "distributed";

	private Boolean isDistributed = false;

	public CastorDataManager() {
	}

	public EJBHome getEJBHome() throws RemoteException {
		return null;
	}

	public Object getPrimaryKey() throws RemoteException {
		return null;
	}

	public void remove() throws RemoteException, RemoveException {
	}

	public Handle getHandle() throws RemoteException {
		return null;
	}

	public boolean isIdentical(EJBObject p_EJBObject) throws RemoteException {
		return false;
	}

	@SuppressWarnings("unchecked")
	public DataManager getDataManager() throws Exception {
		String distributed = ConstantFactory.getConstant(DISTRIBUTED, "false");
		isDistributed = Boolean.valueOf(distributed);
		DataManager dm;
		if (isDistributed) {
			Context ctx = JndiFactory.getContext("dmContext");
			Hashtable<Object, Object> temp = (Hashtable<Object, Object>) ctx.getEnvironment();
			ORB orb = (ORB) new InitialContext().lookup("java:comp/ORB");
			if (orb != null) {
				temp.put("java.naming.corba.orb", orb);
				// temp.put(Context.OBJECT_FACTORIES,"org.jboss.tm.iiop.client.IIOPClientUserTransactionObjectFactory");
			}
			ctx = new InitialContext(temp);
			org.omg.CORBA.Object obj = (org.omg.CORBA.Object) ctx.lookup(DATA_MANAGER_NAME);
			dm = (DataManager) PortableRemoteObject.narrow(obj, DataManager.class);
		}
		else {
			dm = (DataManager) JndiFactory.lookup(DATA_MANAGER_NAME);
		}
		return dm;
	}
}
