package com.ito.edito.util;

import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CommonUtils {
    
    public static String getCurrentEmployeeUuid(String personUuid) throws Exception{
        Constraint constraint = new Constraint("Employee");
        constraint.addCondition("personUuid", personUuid);
        UserService userService = (UserService) JndiFactory.lookup("userService");
        Employee employee = userService.selectEmployee(constraint); 
        return employee == null ? null : employee.getUuid(); 
    }

}
