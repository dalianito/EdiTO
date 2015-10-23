package com.ito.edito.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

public class Carrier implements Serializable {

	public static final long serialVersionUID = -3552135294509086039L;

	private static final String SCHEMA_PACKAGE = "com.ito.edito.schema.";
	private static final String SRT_PACKAGE2 = "com.ito.fai.srt.binding.";

	private static final String INDEXED_DELIM = "[";

	@SuppressWarnings("unchecked")
	private static final ArrayList ZERO = new ArrayList();

	@SuppressWarnings("unchecked")
	private HashMap objects = null;
	@SuppressWarnings("unchecked")
	private HashMap objectsList = null;

	@SuppressWarnings("unchecked")
	public Carrier() {
		objects = new HashMap();
		objectsList = new HashMap();
	}

	/**
	 * 获取名为className的java实例
	 * 
	 * @param className schema中的java类名
	 * @return Object 名为className的java实例
	 * @throws Exception
	 */
	public Object fetchInstance(String className) {
		return objects.get(className);
	}

	/**
	 * 获取名为className的java实例的列表
	 * 
	 * @param className schema中的java类名
	 * @return ArrayList 名为className的java实例列表
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public ArrayList fetchInstances(String className) {
		ArrayList list = (ArrayList) objectsList.get(className);
		if (list != null) {
			return list;
		}
		else {
			return ZERO;
		}
	}

	/**
	 * 供BeanUtils调用
	 * 
	 * @param javabeanName schema中的类名(不含包名,但可以形如Customer[1],即支持数组)
	 * @return Object 名为javabeanName的java实例
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Object getInstance(String javabeanName) throws Exception {
		if (javabeanName == null) {
			throw new Exception("instance().··· is not valid, it must like instance(Employee).···");
		}
		Object object = objects.get(javabeanName);
		if (object == null) {
			int index = javabeanName.indexOf(INDEXED_DELIM);
			boolean flag = index > 0;
			String className = flag ? javabeanName.substring(0, index) : javabeanName;
			Class c = Class.forName(SCHEMA_PACKAGE + className);
			object = c.newInstance();
			objects.put(javabeanName, object);
			if (flag) {
				storeInstanceToList(className, object);
			}
			return object;
		}
		else {
			return object;
		}
	}

	/**
	 * 供BeanUtils调用
	 * 
	 * @param javabeanName schema中的类名(不含包名,但可以形如Customer[1],即支持数组)
	 * @return Object 名为javabeanName的java实例
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Object getBinding(String javabeanName) throws Exception {
		if (javabeanName == null) {
			throw new Exception("binding().··· is not valid, it must like binding(Employee).···");
		}
		Object object = objects.get(javabeanName);
		if (object == null) {
			int index = javabeanName.indexOf(INDEXED_DELIM);
			boolean flag = index > 0;
			String className = flag ? javabeanName.substring(0, index) : javabeanName;
			Class c = Class.forName(SRT_PACKAGE2 + className);
			object = c.newInstance();
			objects.put(javabeanName, object);
			if (flag) {
				storeInstanceToList(className, object);
			}
			return object;
		}
		else {
			return object;
		}
	}

	@SuppressWarnings("unchecked")
	private void storeInstanceToList(String className, Object object) {
		ArrayList list = (ArrayList) objectsList.get(className);
		if (list == null) {
			list = new ArrayList();
			list.add(object);
			objectsList.put(className, list);
		}
		else {
			list.add(object);
		}
	}
}
