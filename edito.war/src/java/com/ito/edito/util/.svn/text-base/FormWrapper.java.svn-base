package com.ito.edito.util;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

public class FormWrapper {

    private Map<String, Object> dataMap;

    public FormWrapper(String data) {
        dataMap = new HashMap<String, Object>();
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            dataMap = objectMapper.readValue(data,
                    new TypeReference<HashMap<String, Object>>() {
                    });
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<String> getUuidListForKey(String key, String otherKey) {
        return getCheckBoxOtherFieldUuids(key, otherKey);
    }
    
    public List<String> getUuidListForKey(String key) {
        return getCheckBoxOtherFieldUuids(key, null);
    }

    // Helper Methods
    private List<String> getStringsFromFormDataMap(String key) {
        List<String> list = (List<String>) dataMap.get(key);
        if (list == null || list.size() == 0) {
            return null;
        }

        List<String> strings = new ArrayList<String>();
        for (String str : list) {
            if (str == null) {
                continue;
            }
            String[] strs = str.split(",");

            for (String s : strs) {
                strings.add(s);
            }
        }

        return strings;
    }

    private List<String> getCheckBoxOtherFieldUuids(String fieldName,
            String otherFieldName) {
        List<String> uuids = getStringsFromFormDataMap(fieldName);

        List<String> otherUuids;
        if (otherFieldName == null) {
            otherUuids = null;
        } else {
            otherUuids = getStringsFromFormDataMap(otherFieldName);
        }

        if (uuids == null && otherUuids != null) {
            return otherUuids;
        } else if (uuids != null && otherUuids == null) {
            return uuids;
        } else if (uuids == null && otherUuids == null) {
            return new ArrayList<String>();
        } else {
            uuids.addAll(otherUuids);
            return uuids;
        }
    }
}
