package com.ito.edito.action.defaultoption;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.DefaultOption;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class ViewDefaultOptionsAction extends DefaultAction {

    private HashMap<String, List<DefaultOption>> defaultOptionsHash;
    private static final Map<String, String> attributeDisplayNameMap; 
    static
    {
        attributeDisplayNameMap = new HashMap<String, String>();
        attributeDisplayNameMap.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_MANNER, "咨询方式");
        attributeDisplayNameMap.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_SOURCE, "咨询来源");
        attributeDisplayNameMap.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_REFUSE_REASON, "学生拒绝原因");
        attributeDisplayNameMap.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_CONSIDERING_REASON, "学生考虑中原因");
    }

    public void executeManualUT() throws Exception {
        String entity = "consult";

        DefaultOptionService defaultOptionService = (DefaultOptionService) JndiFactory
                .lookup("defaultOptionService");
        List<DefaultOption> defaultOptions = defaultOptionService.getActiveDefaultOptionsByEntity(entity);
        
        hashDefaultOptionsByAttribute(defaultOptions);
    }
    
    private void hashDefaultOptionsByAttribute(List<DefaultOption> defaultOptions) {
        defaultOptionsHash = new HashMap<String, List<DefaultOption>>();
        
        defaultOptionsHash.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_MANNER, new ArrayList<DefaultOption>());
        defaultOptionsHash.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_CONSULT_SOURCE, new ArrayList<DefaultOption>());
        defaultOptionsHash.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_REFUSE_REASON, new ArrayList<DefaultOption>());
        defaultOptionsHash.put(Constants.DEFAULT_OPTION_CONSULT_ATTR_STUDENT_CONSIDERING_REASON, new ArrayList<DefaultOption>());
        
        String attribute;
        for (DefaultOption defaultOption : defaultOptions) {
            attribute = defaultOption.getAttribute();
            if (defaultOptionsHash.containsKey(attribute)) {
                defaultOptionsHash.get(attribute).add(defaultOption);
            }
        }
    }
    
    public HashMap<String, List<DefaultOption>> getDefaultOptionsHash() {
        return defaultOptionsHash;
    }

    public static Map<String, String> getAttributeDisplayNameMap() {
        return attributeDisplayNameMap;
    }
}
