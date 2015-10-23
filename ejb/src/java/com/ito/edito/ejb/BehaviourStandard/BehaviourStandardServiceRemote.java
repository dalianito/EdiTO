package com.ito.edito.ejb.BehaviourStandard;

import javax.ejb.EJBObject;
import javax.ejb.Remote;

/**
 * <p>
 * <b>BehaviourStandard_EJB的远程接口文件</b>
 * </p>
 * 
 * @author <a href="mailto:lanka_li@ito.com.cn">Lanka Li</a>
 */

@Remote
public interface BehaviourStandardServiceRemote extends BehaviourStandardService, EJBObject {
}
