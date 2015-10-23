package com.ito.edito.ejb.Teacher;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>Teacher_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Remote
public interface TeacherServiceRemote extends TeacherService, EJBObject {
}
