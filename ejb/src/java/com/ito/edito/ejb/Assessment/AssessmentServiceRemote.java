package com.ito.edito.ejb.Assessment;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>Assessment_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:ryan_cong@ito.com.cn">Ryan cong</a>
 */

@Remote
public interface AssessmentServiceRemote extends AssessmentService, EJBObject {
}
