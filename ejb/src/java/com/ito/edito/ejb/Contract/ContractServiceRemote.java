package com.ito.edito.ejb.Contract;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>Contract_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:sean_liu@ito.com.cn">Sean Liu</a>
 */

@Remote
public interface ContractServiceRemote extends ContractService, EJBObject {
}
