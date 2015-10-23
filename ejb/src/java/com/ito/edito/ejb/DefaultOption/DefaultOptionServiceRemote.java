package com.ito.edito.ejb.DefaultOption;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>DefaultOption_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:yang_yu@edito.com.cn">Yang Yu</a>
 */

@Remote
public interface DefaultOptionServiceRemote extends DefaultOptionService, EJBObject {
}
