package com.ito.edito.ejb.Performance;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>Performance_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Remote
public interface PerformanceServiceRemote extends PerformanceService, EJBObject {
}
