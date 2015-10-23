package com.ito.edito.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("unchecked")
public class CollectionUtil {
	private static final Integer ONE = new Integer(1);

	public static List intersection(List a, List b) {
		Map mapa = mapForCollection(a);
		Map mapb = mapForCollection(b);
		// 将两个集合里不重复的元素加进来，然后会依次遍历元素的出现次数
		Set set = new HashSet(a);
		set.addAll(b);
		List result = new ArrayList();
		for (Object obj : set) {
			for (int i = 0, m = Math.min(getCountsFromMap(obj, mapa), getCountsFromMap(obj, mapb)); i < m; i++) {
				result.add(obj);
			}
		}
		return result;
	}

	/**
	 * 循环遍历集合，并对每一个元素出现的次数计数<br/>
	 * 最终返回类似于{A:1,B:3,C:3}这样的map
	 * 
	 * @param a
	 * @return map
	 */
	private static Map mapForCollection(Collection a) {
		Map map = new HashMap();
		Iterator it = a.iterator();
		while (it.hasNext()) {
			Object obj = it.next();
			Integer count = (Integer) map.get(obj);
			if (count == null) {
				// 表明该元素第一次出现
				map.put(obj, ONE);
			}
			else {
				map.put(obj, new Integer(count.intValue() + 1));
			}
		}
		return map;
	}

	public static List set2list(Set set) {
		List result = new ArrayList();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			result.add((String) iterator.next());
		}
		return result;
	}

	private static int getCountsFromMap(Object obj, Map map) {
		Integer count = (Integer) map.get(obj);
		return count != null ? count.intValue() : 0;
	}
}
