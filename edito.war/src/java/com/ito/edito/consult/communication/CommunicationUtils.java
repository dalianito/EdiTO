package com.ito.edito.consult.communication;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CommunicationUtils {
    @SuppressWarnings("unchecked")
    public static List<String> getStringsFromFormDataMap(Map<String, Object> formDataMap, String key) {
        List<String> list = (List<String>) formDataMap.get(key);
        if (list == null || list.size() == 0) {
            return null;
        }
        
        List<String> strings = new ArrayList<String>();
        for (String str : list){
            String[] strs = str.split(",");
            
            for (String s : strs) {
                strings.add(s);
            }
        }
        
        return strings;
    }
}
