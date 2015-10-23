package com.ito.edito.action.delete;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.DefaultOption;
import com.ito.fai.util.JndiFactory;

public class DeleteDefaultOptionAjaxAction extends AjaxAction {

    public void executeManualUT() throws Exception {
        String uuid = request.getParameter("uuid");
        DefaultOptionService defaultOptionService = (DefaultOptionService) JndiFactory.lookup("defaultOptionService"); 
        DefaultOption defaultOption = defaultOptionService.getDefaultOptionByUuid(uuid);
        defaultOption.setIfUsing(false);
        ut.begin();
        try{
            defaultOptionService.updateDefaultOption(defaultOption, USER.getAccount());
            ut.commit();
        } catch (Exception e){
            ut.rollback();
            throw e;
        }
    }
}