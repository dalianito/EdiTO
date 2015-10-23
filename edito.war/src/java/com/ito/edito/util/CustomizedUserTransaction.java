package com.ito.edito.util;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import org.omg.CosTransactions.Current;
import org.omg.CosTransactions.HeuristicHazard;
import org.omg.CosTransactions.HeuristicMixed;
import org.omg.CosTransactions.NoTransaction;
import org.omg.CosTransactions.SubtransactionsUnavailable;

import com.arjuna.ats.jts.OTSManager;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class CustomizedUserTransaction {

	private static final String USERTRANSACTION = "UserTransaction";
	private static final String DISTRIBUTED = "distributed";

	private Current current = null;
	private UserTransaction ut = null;

	private Boolean isDistributed = false;

	public CustomizedUserTransaction() {
		String distributed = ConstantFactory.getConstant(DISTRIBUTED, "false");
		isDistributed = Boolean.valueOf(distributed);
	}

	public void initUT() {
		if (isDistributed) {
			current = OTSManager.get_current();
		}
		else {
			Context ctx = JndiFactory.getContext("ejbContext");
			try {
				ut = (UserTransaction) ctx.lookup(USERTRANSACTION);
			}
			catch (NamingException e) {
				e.printStackTrace();
			}
		}
	}

	public void begin() {
		if (isDistributed) {
			try {
				current.begin();
			}
			catch (SubtransactionsUnavailable e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				ut.begin();
			}
			catch (NotSupportedException e) {
				e.printStackTrace();
			}
			catch (SystemException e) {
				e.printStackTrace();
			}
		}
	}

	public void commit() {
		if (isDistributed) {
			try {
				current.commit(true);
			}
			catch (NoTransaction e) {
				e.printStackTrace();
			}
			catch (HeuristicHazard e) {
				e.printStackTrace();
			}
			catch (HeuristicMixed e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				ut.commit();
			}
			catch (SecurityException e) {
				e.printStackTrace();
			}
			catch (IllegalStateException e) {
				e.printStackTrace();
			}
			catch (RollbackException e) {
				e.printStackTrace();
			}
			catch (HeuristicMixedException e) {
				e.printStackTrace();
			}
			catch (HeuristicRollbackException e) {
				e.printStackTrace();
			}
			catch (SystemException e) {
				e.printStackTrace();
			}
		}
	}

	public void rollback() {
		if (isDistributed) {
			try {
				current.rollback();
			}
			catch (NoTransaction e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				ut.rollback();
			}
			catch (IllegalStateException e) {
				e.printStackTrace();
			}
			catch (SecurityException e) {
				e.printStackTrace();
			}
			catch (SystemException e) {
				e.printStackTrace();
			}
		}
	}
}
