package com.ito.edito.action.update;

import java.rmi.RemoteException;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.DefaultOption.DefaultOptionService;
import com.ito.edito.schema.DefaultOption;
import com.ito.fai.util.JndiFactory;

public class UpdateDefaultOptionAjaxAction extends AjaxAction {

    public void executeManualUT() throws Exception {

        DefaultOptionService defaultOptionService = (DefaultOptionService) JndiFactory
                .lookup("defaultOptionService");
        String uuid = request.getParameter("uuid");
        String description = request.getParameter("description");

        String entity = request.getParameter("entity");
        String attribute = request.getParameter("attribute");

        if (uuid.equals("")) {
            uuid = getOrCreateDefaultOption(entity, attribute, description,
                    defaultOptionService);
            setResponseText("{\"status\":\"success\", \"uuid\":\"" + uuid
                    + "\"}");
        } else {
            updateDefaultOptionDescription(uuid, description,
                    defaultOptionService);
        }
    }

    private String getOrCreateDefaultOption(String entity, String attribute,
            String description, DefaultOptionService defaultOptionService) throws RemoteException, Exception {
        
        String uuid = null;

        DefaultOption defaultOption = defaultOptionService
                .getDefaultOptionByEntityAndAttributeAndDescription(entity,
                        attribute, description);
        
        if (defaultOption == null) {
            defaultOption = new DefaultOption();
            defaultOption.setEntity(entity);
            defaultOption.setAttribute(attribute);
            defaultOption.setDescription(description);
            defaultOption.setIfUsing(true);
            uuid = insertDefaultOptionTransaction(defaultOption, defaultOptionService);
        } else {
            uuid = defaultOption.getUuid();
            defaultOption.setIfUsing(true);
            updateDefaultOptionTransaction(defaultOption, defaultOptionService);
        }
        
        return uuid;
    }

    private void updateDefaultOptionDescription(String uuid, String description, DefaultOptionService defaultOptionService)
            throws RemoteException, Exception {

        DefaultOption defaultOption = defaultOptionService.getDefaultOptionByUuid(uuid);
        defaultOption.setDescription(description);

        updateDefaultOptionTransaction(defaultOption, defaultOptionService);
    }
    
    private String insertDefaultOptionTransaction(DefaultOption defaultOption, DefaultOptionService defaultOptionService) throws Exception {
        String newUuid = null;
        
        ut.begin();
        try {
            newUuid = defaultOptionService.insertDefaultOption(defaultOption, USER.getAccount());
            ut.commit();
        } catch(Exception e) {
            ut.rollback();
            throw e;
        }
        
        return newUuid;
    }
    
    private void updateDefaultOptionTransaction(DefaultOption defaultOption, DefaultOptionService defaultOptionService) throws Exception {
        ut.begin();
        try {
            defaultOptionService.updateDefaultOption(defaultOption, USER.getAccount());
            ut.commit();
        } catch (Exception e) {
            ut.rollback();
            throw e;
        }
    }
}
