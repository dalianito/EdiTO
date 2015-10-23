package com.ito.edito.consult.communication;

import java.lang.reflect.Field;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Person;
import com.ito.fai.util.JndiFactory;

public class UpdateStudentBasicInfoAjaxAction extends AjaxAction {
    public void executeManualUT() throws Exception {
        String personUuid = request.getParameter("pk");
        String fieldName = request.getParameter("name");
        String value = request.getParameter("value");
        System.out.println(fieldName);
        System.out.println(value);
        System.out.println(personUuid);
        
        
        UserService userService = (UserService) JndiFactory
                .lookup("userService");
        Person person = userService.selectPersonByUuid(personUuid);

        ut.begin();
        try {
            Class personClass = person.getClass();
            boolean fieldFound = false;
            for (Field field : personClass.getDeclaredFields()) {
                if (field.getName().equals(fieldName)){
                    field = personClass.getDeclaredField(fieldName); 
                    field.setAccessible(true);
                    if (field.getType().getName().equals(value.getClass().getName())) {
                        field.set(person, value);
                    } else {
                        field.set(person, Integer.getInteger(value));
                    }
                    fieldFound = true;
                    break;
                }
            }

            if (fieldFound){
                userService.updatePerson(person, USER.getAccount());
            }
            
            ut.commit();
        } catch (Exception e) {
            e.printStackTrace();
            ut.rollback();
        }

        setResponseText("hello world");
    }

}
