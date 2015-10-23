package com.ito.edito.ejb.Material;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>Material_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Remote
public interface MaterialServiceRemote extends MaterialService, EJBObject {
}
